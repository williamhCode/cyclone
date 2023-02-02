from engine.lib.glad cimport *
from engine.lib.glfw cimport *

from engine.render cimport Renderer


cdef class Window:
    cdef:
        GLFWwindow* window
        object key_events

        str title

    cdef _get_framebuffer_size(self, int* width, int* height)

    cdef _get_size(self, int* width, int* height)
