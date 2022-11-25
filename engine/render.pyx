cimport cython

from libc cimport math
from libc.stdio cimport *
from libc.stdlib cimport malloc, free

from engine.libs.glad cimport *
from engine.libs.cglm cimport *

from engine.shader cimport *

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


cdef packed struct RectangleVertex:
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
        Shader[4] shaders

        # quad attribs
        GLuint quad_vao
        GLuint quad_vbo
        GLuint quad_ebo
        unsigned int quad_count
        QuadVertex *quad_vertices
        QuadVertex *quad_vertices_ptr

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
        self.quad_shader = shader_create(b'./engine/shaders/quad.vert', b'./engine/shaders/quad.frag')
        self.circle_shader = shader_create(b'./engine/shaders/circle.vert', b'./engine/shaders/circle.frag')
        self.rectangle_shader = shader_create(b'./engine/shaders/rectangle.vert', b'./engine/shaders/rectangle.frag')
        self.line_shader = shader_create(b'./engine/shaders/line.vert', b'./engine/shaders/line.frag')
        self.shaders = [self.quad_shader, self.circle_shader, self.rectangle_shader, self.line_shader]

        # set sampler2Ds
        shader_use(self.quad_shader)
        cdef GLint *values = <GLint *>malloc(sizeof(GLint) * self.MAX_TEXTURE_SLOTS)
        cdef size_t i
        for i in range(self.MAX_TEXTURE_SLOTS):
            values[i] = i
        shader_set_int_array(self.quad_shader, 'u_Textures', self.MAX_TEXTURE_SLOTS, values)
        free(values)

        # quad initialization ----------------------------------------- #
        self.quad_vertices = <QuadVertex *>malloc(sizeof(QuadVertex) * self.MAX_VERTICES)

        glGenVertexArrays(1, &self.quad_vao)
        glBindVertexArray(self.quad_vao)

        glGenBuffers(1, &self.quad_vbo)
        glBindBuffer(GL_ARRAY_BUFFER, self.quad_vbo)
        glBufferData(
            GL_ARRAY_BUFFER, self.MAX_VERTICES * sizeof(QuadVertex), NULL, GL_DYNAMIC_DRAW
        )

        # 3 position, 4 color, 2 tex_coord, 1 tex_index
        self._set_attrib_pointers(4, [3, 4, 2, 1])

        # generate index buffer and buffer data
        cdef unsigned int *indices = <unsigned int *>malloc(sizeof(unsigned int) * self.MAX_INDICES)
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

        # circle initialization ----------------------------------------- #
        self.circle_vertices = <CircleVertex *>malloc(sizeof(CircleVertex) * self.MAX_VERTICES)

        glGenVertexArrays(1, &self.circle_vao)
        glBindVertexArray(self.circle_vao)

        glGenBuffers(1, &self.circle_vbo)
        glBindBuffer(GL_ARRAY_BUFFER, self.circle_vbo)
        glBufferData(
            GL_ARRAY_BUFFER, self.MAX_VERTICES * sizeof(CircleVertex), NULL, GL_DYNAMIC_DRAW
        )

        # 3 position, 2 local_position, 4 color, 1 thickness, 1 fade
        self._set_attrib_pointers(5, [3, 2, 4, 1, 1])

        glGenBuffers(1, &self.circle_ebo)
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, self.circle_ebo)
        glBufferData(
            GL_ELEMENT_ARRAY_BUFFER, 
            self.MAX_INDICES * sizeof(unsigned int), indices, GL_STATIC_DRAW
        )

        # rectangle initialization ----------------------------------------- #
        self.rectangle_vertices = <RectangleVertex *>malloc(sizeof(RectangleVertex) * self.MAX_VERTICES)

        glGenVertexArrays(1, &self.rectangle_vao)
        glBindVertexArray(self.rectangle_vao)

        glGenBuffers(1, &self.rectangle_vbo)
        glBindBuffer(GL_ARRAY_BUFFER, self.rectangle_vbo)
        glBufferData(
            GL_ARRAY_BUFFER, self.MAX_VERTICES * sizeof(RectangleVertex), NULL, GL_DYNAMIC_DRAW
        )

        # 3 position, 2 local_position, 4 color, 2 thickness, 2 fade
        self._set_attrib_pointers(5, [3, 2, 4, 2, 2])

        glGenBuffers(1, &self.rectangle_ebo)
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, self.rectangle_ebo)
        glBufferData(
            GL_ELEMENT_ARRAY_BUFFER, 
            self.MAX_INDICES * sizeof(unsigned int), indices, GL_STATIC_DRAW
        )

        # line initialization ----------------------------------------- #
        self.line_vertices = <LineVertex *>malloc(sizeof(LineVertex) * self.MAX_VERTICES)

        glGenVertexArrays(1, &self.line_vao)
        glBindVertexArray(self.line_vao)

        glGenBuffers(1, &self.line_vbo)
        glBindBuffer(GL_ARRAY_BUFFER, self.line_vbo)
        glBufferData(
            GL_ARRAY_BUFFER, self.MAX_VERTICES * sizeof(LineVertex), NULL, GL_DYNAMIC_DRAW
        )

        # 3 position, 4 color
        self._set_attrib_pointers(2, [3, 4])

        glGenBuffers(1, &self.line_ebo)
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, self.line_ebo)
        glBufferData(
            GL_ELEMENT_ARRAY_BUFFER, 
            self.MAX_INDICES * sizeof(unsigned int), indices, GL_STATIC_DRAW
        )

        free(indices)


    cdef void _set_attrib_pointers(self, int size, int[] attrib_sizes):
        cdef int stride = 0
        cdef size_t i
        for i in range(size):
            stride += attrib_sizes[i]
        stride *= sizeof(float)
        
        cdef int offset = 0
        for i in range(size):
            glEnableVertexAttribArray(i)
            glVertexAttribPointer(
                i, attrib_sizes[i], GL_FLOAT, GL_FALSE, stride, <void *>offset
            )
            offset += attrib_sizes[i] * sizeof(float)


    def set_size(self, int width, int height):
        cdef mat4 proj_matrix
        glm_ortho(0, width, 0, height, 0, 1, proj_matrix)
        cdef Shader shader
        for shader in self.shaders:
            shader_use(shader)
            shader_set_mat4(shader, b"u_Proj", proj_matrix)


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
        pass


    cdef void _begin_circle_batch(self):
        pass


    cdef void _begin_rectangle_batch(self):
        self.rectangle_count = 0
        self.rectangle_vertices_ptr = self.rectangle_vertices


    cdef void _begin_line_batch(self):
        pass


    def begin(self, py_view_matrix=None):
        cdef mat4 view_matrix
        if py_view_matrix is not None:
            py_to_glm_mat4(py_view_matrix, view_matrix)
        else:
            glm_mat4_identity(view_matrix)

        cdef Shader shader
        for shader in self.shaders:
            shader_use(shader)
            shader_set_mat4(shader, 'u_View', view_matrix)

        # self._begin_quad_batch()
        # self._begin_circle_batch()
        self._begin_rectangle_batch()
        # self._begin_line_batch()

    # end functions --------------------------------- #
    cdef void _end_quad_batch(self):
        pass


    cdef void _end_circle_batch(self):
        pass


    cdef void _end_rectangle_batch(self):
        glBindBuffer(GL_ARRAY_BUFFER, self.rectangle_vbo)
        glBufferSubData(
            GL_ARRAY_BUFFER, 0, 
            self.rectangle_count * 4 * sizeof(RectangleVertex),
            self.rectangle_vertices
        )

        shader_use(self.rectangle_shader)
        glBindVertexArray(self.rectangle_vao)
        glDrawElements(GL_TRIANGLES, self.rectangle_count * 6, GL_UNSIGNED_INT, NULL)


    cdef void _end_line_batch(self):
        pass


    def end(self):
        # self._end_quad_batch()
        # self._end_circle_batch()
        self._end_rectangle_batch()
        # self._end_line_batch()

    # drawing -------------------------------------- #
    cdef void _handle_color(self, py_color, vec4 color):
        if (len(py_color) == 3):
            color[:4] = [py_color[0]/255.0, py_color[1]/255.0, py_color[2]/255.0, 1.0]
        else:
            color[:4] = [py_color[0]/255.0, py_color[1]/255.0, py_color[2]/255.0, py_color[3]/255.0]


    def draw_texture(self, texture: Texture, position, float rotation=0.0, offset=[0.0, 0.0], bint flipped=False, color=[255, 255, 255, 255]):
        pass


    def draw_circle(self, color, position, float radius, float width = 0.0, float fade = 0.0):
        pass


    # rectangle functions ----------------------------------- #
    def draw_rectangle(self, color, position, size, float rotation=0.0, offset=[0.0, 0.0], float width=0.0, float fade=0.0):
        cdef vec4 t_color
        self._handle_color(color, t_color)
        cdef vec2 t_position = [position[0], position[1]]
        cdef vec2 t_size = [size[0], size[1]]
        cdef vec2 t_offset = [offset[0], offset[1]]

        self._cy_draw_rectangle(t_color, t_position, t_size, rotation, t_offset, width, fade)


    cdef void _cy_draw_rectangle(self, vec4 color, vec2 position, vec2 size, float rotation, vec2 offset, float width, float fade):
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

