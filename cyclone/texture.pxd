from cyclone.lib.glad cimport *
from cyclone.lib.stb_image cimport *

from cyclone.window cimport Window

from libc.stdio cimport *


cdef class Texture:
    cdef:
        GLuint texture_id
        int orig_width
        int orig_height
        public int width
        public int height

    cdef update_data(self, unsigned char *data)

cdef class RenderTexture(Texture):
    cdef:
        GLuint fbo
        public int framebuffer_width
        public int framebuffer_height
