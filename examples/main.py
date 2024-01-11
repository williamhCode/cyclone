from cyclone.window import *
from cyclone.render import Renderer
from cyclone.timer import Timer
from cyclone.texture import Texture, RenderTexture
from cyclone.shapes import Rectangle
from cyclone.font import Font, SysFont
from cyclone.constants import *

import math
import random
import glm
from camera import Camera2D


def spinning_star(renderer: Renderer, time):
    # points = []

    start = (600, 400)
    spin_speed = 2 * math.pi * 0.01
    edges = 1001

    angle = 0
    angle_diff = 2 * math.pi / edges * int(edges / 2)
    prev_point = None
    for i in range(edges + 1):
        angle += angle_diff
        x = math.cos((time) * spin_speed + angle) * 300 + start[0]
        y = math.sin((time) * spin_speed + angle) * 300 + start[1]
        # points.append((x, y))
        if prev_point is not None:
            # color = (
            #     random.randint(0, 255),
            #     random.randint(0, 255),
            #     random.randint(0, 255),
            #     255,
            # )
            color = (255, 0, 0)
            renderer.draw_line(color, prev_point, (x, y), 0.1)
        prev_point = (x, y)


def main():
    WIN_SIZE = (1200, 800)
    window = Window(WIN_SIZE, vsync=False, high_dpi=True)
    renderer = Renderer()

    camera = Camera2D(*WIN_SIZE)

    texture_1 = Texture.load("imgs/Flappy Bird_1.png", resize_nearest=True)
    # texture_1.size = 10, 10
    texture_2 = Texture.load("imgs/Flappy Bird_1.png", resize_nearest=True)
    texture_2.size = 50, 40
    # texture_3 = Texture.load("imgs/test2.jpeg")
    # texture_4 = Texture.load("imgs/test3.png")
    texture_5 = Texture.load("imgs/Flappy Bird_1.png", resize_nearest=True)

    render_texture = RenderTexture(WIN_SIZE)

    test_font = Font("/System/Library/Fonts/Supplemental/Arial.ttf", 30)
    arial_font = SysFont("Arial", 30)
    # sf_mono_font = SysFont("SF Mono", 15.0)
    sf_mono_font = Font("/Library/Fonts/SF-Mono-Regular.otf", 15)
    roboto_mono_font = SysFont("Roboto Mono", 15)

    rect = Rectangle(0, 0, 100, 100)
    rect.size = (100, 100)

    poly_points = (
        (800, 400),
        (700, 500),
        (600, 500),
        (500, 400),
        (500, 300),
        (600, 200),
        (700, 300),
        (800, 200),
    )

    # debug = 0
    # poly_points = []
    # # generate counterclockwise polygon points for circle
    # num = 4
    # for i in range(num):
    #     # if i == num - 1:
    #     #     break
    #     angle = 2 * math.pi * i / num
    #     x = math.cos(angle) * 200 + 600
    #     y = math.sin(angle) * 200 + 400
    #     poly_points.append((x, y))
    # poly_points.append((800, 100))
    # print(poly_points)

    # game loop -------------------------------------------- #
    clock = Timer()

    zoom_time = 0
    zoom_factor = 4

    look_pos = glm.vec2(WIN_SIZE) / 2

    time = 0

    while not window.should_close():
        # dt = clock.tick(60)
        dt = clock.tick()
        fps = clock.get_fps()
        time += dt

        # window.set_title(f"Running at {framerate :.2f} fps.")

        for callback in window.get_callbacks():
            match callback:
                case KeyCallback(key, scancode, action, mods):
                    if action == Action.PRESS:
                        if key == Key.ESCAPE:
                            window.close()
                        elif key == Key.T:
                            print(time)

                case MouseButtonCallback(button, action, mods):
                    if action == Action.PRESS:
                        if button == MouseButton.LEFT:
                            print("left pressed!")
                    elif action == Action.RELEASE:
                        if button == MouseButton.LEFT:
                            print("left released!")

                # case CursorPositionCallback(xpos, ypos):
                #     print(xpos, ypos)

        # key/button being pressed
        if window.key_pressed(Key.A):
            print("a!")

        if window.mouse_button_pressed(MouseButton.RIGHT):
            print("right held!")

        if window.key_pressed(Key.EQUAL):
            zoom_time += dt
            camera.zoom = zoom_factor**zoom_time

        if window.key_pressed(Key.MINUS):
            zoom_time -= dt
            camera.zoom = zoom_factor**zoom_time

        if window.key_pressed(Key.UP):
            look_pos += glm.vec2(0, 3000 / camera.zoom * dt)
        if window.key_pressed(Key.DOWN):
            look_pos -= glm.vec2(0, 3000 / camera.zoom * dt)
        if window.key_pressed(Key.LEFT):
            look_pos -= glm.vec2(3000 / camera.zoom * dt, 0)
        if window.key_pressed(Key.RIGHT):
            look_pos += glm.vec2(3000 / camera.zoom * dt, 0)

        camera.look_at(look_pos)

        # render to texture
        renderer.begin(view_matrix=camera.get_transform())
        # renderer.begin(view_matrix=camera.get_transform(), target=render_texture)
        renderer.clear((50, 50, 50))

        # polygon test
        # for _ in range(1):
        # renderer.draw_polygon((150, 200, 90), poly_points)
        # renderer.draw_polygon((0, 0, 0), poly_points, width=84)

        # points = (
        #     (100, 100),
        #     (200, 100),
        #     (150, 200),
        #     (100, 100),
        # )
        # cursor_pos = window.get_cursor_position()
        # cursor_pos = camera.screen_to_world(cursor_pos)
        # if triangulation._point_in_triangle(cursor_pos, *points[:3]):
        #     color = (255, 0, 0)
        # else:
        #     color = (0, 0, 0)
        # renderer.draw_lines(color, points, width=0.5)
        # renderer.draw_circle((100, 100, 200), cursor_pos, 1)

        # other_poly_points = tuple((x - 400, y) for x, y in poly_points)
        # renderer.draw_polygon((150, 200, 90), other_poly_points, width=80)

        # for point in inner_points:
        #     renderer.draw_circle((0, 0, 0), point, 3)

        # render font
        # for i in range(128):
        #     x = (i % 16) * 32
        #     y = (i // 16) * 32
        #     if (i + (i // 16)) % 2  == 0:
        #         color = (10, 200, 200)
        #     else:
        #         color = (200, 10, 200)
        #     renderer.draw_rectangle(color, (x, y), (32, 32), width=1)

        # renderer.draw_texture(sf_mono_font.texture, (0, 0), flip_mode=2)

        # renderer.draw_circle((255, 0, 0), (1, 225), 1)

        # renderer.draw_text(font_1, "ABCDEFGHIJKLMNOP", (0, 90), (220, 220, 0))
        # renderer.draw_text(font_1, "abcdefghijklmnop", (0, 60), (220, 220, 0))
        # renderer.draw_text(font_1, "$_#_%_&_*_nice@gmail.com", (0, 30), (220, 220, 0))
        # renderer.draw_text(font_1, "$_#_%_&_*_nice@gmail.com", (0, 0), (220, 220, 0))

        # texture test
        # for i in range(300):
        #     for j in range(300):
        #         renderer.draw_texture(texture_1, (i * 10, j * 10))
        # renderer.draw_texture(texture_1, (100, 100))

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
        spinning_star(renderer, time)

        # layering test
        # renderer.draw_rectangle((200, 100, 100), (100, 100), (200, 200), width=20, fade=10)
        # renderer.draw_texture(texture_2, (150, 150))
        # renderer.draw_circle((100, 200, 100), (300, 300), 100, width=50, fade=10)

        # renderer.draw_rectangle((200, 100, 100), (250, 250), (200, 200), width=50, fade=10)
        # renderer.draw_texture(texture_2, (300, 300))
        # renderer.draw_circle((100, 200, 100), (450, 450), 100, width=50, fade=10)

        renderer.end()

        # fps
        renderer.begin()
        renderer.draw_rectangle(
            (255, 255, 255), (10, WIN_SIZE[1] - 65), (200, 50), fade=3
        )
        # renderer.draw_text(arial_font, f"{fps=:.1f}", (20, 750), (0, 0, 0))
        renderer.draw_text(sf_mono_font, "renderer.draw_texture", (20, 750), (0, 0, 0))
        renderer.end()

        # framebuffer
        # renderer.begin()
        # renderer.clear((50, 50, 50, 255))
        # renderer.draw_texture(render_texture, (0, 0))
        # renderer.end()

        window.update()

    window.destroy()


if __name__ == "__main__":
    main()
