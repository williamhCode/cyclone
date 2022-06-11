import pygame
from pygame.locals import *

from OpenGL.GL import *
import timer
import engine

def main():
    # initialize -------------------------------------------------- #
    pygame.init()

    # specify opengl version
    # pygame.display.gl_set_attribute(pygame.GL_CONTEXT_MAJOR_VERSION, 4)
    # pygame.display.gl_set_attribute(pygame.GL_CONTEXT_MINOR_VERSION, 1)
    # pygame.display.gl_set_attribute(
    #     pygame.GL_CONTEXT_PROFILE_MASK, pygame.GL_CONTEXT_PROFILE_CORE
    # )

    # create window
    WIN_SIZE = (1200, 800)
    # pygame.display.set_mode((WIN_SIZE), DOUBLEBUF | OPENGL)
    screen = pygame.display.set_mode((WIN_SIZE))
    pygame.mouse.set_pos(WIN_SIZE[0]/2, WIN_SIZE[1]/2)

    # engine.render.init()

    # engine.render.on_resize(*WIN_SIZE)
    
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

        # glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)

        # engine.render.begin()
        # engine.render.draw_circle((255, 0, 0, 255), (500, 300), 50)

        # engine.render.end()

        screen.fill((0, 0, 0))
        # pygame.draw.circle(screen, (255, 0, 0), (300, 500), 100, 90)
        pygame.draw.polygon(screen, (0, 0, 255), ((300, 500), (300, 550), (350, 550), (350, 500)), width=0)
        # pygame.draw.polygon(screen, (255, 0, 0), ((300, 500), (300, 550), (350, 550), (370, 520)), width=1)
        pygame.draw.rect(screen, (255, 0, 0), ((300, 500), (50, 50)), width=10)

        # flip screen
        pygame.display.flip()
        
main()
pygame.quit()
quit()
