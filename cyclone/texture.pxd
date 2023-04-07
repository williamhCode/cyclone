from cyclone.lib.glad cimport *
from cyclone.lib.stb_image cimport *

cimport cyclone
from cyclone.window cimport Window


cdef class Texture:
    cdef:
        GLuint texture_id
        public int width
        public int height
        int orig_width
        int orig_height
        readonly int framebuffer_width
        readonly int framebuffer_height

    cdef _init(
        self,
        int[2] size,
        unsigned char *data,
        bint resize_nearest,
        int[2] framebuffer_size = *,
    )


cdef class RenderTexture(Texture):
    cdef:
        GLuint fbo
