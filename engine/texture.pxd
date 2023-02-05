from engine.lib.glad cimport *

from engine.window cimport Window


cdef class Texture:
    cdef:
        GLuint texture_id
        public int width
        public int height
        public bint resize_nearest

    cdef _generate_texture(self, unsigned char *data, int width, int height)


cdef class TextureTarget(Texture):
    cdef:
        GLuint fbo
        public int framebuffer_width
        public int framebuffer_height

