import glm
from dataclasses import dataclass


@dataclass(slots=True)
class Rect:
    x: float
    y: float
    width: float
    height: float
    

class Camera2D:

    def __init__(self, width, height):
        self.width = width
        self.height = height
        self.pan = glm.vec2(0)
        self.zoom = 1.0
        self.half_screen_size = glm.vec2(width / 2, height / 2)

    def get_transform(self):
        return (glm.scale(glm.vec3(self.zoom, self.zoom, 1)) *
                glm.translate(glm.vec3(-self.pan, 0)))

    def get_viewport(self):
        return Rect(self.pan.x, self.pan.y, self.width / self.zoom, self.height / self.zoom)

    def look_at(self, pos):
        pos = glm.vec2(pos)
        self.pan = pos - self.half_screen_size / self.zoom

    def world_to_screen(self, pos):
        return (pos - self.pan) * self.zoom

    def screen_to_world(self, pos):
        return pos / self.zoom + self.pan
