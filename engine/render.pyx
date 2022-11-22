import time
from pathlib import Path

from .utilities import set_cwd

# cimport cython
from libc cimport math
from libcpp.vector cimport vector

from engine.libs.glad cimport *
from engine.shader cimport Shader


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
        
        vector[float] quad_vertices
        int quad_vertex_count 

        unsigned int[MAX_TEXTURES] texture_slots
        int texture_slot_index

        # circle variables
        unsigned int circle_vao
        unsigned int circle_vbo
        unsigned int circle_ibo
        
        vector[float] circle_vertices
        int circle_vertex_count 

        # rectangle variables
        unsigned int rectangle_vao
        unsigned int rectangle_vbo
        unsigned int rectangle_ibo

        vector[float] rectangle_vertices
        int rectangle_vertex_count 

        # line variables
        unsigned int line_vao
        unsigned int line_vbo
        unsigned int line_ibo

        vector[float] line_vertices
        int line_vertex_count 

        # shaders
        Shader quad_shader
        Shader circle_shader
        Shader rectangle_shader
        Shader line_shader
        list shaders

        # matrices
        object view_matrix

    def __init__(self):
        glEnable(GL_BLEND)
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)

        self.quad_shader = Shader(b'./engine/shaders/quad.vert', b'./engine/shaders/quad.frag')
        self.circle_shader = Shader(b'./engine/shaders/circle.vert', b'./engine/shaders/circle.frag')
        self.rectangle_shader = Shader(b'./engine/shaders/rectangle.vert', b'./engine/shaders/rectangle.frag')
        self.line_shader = Shader(b'./engine/shaders/line.vert', b'./engine/shaders/line.frag')

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

