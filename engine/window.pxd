from engine.lib.glad cimport *
from engine.lib.glfw cimport *

from engine.render cimport Renderer


cdef class Window:
    cdef:
        GLFWwindow* window
        bint high_dpi
        object callbacks
        str title

        int width
        int height

        int framebuffer_width
        int framebuffer_height
