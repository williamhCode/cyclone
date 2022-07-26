import pyglet
pyglet.options['shadow_window'] = False
# pyglet.options['debug_gl'] = False
# import numpy as np
from OpenGL.GL import *
import glm

import random
import time
import math

from engine.timer import Timer
import engine

class MainWindow(pyglet.window.Window):
    
    def __init__(self):
        config = pyglet.gl.Config(major_version=4, minor_version=1, forward_compatible=True, double_buffer=True, depth_size=24)
        super().__init__(width=1280, height=720, vsync=False, resizable=True, config=config)

        engine.render.init()
        
        self.test1_tex_id = engine.texture.load_texture('imgs/test.png')
        self.test2_tex_id = engine.texture.load_texture('imgs/test2.jpeg')

        self.timer = Timer()
        
        # self.event_loop()
        pyglet.clock.schedule_interval(self.update, 1.0/60.0)
        
    def on_key_press(self, symbol, modifiers):
        super().on_key_press(symbol, modifiers)

    def on_resize(self, width, height):
        pixel_width, pixel_height = self.get_framebuffer_size()
        glViewport(0, 0, pixel_width, pixel_height)

        engine.render.on_resize(width, height)

    def on_draw(self):
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
        engine.render.begin()

        for i in range(100):
            for j in range(100):
                engine.render.draw_colored_quad((255, 0, 0, 255), (i * 5, j * 5), (4, 4))

        # for i in range(10):
        #     for j in range(10):
        #         engine.render.draw_textured_quad(self.test1_tex_id, (250 + i * 50, 250 + j * 50), (49, 49))

        # for i in range(100):
        #     for j in range(100):
        #         engine.render.draw_circle((255, 255, 0, 255), (i * 10, j * 10), 5, width=1, fade=0.2)

        engine.render.draw_circle((255, 0, 0, 255), (500, 300), 100, width=20, fade=0.1)
        engine.render.draw_circle((0, 255, 255, 240), (600, 300), 50, width=0, fade=0.02)
        # for i in range(10000):
        #     engine.render.draw_rectangle((255, 0, 0, 255), (500, 300), (100, 100), rotation=20)

        engine.render.end()

        # self.flip()
    
    def update(self, dt):
        dt = self.timer.tick()
        self.set_caption(f'{self.timer.get_fps():.2f} FPS')
                
    # def event_loop(self):
        
    #     while not self.has_exit:
    #         self.dispatch_events()
            
    #         dt = self.timer.tick()
    #         self.set_caption(f'{self.timer.get_fps():.2f} FPS')
            
    #         self.dispatch_event('on_draw')
        
if __name__ == '__main__':
    window = MainWindow()
    pyglet.app.run()
