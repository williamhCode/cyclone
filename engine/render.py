import time
from pathlib import Path

from OpenGL.GL import *
import glm
import numpy as np
from PIL import Image

# from .utiliies import set_cwd
from .shader import Shader


def load_texture(filepath: str) -> GLuint | np.uint32:
    texture_id = glGenTextures(1)
    glBindTexture(GL_TEXTURE_2D, texture_id)

    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR)
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR)
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT)
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT)

    image = Image.open(filepath)
    image = image.transpose(Image.TRANSPOSE.FLIP_TOP_BOTTOM)
    img_data = image.convert("RGBA").tobytes()

    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, image.width, image.height, 0, GL_RGBA, GL_UNSIGNED_BYTE, img_data)

    return texture_id
    

MAX_QUAD_COUNT = 10000
MAX_VERTEX_COUNT = MAX_QUAD_COUNT * 4
MAX_INDEX_COUNT = MAX_QUAD_COUNT * 6
MAX_TEXTURES = 16
VERTEX_STRIDE = 10

class RenderData:
    vao: GLuint | np.uint32
    vbo: GLuint | np.uint32
    ibo: GLuint | np.uint32

    white_texture: GLuint | np.uint32

    # glm.array[glm.float32]
    vertices: glm.array
    vertex_count = 0 

    # glm.array[glm.uint32]
    texture_slots: list[int]
    texture_slot_index = 1
    texture_map = {}
    
    quad_shader: Shader
    
_s_data = RenderData()

def init():
    _s_data.quad_shader = Shader('engine/shaders/quad.vert', 'engine/shaders/quad.frag')
    _s_data.quad_shader.use()
    values = glm.array(np.arange(MAX_TEXTURES, dtype=np.uint32))
    _s_data.quad_shader.set_int_array('u_Textures', values)

    # generate vertices
    _s_data.vertices = glm.array.zeros(MAX_VERTEX_COUNT * VERTEX_STRIDE, glm.float32)
    
    # generate vertex array object
    _s_data.vao = glGenVertexArrays(1)
    glBindVertexArray(_s_data.vao)
    
    # generate vertex buffer object and allocate memory
    _s_data.vbo = glGenBuffers(1)
    glBindBuffer(GL_ARRAY_BUFFER, _s_data.vbo)
    glBufferData(GL_ARRAY_BUFFER, _s_data.vertices.nbytes, None, GL_DYNAMIC_DRAW)

    # set vertex attribute pointers
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

    _s_data.ibo = glGenBuffers(1)
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _s_data.ibo)
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, indices.nbytes, indices.ptr, GL_STATIC_DRAW)

    # create 1x1 white texture
    _s_data.white_texture = glGenTextures(1)
    glBindTexture(GL_TEXTURE_2D, _s_data.white_texture)
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR)
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR)
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT)
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT)
    color = glm.array(glm.uint8, 255, 255, 255, 255)
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, 1, 1, 0, GL_RGBA, GL_UNSIGNED_BYTE, color.ptr)

    # _s_data.texture_slots = glm.array.zeros(MAX_TEXTURES, glm.uint32)
    _s_data.texture_slots = [0] * MAX_TEXTURES
    _s_data.texture_slots[0] = _s_data.white_texture

def on_resize(width: int, height: int):
    view_matrix = glm.ortho(0, width, 0, height, -1, 1)
    _s_data.quad_shader.use()
    _s_data.quad_shader.set_mat4('u_ViewProj', view_matrix)

def begin_batch():
    _s_data.vertex_count = 0
    _s_data.texture_slot_index = 1
    _s_data.texture_map = {}

def end_batch():
    glBindBuffer(GL_ARRAY_BUFFER, _s_data.vbo)
    glBufferSubData(GL_ARRAY_BUFFER, 0, _s_data.vertex_count * VERTEX_STRIDE * 4, _s_data.vertices.ptr)

def flush():
    for i in range(_s_data.texture_slot_index):
        glActiveTexture(GL_TEXTURE0 + i)
        glBindTexture(GL_TEXTURE_2D, _s_data.texture_slots[i])

    glBindVertexArray(_s_data.vao)
    index_count = _s_data.vertex_count // 4 * 6
    glDrawElements(GL_TRIANGLES, index_count, GL_UNSIGNED_INT, None)

def set_vertex_data_from_quad(curr_index, position, color, tex_coord, tex_index):
    _s_data.vertices[curr_index + 0] = position[0]
    _s_data.vertices[curr_index + 1] = position[1]
    _s_data.vertices[curr_index + 2] = position[2]
    _s_data.vertices[curr_index + 3] = color[0]
    _s_data.vertices[curr_index + 4] = color[1]
    _s_data.vertices[curr_index + 5] = color[2]
    _s_data.vertices[curr_index + 6] = color[3]
    _s_data.vertices[curr_index + 7] = tex_coord[0]
    _s_data.vertices[curr_index + 8] = tex_coord[1]
    _s_data.vertices[curr_index + 9] = tex_index 

def draw_colored_quad(position, size, color):
    if (_s_data.vertex_count >= MAX_VERTEX_COUNT):
        end_batch()
        flush()
        begin_batch()

    texture_index = 0.0
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
        curr_index = _s_data.vertex_count * VERTEX_STRIDE
        set_vertex_data_from_quad(curr_index, positions[i], color, tex_coords[i], texture_index)
        _s_data.vertex_count += 1

def draw_textured_quad(position, size, texture_id):
    if (_s_data.vertex_count >= MAX_VERTEX_COUNT or _s_data.texture_slot_index >= MAX_TEXTURES):
        end_batch()
        flush()
        begin_batch() 

    color = (1.0, 1.0, 1.0, 1.0)

    texture_index = 0.0
    for i in range(1, _s_data.texture_slot_index):
        if (_s_data.texture_slots[i] == texture_id):
            texture_index = float(i)
            break
    # texture_index = float(_s_data.texture_map.get(texture_id, 0))

    if (texture_index == 0.0):
        texture_index = float(_s_data.texture_slot_index)
        _s_data.texture_slots[_s_data.texture_slot_index] = texture_id
        # _s_data.texture_map[texture_id] = _s_data.texture_slot_index
        _s_data.texture_slot_index += 1
    
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
        curr_index = _s_data.vertex_count * VERTEX_STRIDE
        set_vertex_data_from_quad(curr_index, positions[i], color, tex_coords[i], texture_index)
        _s_data.vertex_count += 1


def draw_circle(color, center, radius, width=0):
    pass