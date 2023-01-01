from engine.libs.glad cimport *
from engine.texture cimport Texture


cdef class Surface(Texture):

    def __init__(self, size, bint resize_nearest=False):
        self.resize_nearest = resize_nearest
        self.width = size[0]
        self.height = size[1]
        self._generate_texture(NULL)

        # setup framebuffer
        glGenFramebuffers(1, &self.fbo)
        glBindFramebuffer(GL_FRAMEBUFFER, self.fbo)

        # attach texture to framebuffer
        glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, self.texture_id, 0)

        glBindFramebuffer(GL_FRAMEBUFFER, 0)

    def __dealloc__(self):
        super().__dealloc__()
        glDeleteFramebuffers(1, &self.fbo)

