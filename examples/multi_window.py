import cyclone
from cyclone import constants
from cyclone.window import Window


def main():
    window_1 = Window((800, 600), "Window 1")
    window_2 = Window((800, 600), "Window 2")

    renderer_1 = window_1.create_renderer()
    renderer_2 = window_2.create_renderer()

    while not (window_1.is_closed() and window_2.is_closed()):
        if not window_1.is_closed():
            for callback, data in window_1.get_callbacks():
                if callback == constants.WINDOW_CLOSE_CALLBACK:
                    print("Window 1 closed!")
                    window_1.close()

                if callback == constants.KEY_CALLBACK:
                    if data.action == constants.PRESS:
                        if data.key == constants.KEY_1:
                            print("Window 1!!")

            renderer_1.begin()
            renderer_1.clear((255, 0, 0, 255))
            renderer_1.end()

            window_1.update()

        if not window_2.is_closed():
            for callback, data in window_2.get_callbacks():
                if callback == constants.WINDOW_CLOSE_CALLBACK:
                    print("Window 2 closed!")
                    window_2.close()

                if callback == constants.KEY_CALLBACK:
                    if data.action == constants.PRESS:
                        if data.key == constants.KEY_2:
                            print("Window 2!!")

            renderer_2.begin()
            renderer_2.clear((0, 255, 0, 255))
            renderer_2.end()

            window_2.update()


if __name__ == "__main__":
    main()
