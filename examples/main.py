from cyclone.window import Window
from cyclone.render import Renderer
from cyclone.timer import Timer
from cyclone import texture
from cyclone.texture import Texture, RenderTexture
from cyclone.shapes import Rectangle
from cyclone import constants as const
from cyclone import callbacks
from cyclone.font import Font

from pathlib import Path
import math
import random
import glm
import copy
from camera import Camera2D


# colors = []
# for _ in range(4446):
#     colors.append(
#         (
#             random.randint(0, 255),
#             random.randint(0, 255),
#             random.randint(0, 255),
#             255,
#         )
#     )

def spinning_star(renderer: Renderer, time):
    # points = []

    start = (600, 400)
    spin_speed = 2 * math.pi * 0.0001
    edges = 4445

    angle = 0
    angle_diff = 2 * math.pi / edges * int(edges / 2)
    prev_point = None
    for i in range(edges + 1):
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
    renderer = Renderer()

    camera = Camera2D(*WIN_SIZE)

    texture_1 = Texture.load("imgs/Flappy Bird_1.png", resize_nearest=True)
    texture_1.size = 10, 10
    texture_2 = Texture.load("imgs/Flappy Bird_1.png", resize_nearest=True)
    texture_2.size = 50, 40
    # texture_3 = Texture.load("imgs/test2.jpeg")
    # texture_4 = Texture.load("imgs/test3.png")
    texture_5 = Texture.load("imgs/Flappy Bird_1.png", resize_nearest=True)

    render_texture = RenderTexture(WIN_SIZE)

    test_font = Font("/System/Library/Fonts/Supplemental/Arial.ttf", 30)

    rect = Rectangle(0, 0, 100, 100)
    rect.size = (100, 100)

    clock = Timer()

    zoom_time = 0
    zoom_factor = 4

    look_pos = glm.vec2(WIN_SIZE) / 2

    time = 0

    while not window.should_close():
        # dt = clock.tick(60)
        dt = clock.tick()
        time += dt

        framerate = clock.get_fps()
        window.set_title(f"Running at {framerate :.2f} fps.")

        # key events
        for callback, data in window.get_callbacks():
            if callback == const.KEY_CALLBACK:
                if data.action == const.PRESS:
                    if data.key == const.KEY_ESCAPE:
                        window.set_should_close(True)
                    if data.key == const.KEY_T:
                        print(time)

            if callback == const.MOUSE_BUTTON_CALLBACK:
                if data.action == const.PRESS:
                    if data.button == const.MOUSE_BUTTON_LEFT:
                        print("left pressed!")

            # if callback == const.CURSOR_POSITION_CALLBACK:
            # print(data.xpos, data.ypos)

        # key/button being pressed
        if window.key_pressed(const.KEY_A):
            print("a!")

        if window.mouse_button_pressed(const.MOUSE_BUTTON_RIGHT):
            print("right held!")

        if window.key_pressed(const.KEY_EQUAL):
            zoom_time += dt
            camera.zoom = zoom_factor**zoom_time

        if window.key_pressed(const.KEY_MINUS):
            zoom_time -= dt
            camera.zoom = zoom_factor**zoom_time

        if window.key_pressed(const.KEY_UP):
            look_pos += glm.vec2(0, 3000 / camera.zoom * dt)

        if window.key_pressed(const.KEY_DOWN):
            look_pos -= glm.vec2(0, 3000 / camera.zoom * dt)

        if window.key_pressed(const.KEY_LEFT):
            look_pos -= glm.vec2(3000 / camera.zoom * dt, 0)

        if window.key_pressed(const.KEY_RIGHT):
            look_pos += glm.vec2(3000 / camera.zoom * dt, 0)

        camera.look_at(look_pos)

        # render to texture
        # renderer.begin(view_matrix=camera.get_transform())
        renderer.begin(view_matrix=camera.get_transform(), target=render_texture)
        renderer.clear((100, 100, 100))

        # render font
        # for i in range(128):
        #     x = (i % 16) * 32
        #     y = (i // 16) * 32
        #     if (i + (i // 16)) % 2  == 0:
        #         color = (10, 200, 200)
        #     else:
        #         color = (200, 10, 200)
        #     renderer.draw_rectangle(color, (x, y), (32, 32), width=1)

        # renderer.draw_texture(test_font.texture, (0, 0), flip_mode=2)

        renderer.draw_text(test_font, "ABCDEFGHIJKLMNOP", (0, 90), (220, 220, 0))
        renderer.draw_text(test_font, "abcdefghijklmnop", (0, 60), (220, 220, 0))
        renderer.draw_text(
            test_font, "$_#_%_&_*_nice@gmail.com", (0, 30), (220, 220, 0)
        )
        renderer.draw_text(test_font, "$_#_%_&_*_nice@gmail.com", (0, 0), (220, 220, 0))

        # texture test
        # dt = math.sin(time * 5) * 20
        # for i in range(300):
        #     for j in range(300):
        #         renderer.draw_texture(texture_1, (i * 10, j * 10))

        # position = (200, 200)
        # offset = -glm.vec2(texture_5.size) / 2
        # rotation = 10
        # renderer.draw_rectangle((255, 255, 255), position, texture_5.size, rotation, offset)
        # renderer.draw_texture(texture_5, position, rotation, offset)
        # renderer.draw_circle((255, 0, 0), position, 10)

        # texture region test
        # renderer.draw_texture_region(texture_2, (0, 0), (0, 0, 500, 500))
        # renderer.draw_texture_region(
        #     texture_2, (100, 100), Rectangle(100, 100, 300, 300), color=(0, 255, 0, 255)
        # )
        # renderer.draw_texture_region(
        #     texture_2, (200, 200), (200, 200, 100, 100), color=(255, 0, 0, 255)
        # )

        # circle test
        # for i in range(100):
        #     for j in range(100):
        #         renderer.draw_circle((255, 255, 0, 255), (i * 20, j * 20), 10, width=1, fade=0.1)

        # rectangle test
        # for i in range(300):
        #     for j in range(200):
        #         renderer.draw_rectangle((200, 0, 0, 255), (i * 10, j * 10), (8, 8), 10, width=1, fade=1)

        # line test
        # spinning_star(renderer, time)

        # layering test
        # renderer.draw_rectangle((200, 100, 100), (100, 100), (200, 200), width=20, fade=10)
        # renderer.draw_texture(texture_2, (150, 150))
        # renderer.draw_circle((100, 200, 100), (300, 300), 100, width=50, fade=10)

        # renderer.draw_rectangle((200, 100, 100), (250, 250), (200, 200), width=50, fade=10)
        # renderer.draw_texture(texture_2, (300, 300))
        # renderer.draw_circle((100, 200, 100), (450, 450), 100, width=50, fade=10)

        renderer.end()

        # render to main screen
        renderer.begin()
        renderer.clear((50, 50, 50, 255))

        renderer.draw_texture(render_texture, (0, 0))

        renderer.end()

        window.update()

    window.destroy()


if __name__ == "__main__":
    main()
