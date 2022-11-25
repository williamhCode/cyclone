from engine.libs.glad cimport *
from engine.libs.stb_image cimport *

import traceback
import sys

cdef class Texture:

    def __init__(self, filepath, resize_nearest=False):
        # flip texture
        stbi_set_flip_vertically_on_load(1)

        glGenTextures(1, &self.texture_id)
        glBindTexture(GL_TEXTURE_2D, self.texture_id)

        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
        if (resize_nearest):
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
        else:
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

        cdef int n
        cdef unsigned char *data = stbi_load(filepath.encode(), &self.width, &self.height, &n, 0)

        if (data):
            glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, self.width, self.height, 0, GL_RGBA, GL_UNSIGNED_BYTE, data);
            glGenerateMipmap(GL_TEXTURE_2D);
        else:
            try:
                raise RuntimeError(f"Failed to load texture at {filepath}")
            except Exception as e:
                traceback.print_exc()
                sys.exit()

        stbi_image_free(data)

    def resize(self, width, height):
        self.width = width
        self.height = height

    @property
    def size(self):
        return (self.width, self.height)

