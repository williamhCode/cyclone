from engine.window import Window
from engine.render import Renderer
from engine.timer import Timer
from engine.texture import Texture
from engine import constants

import math


def spinning_star(renderer: Renderer, time):
    points = []
    start = (500, 400)
    speed = 0.05
    for i in range(50000):
        angle_diff = 2 * math.pi * 0.471 * i
        x = math.cos((time) * speed + angle_diff) * 300 + start[0]
        y = math.sin((time) * speed + angle_diff) * 300 + start[1]
        points.append((x, y))

    renderer.draw_lines((255, 0, 0, 255), points, 0.1)

def main():
    WIN_SIZE = (1200, 800)
    window = Window(WIN_SIZE, vsync=False)

    renderer: Renderer = window.get_renderer()
    renderer.set_clear_color((50, 50, 50, 255))

    texture_1 = Texture("imgs/Flappy Bird_1.png", resize_nearest=True)
    # texture_1.resize(10, 10)
    texture_2 = Texture("imgs/test2.jpeg")
    texture_3 = Texture("imgs/test3.jpeg")

    clock = Timer()

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

        renderer.begin()
        renderer.clear()

        # dj = math.sin(time * 5) * 20
        # for i in range(300):
        #     for j in range(300):
        #         renderer.draw_texture(texture_1, (i * 10, j * 10))

        # for i in range(100):
        #         for j in range(100):
        #                 renderer.draw_circle((255, 255, 0, 255), (i * 10, j * 10), 40, width=2, fade=0.5)

        # for i in range(300):
            #     for j in range(200):
                #         renderer.draw_rectangle((200, 0, 0, 255), (i * 10, j * 10), (8, 8), 10, width=1, fade=1)

        # spinning_star(renderer, time)

        renderer.draw_rectangle((200, 100, 100), (100, 100), (200, 200), fade=10)
        renderer.draw_texture(texture_1, (150, 150))
        renderer.draw_circle((100, 200, 100), (300, 300), 100, 50, 10)

        renderer.end()

        window.update()

    window.quit()

if __name__ == '__main__':
    main()
