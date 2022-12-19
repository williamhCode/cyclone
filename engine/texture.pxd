from engine.libs.glad cimport *


cdef class Texture:
    cdef:
        GLuint texture_id
        readonly int width
        readonly int height

