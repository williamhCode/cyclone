from engine.lib.glad cimport *
from engine.lib.stb_image cimport *

from engine.window import Window


cdef class Texture:

    def __init__(self, str filepath, bint resize_nearest=False):
        self.resize_nearest = resize_nearest

        # load data from filapath
        stbi_set_flip_vertically_on_load(1)
        cdef int n
        cdef unsigned char *data = stbi_load(filepath.encode(), &self.width, &self.height, &n, 4)

        # create texture
        if data:
            self._generate_texture(data, self.width, self.height)
        else:
            raise RuntimeError(f"Failed to load texture at {filepath}")

        stbi_image_free(data)

    def __del__(self):
        glDeleteTextures(1, &self.texture_id)

    # initialize width, height, and resize_nearest before calling this function
    cdef _generate_texture(self, unsigned char *data, int width, int height):
        glGenTextures(1, &self.texture_id)
        glBindTexture(GL_TEXTURE_2D, self.texture_id)

        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT)
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT)
        if self.resize_nearest:
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST)
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST)
        else:
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR)
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR)

        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, data)
        glGenerateMipmap(GL_TEXTURE_2D)

    def resize(self, int width, int height):
        self.width = width
        self.height = height

    @property
    def size(self):
        return (self.width, self.height)


cdef class RenderTexture(Texture):

    def __init__(self, Window window, size, bint resize_nearest=False, bint high_dpi=True):
        self.resize_nearest = resize_nearest
        self.width = size[0]
        self.height = size[1]

        # if high_dpi is True, use the window's size to framebuffer_size scale
        if high_dpi:
            self.framebuffer_width = self.width * window.framebuffer_width // window.width
            self.framebuffer_height = self.height * window.framebuffer_height // window.height
        else:
            self.framebuffer_width = self.width
            self.framebuffer_height = self.height

        self._generate_texture(NULL, self.framebuffer_width, self.framebuffer_height)

        # setup framebuffer
        glGenFramebuffers(1, &self.fbo)
        glBindFramebuffer(GL_FRAMEBUFFER, self.fbo)

        # attach texture to framebuffer
        glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, self.texture_id, 0)

        glBindFramebuffer(GL_FRAMEBUFFER, 0)

    def __del__(self):
        super().__del__()
        glDeleteFramebuffers(1, &self.fbo)
