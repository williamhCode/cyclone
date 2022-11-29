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

    renderer = Renderer()
    renderer.set_clear_color((50, 50, 50, 255))
    renderer.set_size(*WIN_SIZE)

    texture_1 = Texture("imgs/Flappy Bird_1.png", resize_nearest=False)
    texture_1.resize(10, 10)
    texture_2 = Texture("imgs/test2.jpeg")
    texture_3 = Texture("imgs/test3.jpeg")

    clock = Timer()

    time = 0
    while not window.should_close():
        dt = clock.tick()
        time += dt

        framerate = clock.get_fps()
        window.set_title(f"Running at {framerate :.2f} fps.")

        if window.get_key(constants.KEY_ESCAPE) == constants.PRESS:
            window.set_should_close(True)

        renderer.begin()
        renderer.clear()

        # dj = math.sin(time * 5) * 20
        # for i in range(300):
        #     for j in range(200):
        #         renderer.draw_texture(texture_1, (i * 10, j * 10 + dj))

        # renderer.draw_texture(texture_2, (0, 0))
        # renderer.draw_texture(texture_3, (0, 0))

        # for i in range(300):
        #     for j in range(200):
        #         renderer.draw_circle((255, 255, 0, 255), (i * 10, j * 10), 5, width=2, fade=0.5)

        # for i in range(300):
        #     for j in range(200):
        #         renderer.draw_rectangle((200, 0, 0, 255), (i * 10, j * 10), (8, 8), 10, width=1, fade=1)

        spinning_star(renderer, time)

        renderer.end()

        window.update()

    window.quit()
        
if __name__ == '__main__':
    main()
