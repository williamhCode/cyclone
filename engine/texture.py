from PIL import Image
from OpenGL.GL import *
import numpy as np
import glm

from dataclasses import dataclass


@dataclass(slots=True)
class Texture:
    id: np.uint
    width: int
    height: int

    def resize(self, width: int, height: int):
        self.width = width
        self.height = height


def load_texture(filepath: str):
    texture_id = glGenTextures(1)
    glBindTexture(GL_TEXTURE_2D, texture_id)

    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR)
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST)
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_BORDER)
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_BORDER)

    image = Image.open(filepath)
    image = image.transpose(Image.TRANSPOSE.FLIP_TOP_BOTTOM)
    img_data = image.convert("RGBA").tobytes()

    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, image.width,
                 image.height, 0, GL_RGBA, GL_UNSIGNED_BYTE, img_data)

    return Texture(texture_id, image.width, image.height)
