from cyclone.window import *
from cyclone.constants import *
from cyclone.render import Renderer
from cyclone.timer import Timer
from cyclone.texture import Texture
from cyclone.font import SysFont

import random
import math
from dataclasses import dataclass


@dataclass(slots=True)
class Obj:
    x: float
    y: float
    x_vel: float
    y_vel: float


def main():
    WIN_SIZE = (1200, 800)
    high_dpi = False
    window = Window(WIN_SIZE, vsync=False, high_dpi=high_dpi)
    renderer = Renderer()
    font = SysFont("Arial", 30)
    if not high_dpi:
        python_tex = Texture.load("imgs/python_logo.png")
    else:
        python_tex = Texture.load("imgs/python_logo_big.png")
        python_tex.width /= 2
        python_tex.height /= 2
    # python_tex.width /= 2
    # python_tex.height /= 2

    SPEED = 100
    obj_list: list[Obj] = []
    objs = 0

    clock = Timer()
    while not window.should_close():
        dt = clock.tick(60)
        fps = clock.get_fps()
        curr_fps = 1 / dt

        # key events
        for callback in window.get_callbacks():
            match callback:
                case KeyCallback(key, scancode, action, mods):
                    if action == Action.PRESS:
                        if key == Key.ESCAPE:
                            window.close()
                        elif key == Key.EQUAL:
                            python_tex.width *= 2
                            python_tex.height *= 2
                        elif key == Key.MINUS:
                            python_tex.width /= 2
                            python_tex.height /= 2

        num = int(10000 * dt)
        # num = 1
        if window.mouse_button_pressed(MouseButton.LEFT):
            objs += num
            for _ in range(num):
                x, y = window.get_cursor_position()
                x -= python_tex.width / 2
                y -= python_tex.height / 2
                x_vel = random.uniform(-SPEED, SPEED)
                y_vel = random.uniform(-SPEED, SPEED)
                angle = random.uniform(0, 2 * math.pi)
                # angle = random.uniform(0, 2 * math.pi)
                # x_vel = math.cos(angle) * SPEED
                # y_vel = math.sin(angle) * SPEED
                obj_list.append(Obj(x, y, x_vel, y_vel))

        if window.mouse_button_pressed(MouseButton.RIGHT):
            for _ in range(num * 2):
                if len(obj_list) > 0:
                    objs -= 1
                    obj_list.pop()

        # update
        COL_SIZE = (WIN_SIZE[0] - python_tex.width, WIN_SIZE[1] - python_tex.height)
        for obj in obj_list:
            obj.x += obj.x_vel * dt
            obj.y += obj.y_vel * dt

            if obj.x < 0:
                obj.x = 0
                obj.x_vel *= -1
            elif obj.x > COL_SIZE[0]:
                obj.x = COL_SIZE[0]
                obj.x_vel *= -1
            if obj.y < 0:
                obj.y = 0
                obj.y_vel *= -1
            elif obj.y > COL_SIZE[1]:
                obj.y = COL_SIZE[1]
                obj.y_vel *= -1

        # render
        renderer.begin()
        renderer.clear((100, 100, 100))

        for obj in obj_list:
            renderer.draw_texture(python_tex, (obj.x, obj.y))

        color = (255, 0, 0) if curr_fps < 55 else (255, 255, 255)
        renderer.draw_rectangle(color, (10, WIN_SIZE[1] - 65), (450, 50), fade=3)
        renderer.draw_text(font, f"{fps=:.1f}, {objs= }", (20, 750), (0, 0, 0))

        renderer.end()

        # flip
        window.update()

    window.destroy()


if __name__ == "__main__":
    main()
