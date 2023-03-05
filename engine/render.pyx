
cimport cython

from libc cimport math
from libc.stdio cimport *
from libc.stdlib cimport malloc, free

from engine.lib.glad cimport *
from engine.lib.cglm cimport *

from engine.shader cimport *
from engine.window cimport Window
from engine.shapes cimport Rectangle
from engine.texture cimport Texture, RenderTexture

import time


cdef class Renderer:

    def __init__(self, Window window):
        self.window = window

        # gl options
        glEnable(GL_BLEND)
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)

        self.MAX_QUADS = 200000
        self.MAX_VERTICES = self.MAX_QUADS * 4
        self.MAX_INDICES = self.MAX_QUADS * 6
        glGetIntegerv(GL_MAX_TEXTURE_IMAGE_UNITS, &self.MAX_TEXTURE_SLOTS)

        # shader stuff ----------------------------------------- #
        shader_create(&self.shader, './engine/shaders/all.vert', './engine/shaders/all.frag')
        self.shaders = [self.shader]

        # set sampler2Ds
        shader_use(&self.shader)
        cdef GLint *values = <GLint *>malloc(self.MAX_TEXTURE_SLOTS * sizeof(GLint))
        cdef size_t i
        for i in range(self.MAX_TEXTURE_SLOTS):
            values[i] = i
        shader_set_int_array(&self.shader, 'u_Textures', self.MAX_TEXTURE_SLOTS, values)
        free(values)

        # initialization ----------------------------------------- #
        self.vertices = <Vertex *>malloc(self.MAX_VERTICES * sizeof(Vertex))

        glGenVertexArrays(1, &self.vao)
        glBindVertexArray(self.vao)

        glGenBuffers(1, &self.vbo)
        glBindBuffer(GL_ARRAY_BUFFER, self.vbo)
        glBufferData(
            GL_ARRAY_BUFFER, self.MAX_VERTICES * sizeof(Vertex), NULL, GL_DYNAMIC_DRAW
        )

        # float render_type
        # vec3 position
        # vec4 color
        # float[10] extra_data
        glEnableVertexAttribArray(0)
        glVertexAttribPointer(0, 1, GL_FLOAT, GL_FALSE, sizeof(Vertex), <void *><size_t>&((<Vertex *>0).render_type))

        glEnableVertexAttribArray(1)
        glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, sizeof(Vertex), <void *><size_t>&((<Vertex *>0).position))

        glEnableVertexAttribArray(2)
        glVertexAttribPointer(2, 4, GL_FLOAT, GL_FALSE, sizeof(Vertex), <void *><size_t>&((<Vertex *>0).color))

        for i in range(3):
            glEnableVertexAttribArray(i + 3)
            glVertexAttribPointer(i + 3, 4, GL_FLOAT, GL_FALSE, sizeof(Vertex), <void *><size_t>&((<Vertex *>0).extra_data[i]))

        # generate index buffer and buffer data
        cdef GLuint *indices = <GLuint *>malloc(self.MAX_INDICES * sizeof(GLuint))
        cdef int offset = 0
        for i in range(0, self.MAX_INDICES, 6):
            indices[i + 0] = offset + 0
            indices[i + 1] = offset + 1
            indices[i + 2] = offset + 2
            indices[i + 3] = offset + 2
            indices[i + 4] = offset + 3
            indices[i + 5] = offset + 0
            offset += 4

        glGenBuffers(1, &self.ebo)
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, self.ebo)
        glBufferData(
            GL_ELEMENT_ARRAY_BUFFER, 
            self.MAX_INDICES * sizeof(GLuint), indices, GL_STATIC_DRAW
        )

        self.texture_slots = <GLuint *>malloc(self.MAX_TEXTURE_SLOTS * sizeof(GLuint))

        free(indices)


    def __del__(self):
        cdef s_Shader shader
        for shader in self.shaders:
            shader_destroy(&shader)

        free(self.vertices)
        free(self.texture_slots)


    def set_clear_color(self, color):
        cdef vec4 _color
        self._handle_color(color, _color)
        glClearColor(_color[0], _color[1], _color[2], _color[3])
    

    def clear(self):
        glClear(GL_COLOR_BUFFER_BIT)


    cdef void _set_proj_mat(self, float width, float height):
        glm_ortho(0, width, 0, height, -1, 1, self.proj_mat)


    # begin functions --------------------------------- #
    cdef void _begin_batch(self):
        self.count = 0
        self.vertices_ptr = self.vertices
        self.texture_slot_index = 0


    def begin(self, view_matrix=None, RenderTexture texture=None):
        cdef int width, height
        if texture is None:
            glBindFramebuffer(GL_FRAMEBUFFER, 0)
            glViewport(0, 0, self.window.framebuffer_width, self.window.framebuffer_height)
            self._set_proj_mat(self.window.width, self.window.height)
        else:
            glBindFramebuffer(GL_FRAMEBUFFER, texture.fbo)
            glViewport(0, 0, texture.framebuffer_width, texture.framebuffer_height)
            self._set_proj_mat(texture.width, texture.height)

        # set view matrix
        if view_matrix is None:
            glm_mat4_identity(self.view_mat)
        else:
            py_to_glm_mat4(view_matrix, self.view_mat)

        cdef mat4 proj_view_mat
        glm_mat4_mul(self.proj_mat, self.view_mat, proj_view_mat)

        cdef s_Shader shader
        for shader in self.shaders:
            shader_use(&shader)
            shader_set_mat4(&shader, 'u_ProjView', proj_view_mat)

        self._begin_batch()


    # end functions --------------------------------- #
    cdef void _end_batch(self):
        glBindBuffer(GL_ARRAY_BUFFER, self.vbo)
        glBufferSubData(
            GL_ARRAY_BUFFER, 0, 
            self.count * 4 * sizeof(Vertex),
            self.vertices
        )

        cdef size_t i
        for i in range(self.texture_slot_index):
            glActiveTexture(GL_TEXTURE0 + i)
            glBindTexture(GL_TEXTURE_2D, self.texture_slots[i])

        shader_use(&self.shader)
        glBindVertexArray(self.vao)
        glDrawElements(GL_TRIANGLES, self.count * 6, GL_UNSIGNED_INT, NULL)


    def end(self):
        self._end_batch()


    # drawing -------------------------------------- #
    cdef void _handle_color(self, py_color, vec4 color):
        if len(py_color) == 3:
            color[:4] = [py_color[0]/255.0, py_color[1]/255.0, py_color[2]/255.0, 1.0]
        else:
            color[:4] = [py_color[0]/255.0, py_color[1]/255.0, py_color[2]/255.0, py_color[3]/255.0]


    def draw_texture(self, Texture texture, position, float rotation=0.0, offset=(0.0, 0.0), Rectangle region=None, bint flipped=False, color=[255, 255, 255, 255]):
        cdef GLuint texture_id = texture.texture_id
        cdef vec2 t_position = [position[0], position[1]]
        cdef vec2 t_size = [texture.width, texture.height]
        cdef vec2 t_offset = [offset[0], offset[1]]
        cdef vec4 t_color
        self._handle_color(color, t_color)

        self._draw_texture(texture_id, t_position, t_size, rotation, t_offset, region, flipped, t_color)


    cdef void _draw_texture(self, GLuint texture_id, vec2 position, vec2 size, float rotation, vec2 offset, Rectangle region, bint flipped, vec4 color):
        cdef size_t i

        if self.count >= self.MAX_QUADS or self.texture_slot_index >= self.MAX_TEXTURE_SLOTS:
            self._end_batch()
            self._begin_batch()

        cdef float rad_rotation = rotation * math.pi / 180.0

        cdef float texture_index = -1.0
        for i in range(self.texture_slot_index):
            if self.texture_slots[i] == texture_id:
                texture_index = <float>i
                break

        if texture_index == -1.0:
            texture_index = <float>self.texture_slot_index
            self.texture_slots[self.texture_slot_index] = texture_id
            self.texture_slot_index += 1

        cdef vec2[4] local_positions

        cdef vec2 tex_coords[4]
        if region is None:
            local_positions = [
                [0, 0],
                [size[0], 0],
                [size[0], size[1]],
                [0, size[1]]
            ]

            tex_coords = [
                [0, 0],
                [1, 0],
                [1, 1],
                [0, 1]
            ]
        else:
            local_positions = [
                [0, 0],
                [region.width, 0],
                [region.width, region.height],
                [0, region.height]
            ]

            tex_coords = [
                [region.x / size[0], region.y / size[1]],
                [(region.x + region.width) / size[0], region.y / size[1]],
                [(region.x + region.width) / size[0], (region.y + region.height) / size[1]],
                [region.x / size[0], (region.y + region.height) / size[1]]
            ]

        if flipped:
            tex_coords = [
                tex_coords[1],
                tex_coords[0],
                tex_coords[3],
                tex_coords[2]
            ]

        cdef vec3 _position = [position[0], position[1], 0.0]

        for i in range(4):
            self.vertices_ptr.render_type = 0.0
            self.vertices_ptr.position = _position
            self.vertices_ptr.color = color
            self.vertices_ptr.extra_data[0][0:2] = local_positions[i]
            self.vertices_ptr.extra_data[0][2:4] = offset
            self.vertices_ptr.extra_data[1][0] = rad_rotation
            self.vertices_ptr.extra_data[1][1:3] = tex_coords[i]
            self.vertices_ptr.extra_data[1][3] = texture_index
            self.vertices_ptr += 1

        self.count += 1


    def draw_circle(self, color, position, float radius, float width = 0.0, float fade = 0.0):
        cdef vec4 t_color
        self._handle_color(color, t_color)
        cdef vec2 t_position = [position[0], position[1]]

        self._draw_circle(t_color, t_position, radius, width, fade)
        self.count += 1


    cdef void _draw_circle(self, vec4 color, vec2 position, float radius, float width = 0.0, float fade = 0.0):
        if self.count >= self.MAX_QUADS:
            self._end_batch()
            self._begin_batch()

        cdef vec3[4] positions = [
            [position[0] - radius, position[1] - radius, 0.0],
            [position[0] + radius, position[1] - radius, 0.0],
            [position[0] + radius, position[1] + radius, 0.0],
            [position[0] - radius, position[1] + radius, 0.0]
        ]
        
        cdef vec2[4] local_positions = [
            [-1.0, -1.0],
            [ 1.0, -1.0],
            [ 1.0,  1.0],
            [-1.0,  1.0]
        ]

        cdef float thickness
        if width == 0.0:
            thickness = 1.0
        else:
            thickness = width / radius

        fade = fade / radius

        cdef size_t i
        for i in range(4):
            self.vertices_ptr.render_type = 1.0
            self.vertices_ptr.position = positions[i]
            self.vertices_ptr.color = color
            self.vertices_ptr.extra_data[0][0:2] = local_positions[i]
            self.vertices_ptr.extra_data[0][2] = thickness
            self.vertices_ptr.extra_data[0][3] = fade
            self.vertices_ptr += 1

        self.count += 1


    # rectangle functions ----------------------------------- #
    def draw_rectangle(self, color, position, size, float rotation=0.0, offset=(0.0, 0.0), float width=0.0, float fade=0.0):
        cdef vec4 t_color
        self._handle_color(color, t_color)
        cdef vec2 t_position = [position[0], position[1]]
        cdef vec2 t_size = [size[0], size[1]]
        cdef vec2 t_offset = [offset[0], offset[1]]

        self._draw_rectangle(t_color, t_position, t_size, rotation, t_offset, width, fade)
        self.count += 1


    cdef void _draw_rectangle(self, vec4 color, vec2 position, vec2 size, float rotation, vec2 offset, float width, float fade):
        cdef size_t i

        if self.count >= self.MAX_QUADS:
            self._end_batch()
            self._begin_batch()

        cdef float rad_rotation = rotation * math.pi / 180.0

        cdef vec2[4] local_positions = [
            [0, 0],
            [size[0], 0],
            [size[0], size[1]],
            [0, size[1]],
        ]
        
        cdef vec2[4] relative_coords = [
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

        cdef vec3 _position = [position[0], position[1], 0.0]

        for i in range(4):
            self.vertices_ptr.render_type = 2.0
            self.vertices_ptr.position = _position
            self.vertices_ptr.color = color
            self.vertices_ptr.extra_data[0][0:2] = local_positions[i]
            self.vertices_ptr.extra_data[0][2:4] = offset
            self.vertices_ptr.extra_data[1][0] = rad_rotation
            self.vertices_ptr.extra_data[1][1:3] = relative_coords[i]
            self.vertices_ptr.extra_data[2][0:2] = thickness
            self.vertices_ptr.extra_data[2][2:4] = _fade
            self.vertices_ptr += 1

        self.count += 1


    def draw_line(self, color, start, end, float width=1.0):
        cdef vec4 t_color
        self._handle_color(color, t_color)
        cdef vec2 t_start = [start[0], start[1]]
        cdef vec2 t_end = [end[0], end[1]]

        self._draw_line(t_color, t_start, t_end, width)
        self.count += 1


    def draw_lines(self, color, points, float width=1.0):
        cdef vec4 t_color
        self._handle_color(color, t_color)

        cdef size_t i
        cdef vec2 t_start
        point = points[0]
        cdef vec2 t_end = [point[0], point[1]]
        for i in range(1, len(points)):
            point = points[i]
            t_start = t_end
            t_end = [point[0], point[1]]
            self._draw_line(t_color, t_start, t_end, width)

        self.count += 1


    cdef void _draw_line(self, vec4 color, vec2 start, vec2 end, float width):
        if self.count >= self.MAX_QUADS:
            self._end_batch()
            self._begin_batch()

        cdef float corner_angle = math.atan2(end[1] - start[1], end[0] - start[0]) + math.pi / 2
        cdef vec2 corner_offset
        glm_vec2_rotate([width / 2, 0], corner_angle, corner_offset)
        cdef vec3[4] positions = [
            [start[0] + corner_offset[0], start[1] + corner_offset[1], 0.0],
            [start[0] - corner_offset[0], start[1] - corner_offset[1], 0.0],
            [end[0] - corner_offset[0], end[1] - corner_offset[1], 0.0],
            [end[0] + corner_offset[0], end[1] + corner_offset[1], 0.0],
        ]

        cdef size_t i
        for i in range(4):
            self.vertices_ptr.render_type = 3.0
            self.vertices_ptr.position = positions[i]
            self.vertices_ptr.color = color
            self.vertices_ptr += 1

        self.count += 1


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

