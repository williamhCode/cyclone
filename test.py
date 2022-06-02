import pyglet

def callback(dt):
    print(f"{1/dt:.3f} FPS")

pyglet.clock.schedule_interval(callback, 1/1000)
# pyglet.clock.schedule(callable)
pyglet.app.run()