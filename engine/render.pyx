import time
from pathlib import Path

from .utilities import set_cwd

# cimport cython
from libc cimport math
from libcpp.vector cimport vector

from engine.libs.glad cimport *


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
        object quad_shader
        object circle_shader
        object rectangle_shader
        object line_shader
        list shaders

        # matrices
        object view_matrix


    def __init__(self):
        pass

