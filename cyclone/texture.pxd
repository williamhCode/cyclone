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

    cdef _init(
        self, int width, int height, unsigned char *data, bint resize_nearest
    )

    cdef _gen_texture(
        self, int width, int height, unsigned char *data, bint resize_nearest
    )


cdef class RenderTexture(Texture):
    cdef:
        GLuint fbo
        readonly int framebuffer_width
        readonly int framebuffer_height
