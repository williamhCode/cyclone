import time
from pathlib import Path

from .utilities import set_cwd

# cimport cython
from libc cimport math
from libcpp.vector cimport vector

from engine.libs.glad cimport *
from engine.shader cimport *


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
        # shaders
        Shader quad_shader
        Shader circle_shader
        Shader rectangle_shader
        Shader line_shader
        Shader[4] shaders

    def __init__(self):
        glEnable(GL_BLEND)
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)

        self.quad_shader = shader_create(b'./engine/shaders/quad.vert', b'./engine/shaders/quad.frag')
        self.circle_shader = shader_create(b'./engine/shaders/circle.vert', b'./engine/shaders/circle.frag')
        self.rectangle_shader = shader_create(b'./engine/shaders/rectangle.vert', b'./engine/shaders/rectangle.frag')
        self.line_shader = shader_create(b'./engine/shaders/line.vert', b'./engine/shaders/line.frag')
        self.shaders = [self.quad_shader, self.circle_shader, self.rectangle_shader, self.line_shader]

    def set_size(self, width: int, height: int):
        pass

    def set_clear_color(self, color):
        pass
    
    def clear(self):
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)

    def begin(self, view_matrix=None):
        pass

    def end(self):
        pass

    def draw_texture(self, texture: Texture, position, float rotation=0.0, offset=[0.0, 0.0], bint flipped=False, color=[255, 255, 255, 255]):
        pass

    def draw_circle(self, color, position, float radius, float width = 0.0, float fade = 0.0):
        pass

    def draw_rectangle(self, color, position, size, float rotation=0.0, offset=[0.0, 0.0], float width=0.0, float fade=0.0):
        pass

    def draw_line(self, color, start, end, float width=1.0):
        pass

    def draw_lines(self, color, points, float width=1.0):
        pass

    def draw_lines_miter(self, color, points, float width=1.0):
        pass

