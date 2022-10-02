from PIL import Image
import OpenGL.GL as gl
import numpy as np
import pygame

from dataclasses import dataclass


@dataclass(slots=True)
class Texture:
    id: np.uint
    width: int
    height: int

    def resize(self, width: int, height: int):
        self.width = width
        self.height = height

    @property
    def size(self):
        return (self.width, self.height)

    @classmethod
    def from_pygame_surface(cls, surface: pygame.Surface):
        texture_id = gl.glGenTextures(1)
        gl.glBindTexture(gl.GL_TEXTURE_2D, texture_id)

        gl.glTexParameteri(gl.GL_TEXTURE_2D, gl.GL_TEXTURE_WRAP_S, gl.GL_REPEAT)
        gl.glTexParameteri(gl.GL_TEXTURE_2D, gl.GL_TEXTURE_WRAP_T, gl.GL_REPEAT)
        gl.glTexParameteri(gl.GL_TEXTURE_2D, gl.GL_TEXTURE_MIN_FILTER, gl.GL_NEAREST)
        gl.glTexParameteri(gl.GL_TEXTURE_2D, gl.GL_TEXTURE_MAG_FILTER, gl.GL_NEAREST)

        img_data = pygame.image.tostring(surface, "RGBA", True)

        gl.glTexImage2D(gl.GL_TEXTURE_2D, 0, gl.GL_RGBA, surface.get_width(),
            surface.get_height(), 0, gl.GL_RGBA, gl.GL_UNSIGNED_BYTE, img_data)
        gl.glGenerateMipmap(gl.GL_TEXTURE_2D);

        return cls(texture_id, surface.get_width(), surface.get_height())

    @classmethod
    def from_path(cls, filepath: str):
        texture_id = gl.glGenTextures(1)
        gl.glBindTexture(gl.GL_TEXTURE_2D, texture_id)

        gl.glTexParameteri(gl.GL_TEXTURE_2D, gl.GL_TEXTURE_MIN_FILTER, gl.GL_NEAREST)
        gl.glTexParameteri(gl.GL_TEXTURE_2D, gl.GL_TEXTURE_MAG_FILTER, gl.GL_NEAREST)
        # gl.glTexParameteri(gl.GL_TEXTURE_2D, gl.GL_TEXTURE_WRAP_S, gl.GL_CLAMP_TO_BORDER)
        # gl.glTexParameteri(gl.GL_TEXTURE_2D, gl.GL_TEXTURE_WRAP_T, gl.GL_CLAMP_TO_BORDER)

        image = Image.open(filepath)
        image = image.transpose(Image.Transpose.FLIP_TOP_BOTTOM)
        img_data = image.convert("RGBA").tobytes()

        gl.glTexImage2D(gl.GL_TEXTURE_2D, 0, gl.GL_RGBA, image.width,
            image.height, 0, gl.GL_RGBA, gl.GL_UNSIGNED_BYTE, img_data)
        gl.glGenerateMipmap(gl.GL_TEXTURE_2D);

        return cls(texture_id, image.width, image.height)

