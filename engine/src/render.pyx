import time
from pathlib import Path

from OpenGL.GL import *
import glm
import numpy as np

from .utiliies import set_cwd
from .shader import Shader

import ctypes

# cimport test
# cdef test.TestClass tc = test.TestClass()
# print(tc.x, tc.y)

DEF MAX_QUAD_COUNT = 100000
DEF MAX_VERTEX_COUNT = MAX_QUAD_COUNT * 4
DEF MAX_INDEX_COUNT = MAX_QUAD_COUNT * 6
DEF MAX_TEXTURES = 16
DEF QUAD_VERTEX_STRIDE = 10
DEF CIRCLE_VERTEX_STRIDE = 11

cdef class RenderData:
    cdef unsigned int quad_vao
    cdef unsigned int quad_vbo
    cdef unsigned int quad_ibo

    cdef unsigned int circle_vao
    cdef unsigned int circle_vbo
    cdef unsigned int circle_ibo

    cdef float[:] quad_vertices
    cdef int quad_vertex_count 

    cdef float[:] circle_vertices
    cdef int circle_vertex_count 

    cdef unsigned int white_texture

    cdef unsigned int[MAX_TEXTURES] texture_slots
    cdef int texture_slot_index

    # python objects
    cdef object quad_shader
    cdef object circle_shader
    cdef list shaders

cdef RenderData _data = RenderData()

cpdef void init():
    # glEnable(GL_DEPTH_TEST)
    glEnable(GL_BLEND)
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)
    
    with set_cwd(Path(__file__).parent.resolve()):
        _data.quad_shader = Shader('shaders/quad.vert', 'shaders/quad.frag')
        _data.circle_shader = Shader('shaders/circle.vert', 'shaders/circle.frag')
        _data.shaders = [_data.quad_shader, _data.circle_shader]
        
    _data.quad_shader.use()
    values = glm.array(np.arange(MAX_TEXTURES, dtype=np.uint32))
    _data.quad_shader.set_int_array('u_Textures', values)

    # quad initialization
    _data.quad_vertices = np.zeros(MAX_VERTEX_COUNT * QUAD_VERTEX_STRIDE, dtype=np.float32)
    
    _data.quad_vao = glGenVertexArrays(1)
    glBindVertexArray(_data.quad_vao)
    
    _data.quad_vbo = glGenBuffers(1)
    glBindBuffer(GL_ARRAY_BUFFER, _data.quad_vbo)
    glBufferData(GL_ARRAY_BUFFER, _data.quad_vertices.nbytes, None, GL_DYNAMIC_DRAW)

    # 3 position, 4 color, 2 tex_coords, 1 tex_index
    # size = (3 + 4 + 2 + 1) * 4 = 40
    glEnableVertexAttribArray(0)
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 40, ctypes.c_void_p((0) * 4))

    glEnableVertexAttribArray(1)
    glVertexAttribPointer(1, 4, GL_FLOAT, GL_FALSE, 40, ctypes.c_void_p((0 + 3) * 4))

    glEnableVertexAttribArray(2)
    glVertexAttribPointer(2, 2, GL_FLOAT, GL_FALSE, 40, ctypes.c_void_p((0 + 3 + 4) * 4))

    glEnableVertexAttribArray(3)
    glVertexAttribPointer(3, 1, GL_FLOAT, GL_FALSE, 40, ctypes.c_void_p((0 + 3 + 4 + 2) * 4))

    # generate index buffer object and buffer data
    cdef unsigned int[:] indices = np.zeros(MAX_INDEX_COUNT, dtype=np.uint32)
    cdef int offset = 0
    cdef int i
    for i in range(0, MAX_INDEX_COUNT, 6):
        indices[i + 0] = offset + 0
        indices[i + 1] = offset + 1
        indices[i + 2] = offset + 2
        indices[i + 3] = offset + 2
        indices[i + 4] = offset + 3
        indices[i + 5] = offset + 0
        offset += 4

    _data.quad_ibo = glGenBuffers(1)
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _data.quad_ibo)
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, indices.nbytes, np.asarray(indices), GL_STATIC_DRAW)

    # circle initialization
    _data.circle_vertices = np.zeros(MAX_VERTEX_COUNT * CIRCLE_VERTEX_STRIDE, np.float32)

    _data.circle_vao = glGenVertexArrays(1)
    glBindVertexArray(_data.circle_vao)

    _data.circle_vbo = glGenBuffers(1)
    glBindBuffer(GL_ARRAY_BUFFER, _data.circle_vbo)
    glBufferData(GL_ARRAY_BUFFER, _data.circle_vertices.nbytes, None, GL_DYNAMIC_DRAW)

    # 3 position, 2 local_position, 4 color, 1 thickness, 1 fade
    # size = (3 + 2 + 4 + 1 + 1) * 4 = 44
    glEnableVertexAttribArray(0)
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 44, ctypes.c_void_p((0) * 4))

    glEnableVertexAttribArray(1)
    glVertexAttribPointer(1, 2, GL_FLOAT, GL_FALSE, 44, ctypes.c_void_p((0 + 3) * 4))

    glEnableVertexAttribArray(2)
    glVertexAttribPointer(2, 4, GL_FLOAT, GL_FALSE, 44, ctypes.c_void_p((0 + 3 + 2) * 4))

    glEnableVertexAttribArray(3)
    glVertexAttribPointer(3, 1, GL_FLOAT, GL_FALSE, 44, ctypes.c_void_p((0 + 3 + 2 + 4) * 4))

    glEnableVertexAttribArray(4)
    glVertexAttribPointer(4, 1, GL_FLOAT, GL_FALSE, 44, ctypes.c_void_p((0 + 3 + 2 + 4 + 1) * 4))

    _data.circle_ibo = glGenBuffers(1)
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _data.circle_ibo)
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, indices.nbytes, np.asarray(indices), GL_STATIC_DRAW)

    # create 1x1 white texture
    _data.white_texture = glGenTextures(1)
    glBindTexture(GL_TEXTURE_2D, _data.white_texture)
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR)
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR)
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT)
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT)
    cdef unsigned char[4] color = [255, 255, 255, 255]
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, 1, 1, 0, GL_RGBA, GL_UNSIGNED_BYTE, color)

    _data.texture_slots = np.zeros(MAX_TEXTURES, dtype=np.uint32)
    _data.texture_slots[0] = _data.white_texture

cpdef void on_resize(width: int, height: int):
    view_matrix = glm.ortho(0, width, 0, height, 0, 1.0)
    for shader in _data.shaders:
        shader.use()
        shader.set_mat4('u_Proj', view_matrix)

# begin functions --------------------------------- #
cdef void _begin_quad_batch():
    _data.quad_vertex_count = 0
    _data.texture_slot_index = 1

cdef void _begin_circle_batch():
    _data.circle_vertex_count = 0

cpdef void begin():
    _begin_quad_batch()
    _begin_circle_batch()

# end functions --------------------------------- #
cdef void _end_quad_batch():
    glBindBuffer(GL_ARRAY_BUFFER, _data.quad_vbo)
    glBufferSubData(GL_ARRAY_BUFFER, 0, _data.quad_vertex_count * QUAD_VERTEX_STRIDE * 4, np.asarray(_data.quad_vertices))

    cdef int i
    for i in range(_data.texture_slot_index):
        glActiveTexture(GL_TEXTURE0 + i)
        glBindTexture(GL_TEXTURE_2D, _data.texture_slots[i])

    _data.quad_shader.use()
    glBindVertexArray(_data.quad_vao)
    cdef int index_count = _data.quad_vertex_count // 4 * 6
    glDrawElements(GL_TRIANGLES, index_count, GL_UNSIGNED_INT, None)

cdef void _end_circle_batch():
    glBindBuffer(GL_ARRAY_BUFFER, _data.circle_vbo)
    glBufferSubData(GL_ARRAY_BUFFER, 0, _data.circle_vertex_count * CIRCLE_VERTEX_STRIDE * 4, np.asarray(_data.circle_vertices))

    _data.circle_shader.use()
    glBindVertexArray(_data.circle_vao)
    cdef int index_count = _data.circle_vertex_count // 4 * 6
    glDrawElements(GL_TRIANGLES, index_count, GL_UNSIGNED_INT, None)

cpdef void end():
    _end_quad_batch()
    _end_circle_batch()

# quad functions ------------------------------------- #
cdef void _set_vertex_data_from_quad(int curr_index, float[3] position, float[4] color, float[2] tex_coords, float tex_index):
    _data.quad_vertices[curr_index + 0] = position[0]
    _data.quad_vertices[curr_index + 1] = position[1]
    _data.quad_vertices[curr_index + 2] = position[2]
    _data.quad_vertices[curr_index + 3] = color[0]
    _data.quad_vertices[curr_index + 4] = color[1]
    _data.quad_vertices[curr_index + 5] = color[2]
    _data.quad_vertices[curr_index + 6] = color[3]
    _data.quad_vertices[curr_index + 7] = tex_coords[0]
    _data.quad_vertices[curr_index + 8] = tex_coords[1]
    _data.quad_vertices[curr_index + 9] = tex_index 

cpdef void draw_colored_quad(color, position, size):
    if (_data.quad_vertex_count >= MAX_VERTEX_COUNT):
        _end_quad_batch()
        _begin_quad_batch()

    cdef float[4] cy_color = [color[0]/255, color[1]/255, color[2]/255, color[3]/255]

    cdef float texture_index = 0.0

    cdef float[4][3] positions = [
        [position[0], position[1], 0],
        [position[0] + size[0], position[1], 0],
        [position[0] + size[0], position[1] + size[1], 0],
        [position[0], position[1] + size[1], 0]
    ]

    cdef float[4][2] tex_coords = [
        [0, 0],
        [1, 0],
        [1, 1],
        [0, 1]
    ]

    cdef int i
    cdef int curr_index
    for i in range(4):
        curr_index = _data.quad_vertex_count * QUAD_VERTEX_STRIDE
        _set_vertex_data_from_quad(curr_index, positions[i], cy_color, tex_coords[i], texture_index)
        _data.quad_vertex_count += 1

cpdef void draw_textured_quad(unsigned int texture_id, position, size):
    if (_data.quad_vertex_count >= MAX_VERTEX_COUNT or _data.texture_slot_index >= MAX_TEXTURES):
        _end_quad_batch()
        _begin_quad_batch()

    cdef float[4] color = [1.0, 1.0, 1.0, 1.0]

    cdef float texture_index = 0.0
    cdef int i
    for i in range(1, _data.texture_slot_index):
        if (_data.texture_slots[i] == texture_id):
            texture_index = <float>i
            break

    if (texture_index == 0.0):
        texture_index = <float>_data.texture_slot_index
        _data.texture_slots[_data.texture_slot_index] = texture_id
        _data.texture_slot_index += 1
        
    cdef float[4][3] positions = [
        [position[0], position[1], 0],
        [position[0] + size[0], position[1], 0],
        [position[0] + size[0], position[1] + size[1], 0],
        [position[0], position[1] + size[1], 0]
    ]

    cdef float[4][2] tex_coords = [
        [0, 0],
        [1, 0],
        [1, 1],
        [0, 1]
    ]
    
    cdef int curr_index
    for i in range(4):
        curr_index = _data.quad_vertex_count * QUAD_VERTEX_STRIDE
        _set_vertex_data_from_quad(curr_index, positions[i], color, tex_coords[i], texture_index)
        _data.quad_vertex_count += 1

# circle functions ----------------------------------- #
cdef void _set_vertex_data_from_circle(int curr_index, float[3] position, float[2] local_position, float[4] color, float thickness, float fade):
    _data.circle_vertices[curr_index + 0] = position[0]
    _data.circle_vertices[curr_index + 1] = position[1]
    _data.circle_vertices[curr_index + 2] = position[2]
    _data.circle_vertices[curr_index + 3] = local_position[0]
    _data.circle_vertices[curr_index + 4] = local_position[1]
    _data.circle_vertices[curr_index + 5] = color[0]
    _data.circle_vertices[curr_index + 6] = color[1]
    _data.circle_vertices[curr_index + 7] = color[2]
    _data.circle_vertices[curr_index + 8] = color[3]
    _data.circle_vertices[curr_index + 9] = thickness
    _data.circle_vertices[curr_index + 10] = fade

cpdef void draw_circle(color, center, float radius, float width=0.0, float fade=0.0):
    if (_data.circle_vertex_count >= MAX_VERTEX_COUNT):
        _end_circle_batch()
        _begin_circle_batch()

    cdef float[4][3] positions = [
        [center[0] - radius, center[1] - radius, 0],
        [center[0] + radius, center[1] - radius, 0],
        [center[0] + radius, center[1] + radius, 0],
        [center[0] - radius, center[1] + radius, 0]
    ]
    
    cdef float[4][2] local_positions = [
        [-1.0, -1.0],
        [ 1.0, -1.0],
        [ 1.0,  1.0],
        [-1.0,  1.0]
    ]

    cdef float[4] cy_color = [color[0]/255, color[1]/255, color[2]/255, color[3]/255]

    cdef float thickness
    if width == 0:
        thickness = 1.0
    else:
        thickness = width / radius

    for i in range(4):
        curr_index = _data.circle_vertex_count * CIRCLE_VERTEX_STRIDE
        _set_vertex_data_from_circle(curr_index, positions[i], local_positions[i], cy_color, thickness, fade)
        _data.circle_vertex_count += 1

# line functions ----------------------------------- #
cpdef void draw_rectangle(color, position, size, float width=0.0, float fade=0.0):
    pass