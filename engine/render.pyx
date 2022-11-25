cimport cython

from libc cimport math
from libc.stdio cimport *
from libc.stdlib cimport malloc, free

from engine.libs.glad cimport *
from engine.libs.cglm cimport *

from engine.shader cimport *
from engine.texture cimport Texture

import sys


cdef struct QuadVertex:
    vec3 position
    vec4 color
    vec2 tex_coord
    float tex_index


cdef struct CircleVertex:
    vec3 position
    vec2 local_position
    vec4 color
    float thickness
    float fade


cdef struct RectangleVertex:
    vec3 position
    vec2 local_position
    vec4 color
    vec2 thickness
    vec2 fade


cdef struct LineVertex:
    vec3 position
    vec4 color


cdef class Renderer:
    cdef:
        unsigned int MAX_QUADS
        unsigned int MAX_VERTICES
        unsigned int MAX_INDICES
        unsigned int MAX_TEXTURE_SLOTS

        # shaders
        Shader quad_shader
        Shader circle_shader
        Shader rectangle_shader
        Shader line_shader
        Shader shaders[4]

        # quad attribs
        GLuint quad_vao
        GLuint quad_vbo
        GLuint quad_ebo
        unsigned int quad_count
        QuadVertex *quad_vertices
        QuadVertex *quad_vertices_ptr

        GLuint *texture_slots
        size_t texture_slot_index

        # circle attribs
        GLuint circle_vao
        GLuint circle_vbo
        GLuint circle_ebo
        unsigned int circle_count
        CircleVertex *circle_vertices
        CircleVertex *circle_vertices_ptr

        # rectangle attribs
        GLuint rectangle_vao
        GLuint rectangle_vbo
        GLuint rectangle_ebo
        unsigned int rectangle_count
        RectangleVertex *rectangle_vertices
        RectangleVertex *rectangle_vertices_ptr

        # line attribs
        GLuint line_vao
        GLuint line_vbo
        GLuint line_ebo
        unsigned int line_count
        LineVertex *line_vertices
        LineVertex *line_vertices_ptr


    def __init__(self):
        self.MAX_QUADS = 100000
        self.MAX_VERTICES = self.MAX_QUADS * 4
        self.MAX_INDICES = self.MAX_QUADS * 6
        self.MAX_TEXTURE_SLOTS = 16

        glEnable(GL_BLEND)
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)

        # shader stuff ----------------------------------------- #
        shader_create(&self.quad_shader, b'./engine/shaders/quad.vert', b'./engine/shaders/quad.frag')
        shader_create(&self.circle_shader, b'./engine/shaders/circle.vert', b'./engine/shaders/circle.frag')
        shader_create(&self.rectangle_shader, b'./engine/shaders/rectangle.vert', b'./engine/shaders/rectangle.frag')
        shader_create(&self.line_shader, b'./engine/shaders/line.vert', b'./engine/shaders/line.frag')
        self.shaders = [self.quad_shader, self.circle_shader, self.rectangle_shader, self.line_shader]

        # set sampler2Ds
        shader_use(&self.quad_shader)
        cdef GLint *values = <GLint *>malloc(self.MAX_TEXTURE_SLOTS * sizeof(GLint))
        cdef size_t i
        for i in range(self.MAX_TEXTURE_SLOTS):
            values[i] = i
        shader_set_int_array(&self.quad_shader, 'u_Textures', self.MAX_TEXTURE_SLOTS, values)
        free(values)

        # quad initialization ----------------------------------------- #
        self.quad_vertices = <QuadVertex *>malloc(self.MAX_VERTICES * sizeof(QuadVertex))

        glGenVertexArrays(1, &self.quad_vao)
        glBindVertexArray(self.quad_vao)

        glGenBuffers(1, &self.quad_vbo)
        glBindBuffer(GL_ARRAY_BUFFER, self.quad_vbo)
        glBufferData(
            GL_ARRAY_BUFFER, self.MAX_VERTICES * sizeof(QuadVertex), NULL, GL_DYNAMIC_DRAW
        )

        # 3 position, 4 color, 2 tex_coord, 1 tex_index
        glEnableVertexAttribArray(0)
        glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, sizeof(QuadVertex), <void *><size_t>&(<QuadVertex *>0).position)

        glEnableVertexAttribArray(1)
        glVertexAttribPointer(1, 4, GL_FLOAT, GL_FALSE, sizeof(QuadVertex), <void *><size_t>&(<QuadVertex *>0).color)

        glEnableVertexAttribArray(2)
        glVertexAttribPointer(2, 2, GL_FLOAT, GL_FALSE, sizeof(QuadVertex), <void *><size_t>&(<QuadVertex *>0).tex_coord)

        glEnableVertexAttribArray(3)
        glVertexAttribPointer(3, 1, GL_FLOAT, GL_FALSE, sizeof(QuadVertex), <void *><size_t>&(<QuadVertex *>0).tex_index)

        # generate index buffer and buffer data
        cdef unsigned int *indices = <unsigned int *>malloc(self.MAX_INDICES * sizeof(unsigned int))
        cdef int offset = 0
        for i in range(0, self.MAX_INDICES, 6):
            indices[i + 0] = offset + 0
            indices[i + 1] = offset + 1
            indices[i + 2] = offset + 2
            indices[i + 3] = offset + 2
            indices[i + 4] = offset + 3
            indices[i + 5] = offset + 0
            offset += 4

        glGenBuffers(1, &self.quad_ebo)
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, self.quad_ebo)
        glBufferData(
            GL_ELEMENT_ARRAY_BUFFER, 
            self.MAX_INDICES * sizeof(unsigned int), indices, GL_STATIC_DRAW
        )

        self.texture_slots = <GLuint *>malloc(self.MAX_TEXTURE_SLOTS * sizeof(GLuint))

        # circle initialization ----------------------------------------- #
        self.circle_vertices = <CircleVertex *>malloc(self.MAX_VERTICES * sizeof(CircleVertex))

        glGenVertexArrays(1, &self.circle_vao)
        glBindVertexArray(self.circle_vao)

        glGenBuffers(1, &self.circle_vbo)
        glBindBuffer(GL_ARRAY_BUFFER, self.circle_vbo)
        glBufferData(
            GL_ARRAY_BUFFER, self.MAX_VERTICES * sizeof(CircleVertex), NULL, GL_DYNAMIC_DRAW
        )

        # 3 position, 2 local_position, 4 color, 1 thickness, 1 fade
        glEnableVertexAttribArray(0)
        glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, sizeof(CircleVertex), <void *><size_t>&(<CircleVertex *>0).position)

        glEnableVertexAttribArray(1)
        glVertexAttribPointer(1, 2, GL_FLOAT, GL_FALSE, sizeof(CircleVertex), <void *><size_t>&(<CircleVertex *>0).local_position)

        glEnableVertexAttribArray(2)
        glVertexAttribPointer(2, 3, GL_FLOAT, GL_FALSE, sizeof(CircleVertex), <void *><size_t>&(<CircleVertex *>0).color)

        glEnableVertexAttribArray(3)
        glVertexAttribPointer(3, 1, GL_FLOAT, GL_FALSE, sizeof(CircleVertex), <void *><size_t>&(<CircleVertex *>0).thickness)

        glEnableVertexAttribArray(4)
        glVertexAttribPointer(4, 1, GL_FLOAT, GL_FALSE, sizeof(CircleVertex), <void *><size_t>&(<CircleVertex *>0).fade)

        glGenBuffers(1, &self.circle_ebo)
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, self.circle_ebo)
        glBufferData(
            GL_ELEMENT_ARRAY_BUFFER, 
            self.MAX_INDICES * sizeof(unsigned int), indices, GL_STATIC_DRAW
        )

        # rectangle initialization ----------------------------------------- #
        self.rectangle_vertices = <RectangleVertex *>malloc(self.MAX_VERTICES * sizeof(RectangleVertex))

        glGenVertexArrays(1, &self.rectangle_vao)
        glBindVertexArray(self.rectangle_vao)

        glGenBuffers(1, &self.rectangle_vbo)
        glBindBuffer(GL_ARRAY_BUFFER, self.rectangle_vbo)
        glBufferData(
            GL_ARRAY_BUFFER, self.MAX_VERTICES * sizeof(RectangleVertex), NULL, GL_DYNAMIC_DRAW
        )

        # 3 position, 2 local_position, 4 color, 2 thickness, 2 fade
        glEnableVertexAttribArray(0)
        glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, sizeof(RectangleVertex), <void *><size_t>&(<RectangleVertex *>0).position)

        glEnableVertexAttribArray(1)
        glVertexAttribPointer(1, 2, GL_FLOAT, GL_FALSE, sizeof(RectangleVertex), <void *><size_t>&(<RectangleVertex *>0).local_position)

        glEnableVertexAttribArray(2)
        glVertexAttribPointer(2, 3, GL_FLOAT, GL_FALSE, sizeof(RectangleVertex), <void *><size_t>&(<RectangleVertex *>0).color)

        glEnableVertexAttribArray(3)
        glVertexAttribPointer(3, 2, GL_FLOAT, GL_FALSE, sizeof(RectangleVertex), <void *><size_t>&(<RectangleVertex *>0).thickness)

        glEnableVertexAttribArray(4)
        glVertexAttribPointer(4, 2, GL_FLOAT, GL_FALSE, sizeof(RectangleVertex), <void *><size_t>&(<RectangleVertex *>0).fade)

        glGenBuffers(1, &self.rectangle_ebo)
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, self.rectangle_ebo)
        glBufferData(
            GL_ELEMENT_ARRAY_BUFFER, 
            self.MAX_INDICES * sizeof(unsigned int), indices, GL_STATIC_DRAW
        )

        # line initialization ----------------------------------------- #
        self.line_vertices = <LineVertex *>malloc(self.MAX_VERTICES * sizeof(LineVertex))

        glGenVertexArrays(1, &self.line_vao)
        glBindVertexArray(self.line_vao)

        glGenBuffers(1, &self.line_vbo)
        glBindBuffer(GL_ARRAY_BUFFER, self.line_vbo)
        glBufferData(
            GL_ARRAY_BUFFER, self.MAX_VERTICES * sizeof(LineVertex), NULL, GL_DYNAMIC_DRAW
        )

        # 3 position, 4 color
        glEnableVertexAttribArray(0)
        glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, sizeof(LineVertex), <void *><size_t>&(<LineVertex *>0).position)

        glEnableVertexAttribArray(1)
        glVertexAttribPointer(1, 4, GL_FLOAT, GL_FALSE, sizeof(LineVertex), <void *><size_t>&(<LineVertex *>0).color)

        glGenBuffers(1, &self.line_ebo)
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, self.line_ebo)
        glBufferData(
            GL_ELEMENT_ARRAY_BUFFER, 
            self.MAX_INDICES * sizeof(unsigned int), indices, GL_STATIC_DRAW
        )

        free(indices)


    def __del__(self):
        cdef Shader shader
        for shader in self.shaders:
            shader_destroy(&shader)

        free(self.quad_vertices)
        free(self.circle_vertices)
        free(self.rectangle_vertices)
        free(self.line_vertices)

        free(self.texture_slots)


    def set_size(self, int width, int height):
        cdef mat4 proj_matrix
        glm_ortho(0, width, 0, height, 0, 1, proj_matrix)
        cdef Shader shader
        for shader in self.shaders:
            shader_use(&shader)
            shader_set_mat4(&shader, b"u_Proj", proj_matrix)


    def set_clear_color(self, color):
        glClearColor(
            color[0] / 255.0,
            color[1] / 255.0,
            color[2] / 255.0,
            color[3] / 255.0
        )
    

    def clear(self):
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)


    # begin functions --------------------------------- #
    cdef void _begin_quad_batch(self):
        self.quad_count = 0
        self.quad_vertices_ptr = self.quad_vertices
        self.texture_slot_index = 1


    cdef void _begin_circle_batch(self):
        self.circle_count = 0
        self.circle_vertices_ptr = self.circle_vertices


    cdef void _begin_rectangle_batch(self):
        self.rectangle_count = 0
        self.rectangle_vertices_ptr = self.rectangle_vertices


    cdef void _begin_line_batch(self):
        self.line_count = 0
        self.line_vertices_ptr = self.line_vertices


    def begin(self, py_view_matrix=None):
        cdef mat4 view_matrix
        if py_view_matrix is not None:
            py_to_glm_mat4(py_view_matrix, view_matrix)
        else:
            glm_mat4_identity(view_matrix)

        cdef Shader shader
        for shader in self.shaders:
            shader_use(&shader)
            shader_set_mat4(&shader, 'u_View', view_matrix)

        self._begin_quad_batch()
        # self._begin_circle_batch()
        self._begin_rectangle_batch()
        # self._begin_line_batch()


    # end functions --------------------------------- #
    cdef void _end_quad_batch(self):
        glBindBuffer(GL_ARRAY_BUFFER, self.quad_vbo)
        glBufferSubData(
            GL_ARRAY_BUFFER, 0, 
            self.quad_count * 4 * sizeof(QuadVertex),
            self.quad_vertices
        )

        cdef size_t i
        for i in range(self.texture_slot_index):
            glActiveTexture(GL_TEXTURE0 + i)
            glBindTexture(GL_TEXTURE_2D, self.texture_slots[i])

        shader_use(&self.quad_shader)
        glBindVertexArray(self.quad_vao)
        glDrawElements(GL_TRIANGLES, self.quad_count * 6, GL_UNSIGNED_INT, NULL)


    cdef void _end_circle_batch(self):
        glBindBuffer(GL_ARRAY_BUFFER, self.circle_vbo)
        glBufferSubData(
            GL_ARRAY_BUFFER, 0, 
            self.circle_count * 4 * sizeof(CircleVertex),
            self.circle_vertices
        )

        shader_use(&self.circle_shader)
        glBindVertexArray(self.circle_vao)
        glDrawElements(GL_TRIANGLES, self.circle_count * 6, GL_UNSIGNED_INT, NULL)


    cdef void _end_rectangle_batch(self):
        glBindBuffer(GL_ARRAY_BUFFER, self.rectangle_vbo)
        glBufferSubData(
            GL_ARRAY_BUFFER, 0, 
            self.rectangle_count * 4 * sizeof(RectangleVertex),
            self.rectangle_vertices
        )

        shader_use(&self.rectangle_shader)
        glBindVertexArray(self.rectangle_vao)
        glDrawElements(GL_TRIANGLES, self.rectangle_count * 6, GL_UNSIGNED_INT, NULL)


    cdef void _end_line_batch(self):
        glBindBuffer(GL_ARRAY_BUFFER, self.line_vbo)
        glBufferSubData(
            GL_ARRAY_BUFFER, 0, 
            self.line_count * 4 * sizeof(LineVertex),
            self.line_vertices
        )

        shader_use(&self.line_shader)
        glBindVertexArray(self.line_vao)
        glDrawElements(GL_TRIANGLES, self.line_count * 6, GL_UNSIGNED_INT, NULL)


    def end(self):
        self._end_quad_batch()
        # self._end_circle_batch()
        self._end_rectangle_batch()
        # self._end_line_batch()

    # drawing -------------------------------------- #
    cdef void _handle_color(self, py_color, vec4 color):
        if (len(py_color) == 3):
            color[:4] = [py_color[0]/255.0, py_color[1]/255.0, py_color[2]/255.0, 1.0]
        else:
            color[:4] = [py_color[0]/255.0, py_color[1]/255.0, py_color[2]/255.0, py_color[3]/255.0]


    def draw_texture(self, Texture texture, position, float rotation=0.0, offset=[0.0, 0.0], bint flipped=False, color=[255, 255, 255, 255]):
        cdef GLuint texture_id = texture.texture_id
        cdef vec2 t_position = [position[0], position[1]]
        cdef vec2 t_size = [texture.width, texture.height]
        cdef vec2 t_offset = [offset[0], offset[1]]
        cdef vec4 t_color
        self._handle_color(color, t_color)

        self._draw_texture(texture_id, t_position, t_size, rotation, t_offset, flipped, t_color)


    cdef void _draw_texture(self, GLuint texture_id, vec2 position, vec2 size, float rotation, vec2 offset, bint flipped, vec4 color):
        cdef size_t i

        if (self.quad_count >= self.MAX_QUADS or self.texture_slot_index >= self.MAX_TEXTURE_SLOTS):
            self._end_quad_batch()
            self._begin_quad_batch()

        cdef float rad_rotation = rotation * math.pi / 180.0

        cdef float texture_index = 0.0
        for i in range(1, self.texture_slot_index):
            if (self.texture_slots[i] == texture_id):
                texture_index = <float>i
                break

        if (texture_index == 0.0):
            texture_index = <float>self.texture_slot_index
            self.texture_slots[self.texture_slot_index] = texture_id
            self.texture_slot_index += 1

        cdef vec3[4] positions = [
            [0, 0, 0],
            [size[0], 0, 0],
            [size[0], size[1], 0],
            [0, size[1], 0]
        ]
        for i in range(4):
            positions[i][0] += offset[0]
            positions[i][1] += offset[1]
        for i in range(4):
            glm_vec3_rotate(positions[i], rad_rotation, [0, 0, 1])
        for i in range(4):
            positions[i][0] += position[0]
            positions[i][1] += position[1]

        cdef vec2 tex_coords[4]
        if (flipped == 0):
            tex_coords = [
                [0, 0],
                [1, 0],
                [1, 1],
                [0, 1]
            ]
        else:
            tex_coords = [
                [1, 0],
                [0, 0],
                [0, 1],
                [1, 1]
            ]

        for i in range(4):
            self.quad_vertices_ptr.position = positions[i]
            self.quad_vertices_ptr.color = color
            self.quad_vertices_ptr.tex_coord = tex_coords[i]
            self.quad_vertices_ptr.tex_index = texture_index
            self.quad_vertices_ptr += 1

        self.quad_count += 1


    def draw_circle(self, color, position, float radius, float width = 0.0, float fade = 0.0):
        pass


    # rectangle functions ----------------------------------- #
    def draw_rectangle(self, color, position, size, float rotation=0.0, offset=[0.0, 0.0], float width=0.0, float fade=0.0):
        cdef vec4 t_color
        self._handle_color(color, t_color)
        cdef vec2 t_position = [position[0], position[1]]
        cdef vec2 t_size = [size[0], size[1]]
        cdef vec2 t_offset = [offset[0], offset[1]]

        self._draw_rectangle(t_color, t_position, t_size, rotation, t_offset, width, fade)


    cdef void _draw_rectangle(self, vec4 color, vec2 position, vec2 size, float rotation, vec2 offset, float width, float fade):
        cdef size_t i

        if (self.rectangle_count >= self.MAX_QUADS):
            self._end_rectangle_batch()
            self._begin_rectangle_batch()

        cdef float rad_rotation = rotation * math.pi / 180.0

        cdef vec3[4] positions = [
            [0, 0, 0],
            [size[0], 0, 0],
            [size[0], size[1], 0],
            [0, size[1], 0]
        ]
        for i in range(4):
            positions[i][0] += offset[0]
            positions[i][1] += offset[1]
        for i in range(4):
            glm_vec3_rotate(positions[i], rad_rotation, [0, 0, 1])
        for i in range(4):
            positions[i][0] += position[0]
            positions[i][1] += position[1]
        
        cdef vec2[4] local_positions = [
            [-1.0, -1.0],
            [ 1.0, -1.0],
            [ 1.0,  1.0],
            [-1.0,  1.0]
        ]

        cdef vec2 thickness
        if width == 0.0:
            thickness = [1.0, 1.0]
        else:
            thickness = [width / size[0] * 2, width / size[1] * 2]

        cdef vec2 _fade = [fade / size[0] * 2, fade / size[1] * 2]

        for i in range(4):
            self.rectangle_vertices_ptr.position = positions[i]
            self.rectangle_vertices_ptr.local_position = local_positions[i]
            self.rectangle_vertices_ptr.color = color
            self.rectangle_vertices_ptr.thickness = thickness
            self.rectangle_vertices_ptr.fade = _fade
            self.rectangle_vertices_ptr += 1

        self.rectangle_count += 1


    def draw_line(self, color, start, end, float width=1.0):
        pass


    def draw_lines(self, color, points, float width=1.0):
        pass


    def draw_lines_miter(self, color, points, float width=1.0):
        pass


# util funcs
@cython.boundscheck(False)
@cython.wraparound(False)
cdef void py_to_glm_mat4(py_mat, mat4 mat):
    cdef size_t i, j
    for i in range(4):
        for j in range(4):
            mat[i][j] = py_mat[i][j]

