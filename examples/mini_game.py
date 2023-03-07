import pygame
from pygame.locals import *
from OpenGL.GL import *
import glm
from glm import vec2

import cyclone.timer as timer
import math

from cyclone.render import Renderer

from dataclasses import dataclass


@dataclass(slots=True)
class Rect:
    x: float
    y: float
    w: float
    h: float

    def get_points(self):
        return (self.x, self.y, self.x + self.w, self.y, self.x + self.w, self.y + self.h, self.x, self.y + self.h)

    @property
    def bottom(self):
        return self.y

    @property
    def left(self):
        return self.x

    @property
    def top(self):
        return self.y + self.h

    @property
    def right(self):
        return self.x + self.w

    @property
    def position(self):
        return (self.x, self.y)

    @property
    def size(self):
        return (self.w, self.h)


def collide(rect1: Rect, rect2: Rect) -> tuple[bool, vec2]:
    if (rect1.left < rect2.right and
        rect1.right > rect2.left and
        rect1.top > rect2.bottom and
            rect1.bottom < rect2.top):

        # normals order = left, bottom, right, up
        normals = ((-1, 0),
                   (0, -1),
                   (1, 0),
                   (0, 1))

        vals = (
            -rect2.left + rect1.right,
            -rect2.bottom + rect1.top,
            rect2.right - rect1.left,
            rect2.top - rect1.bottom
        )

        min_p = min(vals)
        mtv = vec2(normals[vals.index(min_p)]) * min_p
        return True, mtv

    return False, vec2(0.0)


class Platform:

    def __init__(self, x, y, w, h, color):
        self.rect = Rect(x, y, w, h)
        self.color = color

    def draw(self, renderer: Renderer ):
        renderer.draw_rectangle(
            self.color, self.rect.position, self.rect.size, fade=1)


def length_squared(vec: vec2):
    return vec.x * vec.x + vec.y * vec.y


def normalize(vec: vec2):
    if vec == vec2(0, 0):
        return vec
    return glm.normalize(vec)


def move_towards(curr: float, target: float, force: float):
    diff = target - curr
    change = math.copysign(force, diff)
    # clamp value based to the difference
    change = diff if abs(diff) < abs(change) else change
    return curr + change


class Player:
    MAX_SPEED = 400
    ACCELERATION = 2000
    FRICTION = 2000
    SIZE = (50, 100)

    def __init__(self, x, y):
        self.pos = vec2(x, y)
        self.vel = vec2(0, 0)

    def input(self, dt, input):
        if input == 0:
            self.vel.x = move_towards(self.vel.x, 0.0, self.FRICTION * dt)
        else:
            self.vel.x = move_towards(
                self.vel.x, input * self.MAX_SPEED, self.ACCELERATION * dt)

    def jump(self):
        self.vel.y = 600

    def update(self, dt):
        self.vel.y -= 1000 * dt
        self.pos += self.vel * dt

    def draw(self, renderer: Renderer):
        renderer.draw_rectangle(
            (255, 0, 0), (self.pos.x, self.pos.y), self.SIZE, fade=4, width=5)


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
    pygame.display.set_mode((WIN_SIZE), DOUBLEBUF | OPENGL, vsync=0)

    renderer = Renderer()
    renderer.set_size(*WIN_SIZE)

    player = Player(100, 500)
    platforms = [
        Platform(0, 0, 1200, 50, (100, 100, 100)),
        Platform(0, 50, 100, 400, (100, 100, 100)),
    ]
    can_jump = False

    # game loop -------------------------------------------------- #
    clock = timer.Timer()

    running = True
    while running:
        # timing -------------------------------------------------- #
        dt = clock.tick(60)

        framerate = clock.get_fps()
        pygame.display.set_caption(f"Running at {framerate :.2f} fps.")

        # check events -------------------------------------------------- #
        jump = False
        
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False

            if event.type == pygame.KEYDOWN:
                if event.key == pygame.K_ESCAPE:
                    running = False

                if event.key == pygame.K_UP:
                    jump = True

        # update -------------------------------------------------- #
        keys = pygame.key.get_pressed()

        input = 0
        if keys[pygame.K_LEFT]:
            input -= 1
        if keys[pygame.K_RIGHT]:
            input += 1

        player.input(dt, input)
        if jump and can_jump:
            player.jump()
        player.update(dt)

        can_jump = False
        player_rect = Rect(player.pos.x, player.pos.y, *player.SIZE)
        for platform in platforms:
            collided, mtv = collide(player_rect, platform.rect)
            if collided:
                player.pos += mtv
                if glm.dot(mtv, vec2(0, 1)) > 0:
                    player.vel.y = 0.0
                    can_jump = True

        # blit -------------------------------------------------- #
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
        renderer.begin()

        for platform in platforms:
            platform.draw(renderer)

        player.draw(renderer)

        renderer.end()
        pygame.display.flip()

if __name__ == "__main__":
    import os
    os.chdir(os.path.abspath(os.path.dirname(__file__)))
    main()
    pygame.quit()

