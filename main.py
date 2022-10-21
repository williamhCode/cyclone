import engine
from engine.window import Window
from engine import constants

def main():
    size = (800, 600)
    window = Window(size)

    while True:
        if window.get_key(constants.KEY_ESCAPE) == constants.PRESS:
            break

        window.update()

    window.quit()
        
if __name__ == '__main__':
    main()
