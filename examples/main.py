from engine.window import Window
from engine.render import Renderer
from engine.timer import Timer
from engine.texture import Texture
from engine.surface import Surface
from engine import constants

import math
import glm
from examples.camera import Camera2D


def spinning_star(renderer: Renderer, time):
    points = []

    start = (570, 400)
    spin_speed = 2 * math.pi * 0.000
    edges = 4445

    angle = 0
    angle_diff = 2 * math.pi / edges * int(edges / 2)
    for _ in range(edges + 1):
        angle += angle_diff
        x = math.cos((time) * spin_speed + angle) * 300 + start[0]
        y = math.sin((time) * spin_speed + angle) * 300 + start[1]
        points.append((x, y))

    renderer.draw_lines((255, 0, 0, 255), points, 0.01)
    # renderer.draw_lines((255, 0, 0, 255), points, 1)

def main():
    WIN_SIZE = (1200, 800)
    window = Window(WIN_SIZE, vsync=False, high_dpi=False)

    renderer = window.create_renderer()
    renderer.set_clear_color((50, 50, 50, 255))

    camera = Camera2D(*WIN_SIZE)

    texture_1 = Texture("imgs/Flappy Bird_1.png", resize_nearest=True)
    texture_1.resize(10, 10)
    texture_2 = Texture("imgs/test2.jpeg")
    texture_3 = Texture("imgs/test3.jpeg")

    test_surface = Surface(WIN_SIZE)

    clock = Timer()

    zoom_time = 0
    zoom_factor = 4

    time = 0
    while not window.should_close():
        dt = clock.tick()
        time += dt

        framerate = clock.get_fps()
        window.set_title(f"Running at {framerate :.2f} fps.")

        # key events
        for event in window.get_events():
            if event.action == constants.PRESS:
                if event.button == constants.MOUSE_BUTTON_LEFT:
                    print("left pressed!")

                if event.key == constants.KEY_ESCAPE:
                    window.close()

                if event.key == constants.KEY_T:
                    print(time)

        # key/button being pressed
        if window.get_key(constants.KEY_A) == constants.PRESS:
            print("a!")

        if window.get_mouse_button(constants.MOUSE_BUTTON_RIGHT) == constants.PRESS:
            print("right held!")

        if window.get_key(constants.KEY_EQUAL) == constants.PRESS:
            zoom_time += dt
            camera.zoom = zoom_factor ** zoom_time

        if window.get_key(constants.KEY_MINUS) == constants.PRESS:
            zoom_time -= dt
            camera.zoom = zoom_factor ** zoom_time

        camera.look_at(glm.vec2(WIN_SIZE) / 2)

        # render to texture (surface)
        renderer.begin(view_matrix=camera.get_transform())
        # renderer.begin(view_matrix=camera.get_transform(), surface=test_surface)
        renderer.clear()

        # texture test
        # dj = math.sin(time * 5) * 20
        # for i in range(300):
        #     for j in range(300):
        #         renderer.draw_texture(texture_1, (i * 10, j * 10))

        # circle test
        # for i in range(100):
        #     for j in range(100):
        #         renderer.draw_circle((255, 255, 0, 255), (i * 10, j * 10), 40, width=2, fade=0.5)

        # rectangle test
        # for i in range(300):
        #     for j in range(200):
        #         renderer.draw_rectangle((200, 0, 0, 255), (i * 10, j * 10), (8, 8), 10, width=1, fade=1)

        # line test
        spinning_star(renderer, time)

        # layering test
        # renderer.draw_rectangle((200, 100, 100), (100, 100), (200, 200), width=20, fade=10)
        # renderer.draw_texture(texture_1, (150, 150))
        # renderer.draw_circle((100, 200, 100), (300, 300), 100, width=50, fade=10)

        # renderer.draw_rectangle((200, 100, 100), (250, 250), (200, 200), width=50, fade=10)
        # renderer.draw_texture(texture_1, (300, 300))
        # renderer.draw_circle((100, 200, 100), (450, 450), 100, width=50, fade=10)

        renderer.end()

        # render to main screen
        # renderer.begin()
        # renderer.clear()

        # renderer.draw_texture(test_surface, (0, 0))

        # renderer.end()

        window.update()

    window.quit()

if __name__ == '__main__':
    main()
