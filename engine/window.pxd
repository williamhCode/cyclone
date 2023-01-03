from engine.libs.glad cimport *
from engine.libs.glfw cimport *

from engine.render cimport Renderer


cdef class Window:
    cdef:
        GLFWwindow* window
        object key_events

        int width
        int height

        int framebuffer_width
        int framebuffer_height

        str title
