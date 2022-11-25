import pyglet
pyglet.options['shadow_window'] = False
# pyglet.options['debug_gl'] = False
# import numpy as np
from OpenGL.GL import *

from engine.timer import Timer
import engine
from engine.render import Renderer

class MainWindow(pyglet.window.Window):
    
    def __init__(self):
        config = pyglet.gl.Config(major_version=4, minor_version=1, forward_compatible=True, double_buffer=True, depth_size=24)
        super().__init__(width=1200, height=800, vsync=False, resizable=True, config=config)

        self.renderer = Renderer()
        self.renderer.set_clear_color((50, 50, 50, 255))

        self.renderer.set_size(1200, 800)
        
        # self.test1_tex_id = engine.texture.Texture.from_path('imgs/test.png')
        # self.test2_tex_id = engine.texture.Texture.from_path('imgs/test2.jpeg')

        self.timer = Timer()
        
        self.event_loop()
        # pyglet.clock.schedule_interval(self.update, 1.0/60.0)
        
    def on_key_press(self, symbol, modifiers):
        super().on_key_press(symbol, modifiers)

    def on_resize(self, width, height):
        pixel_width, pixel_height = self.get_framebuffer_size()
        glViewport(0, 0, pixel_width, pixel_height)

    def on_draw(self):
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)

        self.renderer.begin()
        self.renderer.clear()

        for i in range(200):
            for j in range(200):
                self.renderer.draw_rectangle((200, 0, 0, 255), (i * 10, j * 10), (8, 8), 10, width=1, fade=1)

        self.renderer.end()

        self.flip()
    
    # def update(self, dt):
    #     dt = self.timer.tick()
    #     self.set_caption(f'{self.timer.get_fps():.2f} FPS')
                
    def event_loop(self):
        while not self.has_exit:
            self.dispatch_events()
            
            dt = self.timer.tick()
            self.set_caption(f'{self.timer.get_fps():.2f} FPS')
            
            self.dispatch_event('on_draw')

        
if __name__ == '__main__':
    window = MainWindow()
    pyglet.app.run()
