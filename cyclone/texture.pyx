def load(str filepath, bint resize_nearest=False):
    stbi_set_flip_vertically_on_load(1)

    cdef int width, height, n
    cdef unsigned char *data = stbi_load(filepath.encode(), &width, &height, &n, 4)

    # p_data = list(data[200000 * 4:200010 * 4])
    # print(p_data)

    # py_data = data
    # p_data = list(py_data[200000 * 4:200010 * 4])
    # print(p_data)

    if data == NULL:
        texture = None
        raise RuntimeError(f"Failed to load texture at {filepath}")
    else:
        texture = Texture(width, height, data, resize_nearest, filepath)
        texture.update_data(data)
        stbi_image_free(data)

    return texture


cdef class Texture:

    def __init__(
        self, int width, int height, bytes py_data=None, bint resize_nearest=False
        , str path=None
    ):
        self.width = width
        self.height = height
        self.orig_width = width
        self.orig_height = height

        cdef unsigned char *data
        if py_data is None:
            data = NULL
        else:
            data = py_data

        # p_data = list(data[200000 * 4:200010 * 4])
        # print(p_data)

        # generate texture
        glGenTextures(1, &self.texture_id)
        glBindTexture(GL_TEXTURE_2D, self.texture_id)

        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT)
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT)
        if resize_nearest:
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST)
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST)
        else:
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR)
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR)

        glTexImage2D(
            GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, data
        )
        glGenerateMipmap(GL_TEXTURE_2D)

    cdef update_data(self, unsigned char *data):
        glBindTexture(GL_TEXTURE_2D, self.texture_id)
        glTexSubImage2D(
            GL_TEXTURE_2D, 0, 0, 0, self.width, self.height, GL_RGBA, GL_UNSIGNED_BYTE, data
        )

    def __del__(self):
        glDeleteTextures(1, &self.texture_id)

    def reset_size(self):
        self.width = self.orig_width
        self.height = self.orig_height

    @property
    def size(self):
        return (self.width, self.height)

    @size.setter
    def size(self, size):
        self.width = size[0]
        self.height = size[1]


cdef class RenderTexture(Texture):

    def __init__(
        self,
        Window window not None,
        size,
        bint resize_nearest=False,
        bint high_dpi=True
    ):
        # super().__init__(size[0], size[1], None, resize_nearest)

        # if high_dpi is True, use the window's size to framebuffer_size scale
        if high_dpi:
            self.framebuffer_width = (
                self.width * window.framebuffer_width // window.width
            )
            self.framebuffer_height = (
                self.height * window.framebuffer_height // window.height
            )
        else:
            self.framebuffer_width = self.width
            self.framebuffer_height = self.height

        # setup framebuffer
        glGenFramebuffers(1, &self.fbo)
        glBindFramebuffer(GL_FRAMEBUFFER, self.fbo)

        # attach texture to framebuffer
        glFramebufferTexture2D(
            GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, self.texture_id, 0
        )

        glBindFramebuffer(GL_FRAMEBUFFER, 0)

    def __del__(self):
        super().__del__()
        glDeleteFramebuffers(1, &self.fbo)
