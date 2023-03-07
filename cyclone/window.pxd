from cyclone.lib.glad cimport *
from cyclone.lib.glfw cimport *

from cyclone.render cimport Renderer
from cyclone.texture cimport RenderTexture
from cyclone.callbacks cimport *


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
