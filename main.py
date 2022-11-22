import engine
from engine.window import Window
from engine.render import Renderer
from engine import constants

def main():
    size = (800, 600)
    window = Window(size)

    renderer = Renderer()

    while not window.should_close():
        if window.get_key(constants.KEY_ESCAPE) == constants.PRESS:
            window.set_should_close(True)

        window.update()

    window.quit()
        
if __name__ == '__main__':
    main()
