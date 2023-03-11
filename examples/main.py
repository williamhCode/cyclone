from cyclone.window import Window
from cyclone.render import Renderer
from cyclone.timer import Timer
from cyclone.texture import Texture, RenderTexture
from cyclone.shapes import Rectangle
from cyclone import constants
from cyclone import callbacks

import math
import random
import glm
from examples.camera import Camera2D


def spinning_star(renderer: Renderer, time):
    # points = []

    start = (600, 400)
    spin_speed = 2 * math.pi * 0.0001
    edges = 4445

    angle = 0
    angle_diff = 2 * math.pi / edges * int(edges / 2)
    prev_point = None
    for _ in range(edges + 1):
        angle += angle_diff
        x = math.cos((time) * spin_speed + angle) * 300 + start[0]
        y = math.sin((time) * spin_speed + angle) * 300 + start[1]
        # points.append((x, y))
        if prev_point is not None:
            color = (
                random.randint(0, 255),
                random.randint(0, 255),
                random.randint(0, 255),
                255,
            )
            renderer.draw_line(color, prev_point, (x, y), 0.01)
        prev_point = (x, y)

    # points_1 = points[: edges // 3 + 1]
    # points_2 = points[edges // 3 : edges // 3 * 2 + 1]
    # points_3 = points[edges // 3 * 2 :]
    # renderer.draw_lines((255, 0, 0, 255), points_1, 0.01)
    # renderer.draw_lines((0, 255, 0, 255), points_2, 0.01)
    # renderer.draw_lines((0, 0, 255, 255), points_3, 0.01)
    # renderer.draw_lines((255, 255, 255, 255), points, 0.01)


def main():
    WIN_SIZE = (1200, 800)
    window = Window(WIN_SIZE, vsync=False, high_dpi=True)

    renderer = window.create_renderer()

    camera = Camera2D(*WIN_SIZE)

    texture_1 = Texture("imgs/Flappy Bird_1.png", resize_nearest=True)
    texture_1.resize(10, 10)
    texture_2 = Texture("imgs/Flappy Bird_1.png", resize_nearest=True)
    # texture_3 = Texture("imgs/test2.jpeg")
    # texture_4 = Texture("imgs/test3.jpeg")

    test_target = RenderTexture(window, WIN_SIZE)
    # test_target = window.create_texture_target(WIN_SIZE)

    clock = Timer()

    zoom_time = 0
    zoom_factor = 4

    look_pos = glm.vec2(WIN_SIZE) / 2

    time = 0
    while not window.is_closed():
        dt = clock.tick(60)
        time += dt

        framerate = clock.get_fps()
        window.set_title(f"Running at {framerate :.2f} fps.")

        # key events
        for callback, data in window.get_callbacks():
            if callback == constants.WINDOW_CLOSE_CALLBACK:
                window.close()

            if callback == constants.KEY_CALLBACK:
                if data.action == constants.PRESS:
                    if data.key == constants.KEY_ESCAPE:
                        window.close()
                    if data.key == constants.KEY_T:
                        print(time)

            if callback == constants.MOUSE_BUTTON_CALLBACK:
                if data.action == constants.PRESS:
                    if data.button == constants.MOUSE_BUTTON_LEFT:
                        print("left pressed!")

            if callback == constants.CURSOR_POSITION_CALLBACK:
                print(data.xpos, data.ypos)

        # key/button being pressed
        if window.is_key_pressed(constants.KEY_A):
            print("a!")

        if window.is_mouse_button_pressed(constants.MOUSE_BUTTON_RIGHT):
            print("right held!")

        if window.is_key_pressed(constants.KEY_EQUAL):
            zoom_time += dt
            camera.zoom = zoom_factor**zoom_time

        if window.is_key_pressed(constants.KEY_MINUS):
            zoom_time -= dt
            camera.zoom = zoom_factor**zoom_time

        if window.is_key_pressed(constants.KEY_LEFT):
            look_pos -= glm.vec2(5000 / camera.zoom * dt, 0)

        if window.is_key_pressed(constants.KEY_RIGHT):
            look_pos += glm.vec2(5000 / camera.zoom * dt, 0)

        camera.look_at(look_pos)

        # render to texture target
        renderer.begin(view_matrix=camera.get_transform())
        # renderer.begin(view_matrix=camera.get_transform(), texture=test_target)
        renderer.clear((50, 50, 50, 255))

        # texture test
        # dt = math.sin(time * 5) * 20
        # for i in range(300):
        #     for j in range(300):
        #         renderer.draw_texture(texture_1, (i * 10, j * 10))

        # texture region test
        # renderer.draw_texture_region(texture_2, (0, 0), Rectangle(0, 0, 100, 100))
        # renderer.draw_texture_region(texture_2, (100, 0), (0, 0, 100, 100))
        # renderer.draw_texture(texture_2, (100, 0))

        # circle test
        # for i in range(100):
        #     for j in range(100):
        #         renderer.draw_circle((255, 255, 0, 255), (i * 20, j * 20), 10, width=1, fade=0.1)

        # rectangle test
        # for i in range(300):
        #     for j in range(200):
        #         renderer.draw_rectangle((200, 0, 0, 255), (i * 10, j * 10), (8, 8), 10, width=1, fade=1)

        # line test
        spinning_star(renderer, time)

        # layering test
        # renderer.draw_rectangle((200, 100, 100), (100, 100), (200, 200), width=20, fade=10)
        # renderer.draw_texture(texture_2, (150, 150))
        # renderer.draw_circle((100, 200, 100), (300, 300), 100, width=50, fade=10)

        # renderer.draw_rectangle((200, 100, 100), (250, 250), (200, 200), width=50, fade=10)
        # renderer.draw_texture(texture_2, (300, 300))
        # renderer.draw_circle((100, 200, 100), (450, 450), 100, width=50, fade=10)

        renderer.end()

        # render to main screen
        # renderer.begin()
        # renderer.clear()

        # renderer.draw_texture(test_target, (0, 0))

        # renderer.end()

        window.update()


if __name__ == "__main__":
    main()
