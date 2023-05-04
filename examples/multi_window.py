import cyclone
from cyclone.window.input import *
from cyclone.window import Window
from cyclone.timer import Timer
from cyclone.render import Renderer


def main():
    window_1 = Window((800, 600), "Window 1")
    renderer_1 = Renderer()

    window_2 = Window((800, 600), "Window 2")
    renderer_2 = Renderer()

    windows = [window_1, window_2]

    clock = Timer()

    while not (window_1.should_close() and window_2.should_close()):
        clock.tick(60)
        framerate = clock.get_fps()

        for window in windows.copy():
            if window.should_close():
                window.destroy()
                windows.remove(window)

        if not window_1.should_close():
            window_1.set_title(f"Running at {framerate :.2f} fps.")

            for callback, data in window_1.get_callbacks():
                if callback == KEY_CALLBACK:
                    if data.action == PRESS:
                        if data.key == KEY_ESCAPE:
                            window_1.close()

                        if data.key == KEY_1:
                            print("Window 1!!")

            renderer_1.begin()
            renderer_1.clear((100, 100, 100, 255))
            renderer_1.draw_rectangle((0, 255, 0, 255), (0, 0), (100, 100))
            renderer_1.end()

            window_1.update()

        if not window_2.should_close():
            window_2.set_title(f"Running at {framerate :.2f} fps.")

            for callback, data in window_2.get_callbacks():
                if callback == KEY_CALLBACK:
                    if data.key == KEY_ESCAPE:
                        window_2.close()

                    if data.action == PRESS:
                        if data.key == KEY_2:
                            print("Window 2!!")

            renderer_2.begin()
            renderer_2.clear((100, 100, 100, 255))
            renderer_2.draw_rectangle((255, 0, 0, 255), (0, 0), (100, 100))
            renderer_2.end()

            window_2.update()


if __name__ == "__main__":
    main()
