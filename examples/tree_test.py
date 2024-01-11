from cyclone.window import *
from cyclone.render import Renderer
from cyclone.timer import Timer
from cyclone.texture import Texture, RenderTexture
from cyclone.shapes import Rectangle
from cyclone.font import Font, SysFont
from cyclone.constants import *
from dataclasses import dataclass
from camera import Camera2D
import math
import glm

WIN_SIZE = (1200, 800)
window = Window(WIN_SIZE, vsync=True, high_dpi=True)
renderer = Renderer()
camera = Camera2D(*WIN_SIZE)
camera.zoom = 60
camera.look_at((0, 0))

clock = Timer()

scale = 0

while not window.should_close():
    dt = clock.tick()

    for callback in window.get_callbacks():
        match callback:
            case KeyCallback(key, scancode, action, mods):
                if action == Action.PRESS:
                    if key == Key.ESCAPE:
                        window.close()

    if window.key_pressed(Key.EQUAL):
        scale += 3 * dt
        # print(scale)
    if window.key_pressed(Key.MINUS):
        scale -= 3 * dt
        # print(scale)

    renderer.begin(view_matrix=camera.get_transform())
    renderer.clear((255, 255, 255))

    def cal_final_vec(circleVec):
        dotVec = glm.vec2(0, 0)
        if glm.abs(circleVec.x) > glm.abs(circleVec.y):
            dotVec.x = glm.sign(circleVec.x)
        else:
            dotVec.y = glm.sign(circleVec.y)

        normVec = glm.normalize(circleVec)
        val = 1 - glm.dot(normVec, dotVec)
        return circleVec + circleVec * val * scale

    radius = 3.0
    for angle in range(360):
        theta = math.radians(angle)
        x = math.cos(theta) * radius
        y = math.sin(theta) * radius

        circleVec = glm.vec2(x, y)
        final_vec = cal_final_vec(circleVec)

        renderer.draw_circle((0, 0, 0), final_vec, 0.02)

    int_radius = int(radius)
    for x in range(-int_radius, int_radius + 1):
        for y in range(-int_radius, int_radius + 1):
            xy = glm.vec2(x, y)
            circleVec = glm.normalize(xy) * radius
            final_vec = cal_final_vec(circleVec)
            if glm.length(xy) > glm.length(final_vec) + 0.2:
                continue
            renderer.draw_rectangle((0, 0, 0), xy, (0.98, 0.98), width = 0.01)

    renderer.end()
    window.update()

window.destroy()
