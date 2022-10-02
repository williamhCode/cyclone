import time
from pathlib import Path

from OpenGL.GL import *
import glm
import numpy as np

from .utilities import set_cwd
from .shader import Shader
from .texture import Texture

from ctypes import c_void_p

cimport cython
from libc cimport math
from libc.stdlib cimport malloc, free

# from . cimport test
# cdef test.TestClass tc = test.TestClass()
# print(tc.x, tc.y)


DEF MAX_QUAD_COUNT = 100000
DEF MAX_VERTEX_COUNT = MAX_QUAD_COUNT * 4
DEF MAX_INDEX_COUNT = MAX_QUAD_COUNT * 6
DEF MAX_TEXTURES = 16
DEF QUAD_VERTEX_STRIDE = 10
DEF CIRCLE_VERTEX_STRIDE = 11
DEF RECTANGLE_VERTEX_STRIDE = 13
DEF LINE_VERTEX_STRIDE = 7


cdef class Renderer:
    cdef:
        # quad variables
        unsigned int quad_vao
        unsigned int quad_vbo
        unsigned int quad_ibo
        
        float[:] quad_vertices
        int quad_vertex_count 

        unsigned int[MAX_TEXTURES] texture_slots
        int texture_slot_index

        # circle variables
        unsigned int circle_vao
        unsigned int circle_vbo
        unsigned int circle_ibo
        
        float[:] circle_vertices
        int circle_vertex_count 

        # rectangle variables
        unsigned int rectangle_vao
        unsigned int rectangle_vbo
        unsigned int rectangle_ibo

        float[:] rectangle_vertices
        int rectangle_vertex_count 

        # line variables
        unsigned int line_vao
        unsigned int line_vbo
        unsigned int line_ibo

        float[:] line_vertices
        int line_vertex_count 

        # shaders
        object quad_shader
        object circle_shader
        object rectangle_shader
        object line_shader
        list shaders

        # matrices
        object view_matrix


    def __init__(self):
        # glEnable(GL_DEPTH_TEST)
        glEnable(GL_BLEND)
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)
       
        with set_cwd(Path(__file__).parent.resolve()):
            self.quad_shader = Shader('shaders/quad.vert', 'shaders/quad.frag')
            self.circle_shader = Shader('shaders/circle.vert', 'shaders/circle.frag')
            self.rectangle_shader = Shader('shaders/rectangle.vert', 'shaders/rectangle.frag')
            self.line_shader = Shader('shaders/line.vert', 'shaders/line.frag')
            self.shaders = [self.quad_shader, self.circle_shader, self.rectangle_shader, self.line_shader]
            
        self.quad_shader.use()
        values = glm.array(np.arange(MAX_TEXTURES, dtype=np.uint32))
        self.quad_shader.set_int_array('u_Textures', values)

        # quad initialization
        self.quad_vertices = np.empty(
            MAX_VERTEX_COUNT * QUAD_VERTEX_STRIDE, dtype=np.float32
        )
        
        self.quad_vao = glGenVertexArrays(1)
        glBindVertexArray(self.quad_vao)
        
        self.quad_vbo = glGenBuffers(1)
        glBindBuffer(GL_ARRAY_BUFFER, self.quad_vbo)
        glBufferData(
            GL_ARRAY_BUFFER, self.quad_vertices.nbytes, None, GL_DYNAMIC_DRAW
        )

        # 3 position, 4 color, 2 tex_coords, 1 tex_index
        self._set_attrib_pointers(4, [3, 4, 2, 1])

        # generate index buffer object and buffer data
        cdef unsigned int[:] indices = np.empty(MAX_INDEX_COUNT, dtype=np.uint32)
        cdef int offset = 0
        cdef Py_ssize_t i
        for i in range(0, MAX_INDEX_COUNT, 6):
            indices[i + 0] = offset + 0
            indices[i + 1] = offset + 1
            indices[i + 2] = offset + 2
            indices[i + 3] = offset + 2
            indices[i + 4] = offset + 3
            indices[i + 5] = offset + 0
            offset += 4

        self.quad_ibo = glGenBuffers(1)
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, self.quad_ibo)
        glBufferData(
            GL_ELEMENT_ARRAY_BUFFER, 
            indices.nbytes, np.asarray(indices), GL_STATIC_DRAW
        )


        # circle initialization
        self.circle_vertices = np.empty(
            MAX_VERTEX_COUNT * CIRCLE_VERTEX_STRIDE, np.float32
        )

        self.circle_vao = glGenVertexArrays(1)
        glBindVertexArray(self.circle_vao)

        self.circle_vbo = glGenBuffers(1)
        glBindBuffer(GL_ARRAY_BUFFER, self.circle_vbo)
        glBufferData(
            GL_ARRAY_BUFFER, self.circle_vertices.nbytes, None, GL_DYNAMIC_DRAW
        )

        # 3 position, 2 local_position, 4 color, 1 thickness, 1 fade
        self._set_attrib_pointers(5, [3, 2, 4, 1, 1])

        self.circle_ibo = glGenBuffers(1)
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, self.circle_ibo)
        glBufferData(
            GL_ELEMENT_ARRAY_BUFFER, 
            indices.nbytes, np.asarray(indices), GL_STATIC_DRAW
        )


        # rectangle initialization
        self.rectangle_vertices = np.empty(
            MAX_VERTEX_COUNT * RECTANGLE_VERTEX_STRIDE, np.float32
        )

        self.rectangle_vao = glGenVertexArrays(1)
        glBindVertexArray(self.rectangle_vao)

        self.rectangle_vbo = glGenBuffers(1)
        glBindBuffer(GL_ARRAY_BUFFER, self.rectangle_vbo)
        glBufferData(
            GL_ARRAY_BUFFER, self.rectangle_vertices.nbytes, None, GL_DYNAMIC_DRAW
        )

        # 3 position, 2 local_position, 4 color, 2 thickness, 2 fade
        self._set_attrib_pointers(5, [3, 2, 4, 2, 2])

        self.rectangle_ibo = glGenBuffers(1)
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, self.rectangle_ibo)
        glBufferData(
            GL_ELEMENT_ARRAY_BUFFER, 
            indices.nbytes, np.asarray(indices), GL_STATIC_DRAW
        )


        # line initialization
        self.line_vertices = np.empty(
            MAX_VERTEX_COUNT * LINE_VERTEX_STRIDE, np.float32
        )

        self.line_vao = glGenVertexArrays(1)
        glBindVertexArray(self.line_vao)

        self.line_vbo = glGenBuffers(1)
        glBindBuffer(GL_ARRAY_BUFFER, self.line_vbo)
        glBufferData(
            GL_ARRAY_BUFFER, self.line_vertices.nbytes, None, GL_DYNAMIC_DRAW
        )

        # 3 position, 4 color
        self._set_attrib_pointers(2, [3, 4])

        self.line_ibo = glGenBuffers(1)
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, self.line_ibo)
        glBufferData(
            GL_ELEMENT_ARRAY_BUFFER, 
            indices.nbytes, np.asarray(indices), GL_STATIC_DRAW
        )


    cdef void _set_attrib_pointers(self, int size, int[] attrib_sizes):
        cdef int stride = 0
        cdef int i
        for i in range(size):
            stride += attrib_sizes[i]
        stride *= 4
        
        cdef int offset = 0
        for i in range(size):
            glEnableVertexAttribArray(i)
            glVertexAttribPointer(
                i, attrib_sizes[i], GL_FLOAT, GL_FALSE, stride, c_void_p(offset)
            )
            offset += attrib_sizes[i] * 4


    def set_size(self, width: int, height: int):
        proj_matrix = glm.ortho(0, width, 0, height, 0, 1.0)
        for shader in self.shaders:
            shader.use()
            shader.set_mat4('u_Proj', proj_matrix)


    def set_clear_color(self, color):
        color = [x / 255.0 for x in color]
        glClearColor(*color)

    
    def clear(self):
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)


    # begin functions --------------------------------- #
    cdef void _begin_quad_batch(self):
        self.quad_vertex_count = 0
        self.texture_slot_index = 1


    cdef void _begin_circle_batch(self):
        self.circle_vertex_count = 0


    cdef void _begin_rectangle_batch(self):
        self.rectangle_vertex_count = 0


    cdef void _begin_line_batch(self):
        self.line_vertex_count = 0


    def begin(self, view_matrix=None):
        if view_matrix is not None:
            self.view_matrix = view_matrix
        else:
            self.view_matrix = glm.mat4()

        for shader in self.shaders:
            shader.use()
            shader.set_mat4('u_View', self.view_matrix)

        self._begin_quad_batch()
        self._begin_circle_batch()
        self._begin_rectangle_batch()
        self._begin_line_batch()


    # end functions --------------------------------- #
    cdef void _end_quad_batch(self):
        glBindBuffer(GL_ARRAY_BUFFER, self.quad_vbo)
        glBufferSubData(
            GL_ARRAY_BUFFER, 0, 
            self.quad_vertex_count * QUAD_VERTEX_STRIDE * 4, 
            np.asarray(self.quad_vertices)
        )

        cdef int i
        for i in range(self.texture_slot_index):
            glActiveTexture(GL_TEXTURE0 + i)
            glBindTexture(GL_TEXTURE_2D, self.texture_slots[i])

        self.quad_shader.use()
        glBindVertexArray(self.quad_vao)
        cdef int index_count = self.quad_vertex_count // 4 * 6
        glDrawElements(GL_TRIANGLES, index_count, GL_UNSIGNED_INT, None)


    cdef void _end_circle_batch(self):
        glBindBuffer(GL_ARRAY_BUFFER, self.circle_vbo)
        glBufferSubData(
            GL_ARRAY_BUFFER, 0, 
            self.circle_vertex_count * CIRCLE_VERTEX_STRIDE * 4, 
            np.asarray(self.circle_vertices)
        )

        self.circle_shader.use()
        glBindVertexArray(self.circle_vao)
        cdef int index_count = self.circle_vertex_count // 4 * 6
        glDrawElements(GL_TRIANGLES, index_count, GL_UNSIGNED_INT, None)


    cdef void _end_rectangle_batch(self):
        glBindBuffer(GL_ARRAY_BUFFER, self.rectangle_vbo)
        glBufferSubData(
            GL_ARRAY_BUFFER, 0, 
            self.rectangle_vertex_count * RECTANGLE_VERTEX_STRIDE * 4, 
            np.asarray(self.rectangle_vertices)
        )

        self.rectangle_shader.use()
        glBindVertexArray(self.rectangle_vao)
        cdef int index_count = self.rectangle_vertex_count // 4 * 6
        glDrawElements(GL_TRIANGLES, index_count, GL_UNSIGNED_INT, None)


    cdef void _end_line_batch(self):
        glBindBuffer(GL_ARRAY_BUFFER, self.line_vbo)
        glBufferSubData(
            GL_ARRAY_BUFFER, 0, 
            self.line_vertex_count * LINE_VERTEX_STRIDE * 4, 
            np.asarray(self.line_vertices)
        )

        self.line_shader.use()
        glBindVertexArray(self.line_vao)
        cdef int index_count = self.line_vertex_count // 4 * 6
        glDrawElements(GL_TRIANGLES, index_count, GL_UNSIGNED_INT, None)


    def end(self):
        self._end_quad_batch()
        self._end_circle_batch()
        self._end_rectangle_batch()
        self._end_line_batch()


    # drawing -------------------------------------- #
    cdef float _handle_color(self, color, float[4] out_color):
        if (len(color) == 3):
            out_color[:4] = [color[0]/255.0, color[1]/255.0, color[2]/255.0, 1.0]
        else:
            out_color[:4] = [color[0]/255.0, color[1]/255.0, color[2]/255.0, color[3]/255.0]


    # quad functions ------------------------------------- #
    @cython.boundscheck(False)
    @cython.wraparound(False)
    cdef void _set_vertex_data_from_quad(self, Py_ssize_t curr_index, float[3] position, float[4] color, float[2] tex_coords, float tex_index):
        self.quad_vertices[curr_index + 0] = position[0]
        self.quad_vertices[curr_index + 1] = position[1]
        self.quad_vertices[curr_index + 2] = position[2]
        self.quad_vertices[curr_index + 3] = color[0]
        self.quad_vertices[curr_index + 4] = color[1]
        self.quad_vertices[curr_index + 5] = color[2]
        self.quad_vertices[curr_index + 6] = color[3]
        self.quad_vertices[curr_index + 7] = tex_coords[0]
        self.quad_vertices[curr_index + 8] = tex_coords[1]
        self.quad_vertices[curr_index + 9] = tex_index 


    def draw_texture(self, texture: Texture, position, float rotation=0.0, offset=[0.0, 0.0], flipped=False, color=[255, 255, 255, 255]):
        cdef unsigned int texture_id = texture.id
        cdef float[2] t_position = [position[0], position[1]]
        cdef float[2] t_size = [texture.width, texture.height]
        cdef float[2] t_offset = [offset[0], offset[1]]
        cdef bint t_flipped = flipped
        cdef float[4] t_color
        self._handle_color(color, t_color)

        self.cy_draw_texture(texture_id, t_position, t_size, rotation, t_offset, t_flipped, t_color)


    cdef void cy_draw_texture(self, unsigned int texture_id, float[2] position, float[2] size, float rotation, float[2] offset, bint flipped, float[4] color):
        if (self.quad_vertex_count >= MAX_VERTEX_COUNT or self.texture_slot_index >= MAX_TEXTURES):
            self._end_quad_batch()
            self._begin_quad_batch()

        cdef float rad_rotation = rotation * math.pi / 180.0

        cdef float texture_index = 0.0
        cdef int i
        for i in range(1, self.texture_slot_index):
            if (self.texture_slots[i] == texture_id):
                texture_index = <float>i
                break

        if (texture_index == 0.0):
            texture_index = <float>self.texture_slot_index
            self.texture_slots[self.texture_slot_index] = texture_id
            self.texture_slot_index += 1
            
        cdef float[4][3] positions = [
            [0, 0, 0],
            [size[0], 0, 0],
            [size[0], size[1], 0],
            [0, size[1], 0]
        ]
        for i in range(4):
            positions[i][0] += offset[0]
            positions[i][1] += offset[1]
        cdef float[3] rotated_vector
        for i in range(4):
            self._rotate_vector(positions[i], rad_rotation, rotated_vector)
            positions[i] = rotated_vector
        for i in range(4):
            positions[i][0] += position[0]
            positions[i][1] += position[1]

        cdef float[4][2] tex_coords
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
        
        cdef Py_ssize_t curr_index
        for i in range(4):
            curr_index = self.quad_vertex_count * QUAD_VERTEX_STRIDE
            self._set_vertex_data_from_quad(
                curr_index, positions[i], color, tex_coords[i], texture_index)
            self.quad_vertex_count += 1


    # circle functions ----------------------------------- #
    @cython.boundscheck(False)
    @cython.wraparound(False)
    cdef void _set_vertex_data_from_circle(self, Py_ssize_t curr_index, float[3] position, float[2] local_position, float[4] color, float thickness, float fade):
        self.circle_vertices[curr_index + 0] = position[0]
        self.circle_vertices[curr_index + 1] = position[1]
        self.circle_vertices[curr_index + 2] = position[2]
        self.circle_vertices[curr_index + 3] = local_position[0]
        self.circle_vertices[curr_index + 4] = local_position[1]
        self.circle_vertices[curr_index + 5] = color[0]
        self.circle_vertices[curr_index + 6] = color[1]
        self.circle_vertices[curr_index + 7] = color[2]
        self.circle_vertices[curr_index + 8] = color[3]
        self.circle_vertices[curr_index + 9] = thickness
        self.circle_vertices[curr_index + 10] = fade


    def draw_circle(self, color, position, float radius, float width = 0.0, float fade = 0.0):
        cdef float[4] t_color
        self._handle_color(color, t_color)
        cdef float[2] t_position = [position[0], position[1]]

        self.cy_draw_circle(t_color, t_position, radius, width, fade)


    cdef void cy_draw_circle(self, float[4] color, float[2] position, float radius, float width = 0.0, float fade = 0.0):
        if (self.circle_vertex_count >= MAX_VERTEX_COUNT):
            self._end_circle_batch()
            self._begin_circle_batch()

        cdef float[4][3] positions = [
            [position[0] - radius, position[1] - radius, 0],
            [position[0] + radius, position[1] - radius, 0],
            [position[0] + radius, position[1] + radius, 0],
            [position[0] - radius, position[1] + radius, 0]
        ]
        
        cdef float[4][2] local_positions = [
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

        cdef int i
        cdef Py_ssize_t curr_index
        for i in range(4):
            curr_index = self.circle_vertex_count * CIRCLE_VERTEX_STRIDE
            self._set_vertex_data_from_circle(curr_index, positions[i], local_positions[i], color, thickness, fade)
            self.circle_vertex_count += 1


    # rectangle functions ----------------------------------- #
    @cython.boundscheck(False)
    @cython.wraparound(False)
    cdef void _set_vertex_data_from_rectangle(self, Py_ssize_t curr_index, float[3] position, float[2] local_position, float[4] color, float[2] thickness, float[2] fade) nogil:
        self.rectangle_vertices[curr_index + 0] = position[0]
        self.rectangle_vertices[curr_index + 1] = position[1]
        self.rectangle_vertices[curr_index + 2] = position[2]
        self.rectangle_vertices[curr_index + 3] = local_position[0]
        self.rectangle_vertices[curr_index + 4] = local_position[1]
        self.rectangle_vertices[curr_index + 5] = color[0]
        self.rectangle_vertices[curr_index + 6] = color[1]
        self.rectangle_vertices[curr_index + 7] = color[2]
        self.rectangle_vertices[curr_index + 8] = color[3]
        self.rectangle_vertices[curr_index + 9] = thickness[0]
        self.rectangle_vertices[curr_index + 10] = thickness[1]
        self.rectangle_vertices[curr_index + 11] = fade[0]
        self.rectangle_vertices[curr_index + 12] = fade[1]


    def draw_rectangle(self, color, position, size, float rotation=0.0, offset=[0.0, 0.0], float width=0.0, float fade=0.0):
        cdef float[4] t_color
        self._handle_color(color, t_color)
        cdef float[2] t_position = [position[0], position[1]]
        cdef float[2] t_size = [size[0], size[1]]
        cdef float[2] t_offset = [offset[0], offset[1]]

        self.cy_draw_rectangle(t_color, t_position, t_size, rotation, t_offset, width, fade)


    cdef void cy_draw_rectangle(self, float[4] color, float[2] position, float[2] size, float rotation, float[2] offset, float width, float fade):
        if (self.rectangle_vertex_count >= MAX_VERTEX_COUNT):
            self._end_rectangle_batch()
            self._begin_rectangle_batch()

        cdef float rad_rotation = rotation * math.pi / 180.0

        cdef float[4][3] positions = [
            [0, 0, 0],
            [size[0], 0, 0],
            [size[0], size[1], 0],
            [0, size[1], 0]
        ]
        cdef int i
        for i in range(4):
            positions[i][0] += offset[0]
            positions[i][1] += offset[1]
        cdef float[3] rotated_vector
        for i in range(4):
            self._rotate_vector(positions[i], rad_rotation, rotated_vector)
            positions[i] = rotated_vector
        for i in range(4):
            positions[i][0] += position[0]
            positions[i][1] += position[1]
        
        cdef float[4][2] local_positions = [
            [-1.0, -1.0],
            [ 1.0, -1.0],
            [ 1.0,  1.0],
            [-1.0,  1.0]
        ]

        cdef float[2] thickness
        if width == 0.0:
            thickness = [1.0, 1.0]
        else:
            thickness = [width / size[0] * 2, width / size[1] * 2]

        cdef float[2] _fade = [fade / size[0] * 2, fade / size[1] * 2]

        cdef Py_ssize_t curr_index
        for i in range(4):
            curr_index = self.rectangle_vertex_count * RECTANGLE_VERTEX_STRIDE
            self._set_vertex_data_from_rectangle(curr_index, positions[i], local_positions[i], color, thickness, _fade)
            self.rectangle_vertex_count += 1


    # line functions ----------------------------------- #
    @cython.boundscheck(False)
    @cython.wraparound(False)
    cdef void _set_vertex_data_from_line(self, Py_ssize_t curr_index, float[3] position, float[4] color) nogil:
        self.line_vertices[curr_index + 0] = position[0]
        self.line_vertices[curr_index + 1] = position[1]
        self.line_vertices[curr_index + 2] = position[2]
        self.line_vertices[curr_index + 3] = color[0]
        self.line_vertices[curr_index + 4] = color[1]
        self.line_vertices[curr_index + 5] = color[2]
        self.line_vertices[curr_index + 6] = color[3]


    def draw_line(self, color, start, end, float width=1.0):
        cdef float[4] t_color
        self._handle_color(color, t_color)
        cdef float[2] t_start = [start[0], start[1]]
        cdef float[2] t_end = [end[0], end[1]]

        self.cy_draw_line(t_color, t_start, t_end, width)


    cdef void cy_draw_line(self, float[4] color, float[2] start, float[2] end, float width):
        if (self.line_vertex_count >= MAX_VERTEX_COUNT):
            self._end_line_batch()
            self._begin_line_batch()

        cdef float corner_angle = math.atan2(end[1] - start[1], end[0] - start[0]) + math.pi / 2
        cdef float[2] corner_offset
        self._rotate_vector2([width / 2, 0], corner_angle, corner_offset)
        cdef float[4][3] positions = [
            [start[0] + corner_offset[0], start[1] + corner_offset[1], 0],
            [start[0] - corner_offset[0], start[1] - corner_offset[1], 0],
            [end[0] - corner_offset[0], end[1] - corner_offset[1], 0],
            [end[0] + corner_offset[0], end[1] + corner_offset[1], 0],
        ]

        cdef int i
        cdef Py_ssize_t curr_index
        for i in range(4):
            curr_index = self.line_vertex_count * LINE_VERTEX_STRIDE
            self._set_vertex_data_from_line(curr_index, positions[i], color)
            self.line_vertex_count += 1
            

    def draw_lines(self, color, points, float width=1.0):
        cdef float[4] t_color
        self._handle_color(color, t_color)

        cdef Py_ssize_t i
        cdef float[2] t_start
        cdef float[2] t_end = points[0]
        for i in range(1, len(points)):
            point = points[i]
            t_start = t_end
            t_end = [point[0], point[1]]
            self.cy_draw_line(t_color, t_start, t_end, width)


    def draw_lines_miter(self, color, points, float width=1.0):
        pass


    cdef void _rotate_vector2(self, float[2] vector, float angle, float[2] result) nogil:
        cdef float s = math.sin(angle)
        cdef float c = math.cos(angle)
        result[0] = vector[0] * c - vector[1] * s
        result[1] = vector[0] * s + vector[1] * c


    cdef void _rotate_vector(self, float[3] vector, float angle, float[3] result) nogil:
        cdef float s = math.sin(angle)
        cdef float c = math.cos(angle)
        result[0] = vector[0] * c - vector[1] * s
        result[1] = vector[0] * s + vector[1] * c
        result[2] = vector[2]

