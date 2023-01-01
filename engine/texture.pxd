from engine.libs.glad cimport *


cdef class Texture:
    cdef:
        GLuint texture_id
        public int width
        public int height
        public bint resize_nearest

    cdef _generate_texture(self, unsigned char *data)
