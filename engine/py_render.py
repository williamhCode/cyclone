import time
from pathlib import Path

from OpenGL.GL import *
import glm
import numpy as np
from PIL import Image

from .utiliies import set_cwd
from .shader import Shader

MAX_QUAD_COUNT = 10000
MAX_VERTEX_COUNT = MAX_QUAD_COUNT * 4
MAX_INDEX_COUNT = MAX_QUAD_COUNT * 6
MAX_TEXTURES = 16
QUAD_VERTEX_STRIDE = 10
CIRCLE_VERTEX_STRIDE = 11

class RenderData:
    quad_vao: np.uint32
    quad_vbo: np.uint32
    quad_ibo: np.uint32
    
    circle_vao: np.uint32
    circle_vbo: np.uint32
    circle_ibo: np.uint32

    quad_vertices: "glm.array[glm.float32]"
    quad_vertex_count: int

    circle_vertices: "glm.array[glm.float32]"
    circle_vertex_count: int

    white_texture: np.uint32

    texture_slots: list[int]
    texture_slot_index: int

    quad_shader: Shader
    circle_shader: Shader

    shaders: list[Shader]

    texture_map = {}
    
_data = RenderData()

def init():
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
    _data.quad_vertices = glm.array.zeros(MAX_VERTEX_COUNT * QUAD_VERTEX_STRIDE, glm.float32)
    
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
    indices = glm.array.zeros(MAX_INDEX_COUNT, glm.uint32)
    offset = 0
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
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, indices.nbytes, indices.ptr, GL_STATIC_DRAW)

    # circle initialization 
    _data.circle_vertices = glm.array.zeros(MAX_VERTEX_COUNT * CIRCLE_VERTEX_STRIDE, glm.float32)

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
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, indices.nbytes, indices.ptr, GL_STATIC_DRAW)

    # create 1x1 white texture
    _data.white_texture = glGenTextures(1)
    glBindTexture(GL_TEXTURE_2D, _data.white_texture)
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR)
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR)
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT)
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT)
    color = glm.array(glm.uint8, 255, 255, 255, 255)
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, 1, 1, 0, GL_RGBA, GL_UNSIGNED_BYTE, color.ptr)

    _data.texture_slots = [0] * MAX_TEXTURES
    _data.texture_slots[0] = _data.white_texture

def on_resize(width: int, height: int):
    view_matrix = glm.ortho(0, width, 0, height, 0, 1.0)
    for shader in _data.shaders:
        shader.use()
        shader.set_mat4('u_Proj', view_matrix)

def _begin_quad_batch():
    _data.quad_vertex_count = 0
    _data.texture_slot_index = 1

def _begin_circle_batch():
    _data.circle_vertex_count = 0

def begin():
    _begin_quad_batch()
    _begin_circle_batch()

def _end_quad_batch():
    glBindBuffer(GL_ARRAY_BUFFER, _data.quad_vbo)
    glBufferSubData(GL_ARRAY_BUFFER, 0, _data.quad_vertex_count * QUAD_VERTEX_STRIDE * 4, _data.quad_vertices.ptr)

    for i in range(_data.texture_slot_index):
        glActiveTexture(GL_TEXTURE0 + i)
        glBindTexture(GL_TEXTURE_2D, _data.texture_slots[i])

    _data.quad_shader.use()
    glBindVertexArray(_data.quad_vao)
    index_count = _data.quad_vertex_count // 4 * 6
    glDrawElements(GL_TRIANGLES, index_count, GL_UNSIGNED_INT, None)

def _end_circle_batch():
    glBindBuffer(GL_ARRAY_BUFFER, _data.circle_vbo)
    glBufferSubData(GL_ARRAY_BUFFER, 0, _data.circle_vertex_count * CIRCLE_VERTEX_STRIDE * 4, _data.circle_vertices.ptr)

    _data.circle_shader.use()
    glBindVertexArray(_data.circle_vao)
    index_count = _data.circle_vertex_count // 4 * 6
    glDrawElements(GL_TRIANGLES, index_count, GL_UNSIGNED_INT, None)

def end():
    _end_quad_batch()
    _end_circle_batch()

# quad functions --------------------------------------------------------------- #
def _set_vertex_data_from_quad(curr_index, position, color, tex_coord, tex_index):
    _data.quad_vertices[curr_index + 0] = position[0]
    _data.quad_vertices[curr_index + 1] = position[1]
    _data.quad_vertices[curr_index + 2] = position[2]
    _data.quad_vertices[curr_index + 3] = color[0]
    _data.quad_vertices[curr_index + 4] = color[1]
    _data.quad_vertices[curr_index + 5] = color[2]
    _data.quad_vertices[curr_index + 6] = color[3]
    _data.quad_vertices[curr_index + 7] = tex_coord[0]
    _data.quad_vertices[curr_index + 8] = tex_coord[1]
    _data.quad_vertices[curr_index + 9] = tex_index 

def _draw_quad(position, size, color, texture_index):
    positions = (
        (position[0], position[1], 0),
        (position[0] + size[0], position[1], 0),
        (position[0] + size[0], position[1] + size[1], 0),
        (position[0], position[1] + size[1], 0)
    )
    tex_coords = (
        (0.0, 0.0),
        (1.0, 0.0),
        (1.0, 1.0),
        (0.0, 1.0)
    )

    for i in range(4):
        curr_index = _data.quad_vertex_count * QUAD_VERTEX_STRIDE
        _set_vertex_data_from_quad(curr_index, positions[i], color, tex_coords[i], texture_index)
        _data.quad_vertex_count += 1

def draw_colored_quad(color, position, size):
    if (_data.quad_vertex_count >= MAX_VERTEX_COUNT):
        _end_quad_batch()
        _begin_quad_batch()

    color = tuple(map(lambda x: x / 255, color))
    texture_index = 0.0
    _draw_quad(position, size, color, texture_index)

def draw_textured_quad(position, size, texture_id):
    if (_data.quad_vertex_count >= MAX_VERTEX_COUNT or _data.texture_slot_index >= MAX_TEXTURES):
        _end_quad_batch()
        _begin_quad_batch()

    color = (1.0, 1.0, 1.0, 1.0)

    texture_index = 0.0
    for i in range(1, _data.texture_slot_index):
        if (_data.texture_slots[i] == texture_id):
            texture_index = float(i)
            break
    # texture_index = float(_s_data.texture_map.get(texture_id, 0))

    if (texture_index == 0.0):
        texture_index = float(_data.texture_slot_index)
        _data.texture_slots[_data.texture_slot_index] = texture_id
        # _s_data.texture_map[texture_id] = _s_data.texture_slot_index
        _data.texture_slot_index += 1
    
    _draw_quad(position, size, color, texture_index)

# circle functions --------------------------------------------------------------- #
def _set_vertex_data_from_circle(curr_index, position, local_position, color, thickness, fade):
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

def draw_circle(color, center, radius, width=0, fade=0):
    if (_data.circle_vertex_count >= MAX_VERTEX_COUNT):
        _end_circle_batch()
        _begin_circle_batch()

    positions = (
        (center[0] - radius, center[1] - radius, 0),
        (center[0] + radius, center[1] - radius, 0),
        (center[0] + radius, center[1] + radius, 0),
        (center[0] - radius, center[1] + radius, 0)
    )

    local_positions = (
        (-1.0, -1.0),
        ( 1.0, -1.0),
        ( 1.0,  1.0),
        (-1.0,  1.0)
    )

    color = tuple(map(lambda x: x / 255, color))

    if width == 0:
        thickness = 1.0
    else:
        thickness = width / radius

    for i in range(4):
        curr_index = _data.circle_vertex_count * CIRCLE_VERTEX_STRIDE
        _set_vertex_data_from_circle(curr_index, positions[i], local_positions[i], color, thickness, fade)
        _data.circle_vertex_count += 1
