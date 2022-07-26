import pygame

import OpenGL.GL as gl
import engine.timer as timer
import engine

def main():
    # initialize -------------------------------------------------- #
    pygame.init()

    # specify opengl version
    pygame.display.gl_set_attribute(pygame.GL_CONTEXT_MAJOR_VERSION, 4)
    pygame.display.gl_set_attribute(pygame.GL_CONTEXT_MINOR_VERSION, 1)
    pygame.display.gl_set_attribute(
        pygame.GL_CONTEXT_PROFILE_MASK, pygame.GL_CONTEXT_PROFILE_CORE
    )

    # create window
    WIN_SIZE = (1200, 800)
    pygame.display.set_mode((WIN_SIZE), pygame.DOUBLEBUF | pygame.OPENGL)

    renderer = engine.render.Renderer()
    renderer.set_clear_color((50, 50, 50, 255))
    
    renderer.set_size(*WIN_SIZE)

    # texture_1 = engine.texture.load_texture("imgs/test.png")
    texture_1 = engine.texture.load_texture("imgs/Flappy Bird_1.png")

    # game loop -------------------------------------------------- #
    clock = timer.Timer()

    running = True
    while running:
        # timing -------------------------------------------------- #
        dt = clock.tick()

        framerate = clock.get_fps()
        pygame.display.set_caption(f"Running at {framerate :.2f} fps.")

        # check events -------------------------------------------------- #
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False

            if event.type == pygame.KEYDOWN:
                if event.key == pygame.K_ESCAPE:
                    running = False

        renderer.begin()
        renderer.clear()

        renderer.draw_texture(texture_1, (0, 0))

        # for i in range(100):
        #     for j in range(100):
        #         renderer.draw_circle((255, 255, 0, 255), (i * 10, j * 10), 5, width=1, fade=0.5)

        renderer.draw_circle((255, 0, 0, 255), (500, 300), 100, width=10, fade=10)
        renderer.draw_circle((0, 255, 255, 240), (600, 300), 50, width=0, fade=5)

        renderer.draw_rectangle((255, 0, 0, 255), (500, 100), (100, 200), rotation=0, width=30, fade=10)
        renderer.draw_rectangle((255, 0, 0, 255), (100, 100), (400, 100), rotation=0, width=10, fade=10)

        renderer.end()

        # flip screen
        pygame.display.flip()


if __name__ == "__main__":
    main()
    pygame.quit()
