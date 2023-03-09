from cyclone.lib.glad cimport *
from cyclone.lib.stb_image cimport *

from cyclone.window cimport Window


cdef class Texture:
    cdef:
        GLuint texture_id
        int orig_width
        int orig_height
        public int width
        public int height
        public bint resize_nearest

    cdef void _generate_texture(self, unsigned char *data, int width, int height)


cdef class RenderTexture(Texture):
    cdef:
        GLuint fbo
        public int framebuffer_width
        public int framebuffer_height