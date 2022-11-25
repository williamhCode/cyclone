from engine.window import Window
from engine.render import Renderer
from engine.timer import Timer
from engine.texture import Texture
from engine import constants

def main():
    WIN_SIZE = (1200, 800)
    window = Window(WIN_SIZE)

    renderer = Renderer()
    renderer.set_clear_color((50, 50, 50, 255))
    renderer.set_size(*WIN_SIZE)

    texture_1 = Texture("imgs/Flappy Bird_1.png", True)
    texture_1.resize(10, 10)
    # texture_1 = Texture("imgs/test2.jpeg")

    clock = Timer()

    while not window.should_close():
        dt = clock.tick()

        framerate = clock.get_fps()
        window.set_title(f"Running at {framerate :.2f} fps.")

        if window.get_key(constants.KEY_ESCAPE) == constants.PRESS:
            window.set_should_close(True)

        renderer.begin()
        renderer.clear()

        for j in range(300):
            for i in range(300):
                renderer.draw_texture(texture_1, (i * 10, j * 10))
        # renderer.draw_texture(texture_1, (10, 10))

        # for i in range(300):
        #     for j in range(200):
        #         renderer.draw_rectangle((200, 0, 0, 255), (i * 10, j * 10), (8, 8), 10, width=1, fade=1)

        renderer.end()

        window.update()

    window.quit()
        
if __name__ == '__main__':
    main()
