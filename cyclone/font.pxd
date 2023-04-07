from libc.stdlib cimport malloc, free
from libc.string cimport memset, memcpy

from cyclone.lib.freetype cimport *
from cyclone.lib.cglm cimport *

cimport cyclone
from cyclone.texture cimport Texture
from cyclone.window cimport Window


cdef struct CharData:
    vec2 bearing
    unsigned int advance


cdef class Font:
    cdef:
        public Texture texture
        CharData char_datas[128]
        int size
