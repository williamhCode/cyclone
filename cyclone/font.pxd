from libc.stdlib cimport malloc, free
from libc.string cimport memset, memcpy

from cyclone.lib.freetype cimport *
from cyclone.lib.cglm cimport *
from cyclone.lib.glad cimport *

cimport cyclone
from cyclone.texture cimport Texture
from cyclone.window cimport Window


cdef struct CharData:
    vec2 size
    vec2 bearing
    float advance


cdef class Font:
    cdef:
        public Texture texture
        CharData char_datas[128]
        int size
