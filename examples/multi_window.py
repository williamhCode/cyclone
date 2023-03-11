import cyclone
from cyclone import constants
from cyclone.window import Window


def main():
    window_1 = Window((800, 600), "Window 1")
    window_2 = Window((800, 600), "Window 2")

    renderer_1 = window_1.create_renderer()
    renderer_2 = window_2.create_renderer()

    close_window_1 = False
    close_window_2 = False
    while not (close_window_1 and close_window_2):
        if close_window_1:
            window_1.destroy()
        else:
            for callback, data in window_1.get_callbacks():
                if callback == constants.WINDOW_CLOSE_CALLBACK:
                    close_window_1 = True

                if callback == constants.KEY_CALLBACK:
                    if data.action == constants.PRESS:
                        if data.key == constants.KEY_ESCAPE:
                            close_window_1 = True

                        if data.key == constants.KEY_1:
                            print("Window 1!!")

            renderer_1.begin()
            renderer_1.clear((255, 0, 0, 255))
            renderer_1.draw_rectangle((0, 255, 0, 255), (0, 0), (100, 100))
            renderer_1.end()

            window_1.update()

        if close_window_2:
            window_2.destroy()
        else:
            for callback, data in window_2.get_callbacks():
                if callback == constants.WINDOW_CLOSE_CALLBACK:
                    close_window_2 = True

                if callback == constants.KEY_CALLBACK:
                    if data.key == constants.KEY_ESCAPE:
                        close_window_2 = True

                    if data.action == constants.PRESS:
                        if data.key == constants.KEY_2:
                            print("Window 2!!")

            renderer_2.begin()
            renderer_2.clear((0, 255, 0, 255))
            renderer_2.draw_rectangle((255, 0, 0, 255), (0, 0), (100, 100))
            renderer_2.end()

            window_2.update()


if __name__ == "__main__":
    main()
