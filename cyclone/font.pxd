from libc.stdlib cimport malloc, free
from libc.string cimport memset

from cyclone.lib.freetype cimport *
from cyclone.lib.cglm cimport *

from cyclone.texture cimport Texture


cdef struct CharData:
    vec2 bearing
    unsigned int advance


cdef class Font:
    cdef:
        public Texture texture
        CharData char_datas[128]
        int size
