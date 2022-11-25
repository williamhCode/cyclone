import engine
from engine.window import Window
from engine.render import Renderer
from engine.timer import Timer
from engine import constants

def main():
    WIN_SIZE = (800, 600)
    window = Window(WIN_SIZE)

    renderer = Renderer()
    renderer.set_clear_color((50, 50, 50, 255))
    renderer.set_size(*WIN_SIZE)

    clock = Timer()

    while not window.should_close():
        dt = clock.tick()

        framerate = clock.get_fps()
        window.set_title(f"Running at {framerate :.2f} fps.")

        if window.get_key(constants.KEY_ESCAPE) == constants.PRESS:
            window.set_should_close(True)

        renderer.begin()
        renderer.clear()

        for i in range(200):
            for j in range(300):
                renderer.draw_rectangle((200, 0, 0, 255), (i * 10, j * 10), (8, 8), 10)
        # renderer.draw_rectangle((200, 0, 0, 255), (10, 10), (8, 8), 10)

        renderer.end()

        window.update()

    window.quit()
        
if __name__ == '__main__':
    main()
