import pyglet
pyglet.options['shadow_window'] = False
# import numpy as np
from OpenGL.GL import *
import glm

import random
import time
import math

from timer import Timer
import engine

class MainWindow(pyglet.window.Window):
    
    def __init__(self):
        config = pyglet.gl.Config(major_version=4, minor_version=1, forward_compatible=True, double_buffer=True, depth_size=24)
        super().__init__(width=1280, height=720, vsync=False, resizable=True, config=config)

        engine.render.init()
        

        self.test1_tex_id = engine.render.load_texture('imgs/test.png')
        self.test2_tex_id = engine.render.load_texture('imgs/test2.jpeg')

        self.timer = Timer() 
        
        self.event_loop()
        
    def on_key_press(self, symbol, modifiers):
        super().on_key_press(symbol, modifiers)
       
    def on_resize(self, width, height):
        # pixel_width, pixel_height = self.get_framebuffer_size()
        # glViewport(0, 0, pixel_width, pixel_height)

        engine.render.on_resize(width, height)

    def on_draw(self):
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
        engine.render.begin()
        
        # for i in range(100):
        #     for j in range(100):
        #         engine.render.draw_colored_quad((i * 5, j * 5), (4, 4), (255, 0, 0, 255))

        # for i in range(10):
        #     for j in range(10):
        #         engine.render.draw_textured_quad((250 + i * 50, 250 + j * 50), (49, 49), self.test1_tex_id)

        engine.render.draw_circle((255, 0, 0, 255), (500, 300), 100, width=20, fade=0.3)

        engine.render.draw_circle((0, 255, 0, 255), (700, 300), 50, width=0, fade=0.1)

        engine.render.end()

        self.flip()
                
    def event_loop(self):
        self.timer = Timer()
        
        while not self.has_exit:
            self.dispatch_events()
            
            dt = self.timer.tick()
            self.set_caption(f'{self.timer.get_fps():.2f} FPS')
            
            self.dispatch_event('on_draw')
        
if __name__ == '__main__':
    window = MainWindow()