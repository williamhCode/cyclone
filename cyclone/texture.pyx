cdef class Texture:

    def __init__(
        self, size, bytes data=None, bint resize_nearest=False
    ):
        cdef unsigned char *t_data
        if data is None:
            t_data = NULL
        else:
            t_data = data

        self._init([size[0], size[1]], t_data, resize_nearest)

    @classmethod
    def load(cls, str filepath, bint resize_nearest=False):
        stbi_set_flip_vertically_on_load(1)

        cdef int width, height, n
        cdef unsigned char *data = stbi_load(filepath.encode(), &width, &height, &n, 4)

        cdef Texture texture
        if data == NULL:
            texture = None
            raise RuntimeError(f"Failed to load texture at {filepath}")
        else:
            texture = cls.__new__(cls)
            texture._init([width, height], data, resize_nearest)
            stbi_image_free(data)

        return texture

    cdef _init(
        self,
        int[2] size,
        unsigned char *data,
        bint resize_nearest,
        int[2] framebuffer_size=NULL,
    ):
        self.width = size[0]
        self.height = size[1]
        self.orig_width = size[0]
        self.orig_height = size[1]

        if framebuffer_size == NULL:
            framebuffer_size = size

        self.framebuffer_width = framebuffer_size[0]
        self.framebuffer_height = framebuffer_size[1]

        cdef GLint MAX_TEXTURE_SIZE
        glGetIntegerv(GL_MAX_TEXTURE_SIZE, &MAX_TEXTURE_SIZE)

        if (
            self.framebuffer_width > MAX_TEXTURE_SIZE
            or self.framebuffer_height > MAX_TEXTURE_SIZE
        ):
            raise RuntimeError("Texture size too large.")

        # generate texture
        glGenTextures(1, &self.texture_id)
        glBindTexture(GL_TEXTURE_2D, self.texture_id)

        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT)
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT)
        if resize_nearest:
            glTexParameteri(
                GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_NEAREST
            )
            # glTexParameteri(
            #     GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST
            # )
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST)
        else:
            glTexParameteri(
                GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR
            )
            # glTexParameteri(
            #     GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR
            # )
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR)

        glTexImage2D(
            GL_TEXTURE_2D,
            0,
            GL_RGBA,
            self.framebuffer_width,
            self.framebuffer_height,
            0,
            GL_RGBA,
            GL_UNSIGNED_BYTE,
            data
        )
        glGenerateMipmap(GL_TEXTURE_2D)

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
        size,
        bint resize_nearest=False,
        bint high_dpi=True
    ):
        cdef int[2] t_size = [size[0], size[1]]
        cdef int[2] framebuffer_size
        cdef Window window = cyclone.current_window
        if high_dpi:
            framebuffer_size = [
                t_size[0] * window.framebuffer_width // window.width,
                t_size[1] * window.framebuffer_height // window.height
            ]
        else:
            framebuffer_size = t_size

        self._init(
            t_size,
            NULL,
            resize_nearest,
            framebuffer_size
        )

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
