from engine.lib.glad cimport *
from engine.lib.glfw cimport *

from engine.render cimport Renderer
from engine.surface cimport Surface
from engine.event import Event


cdef void window_size_callback(GLFWwindow* window, int width, int height):
    pass


cdef void framebuffer_size_callback(GLFWwindow* window, int width, int height):
    pass


cdef void key_callback(GLFWwindow* window, int key, int scancode, int action, int mods):
    cdef Window curr_window
    for curr_window in windows:
        if curr_window.window == window:
            curr_window.key_events.append(Event(action, key, None))


cdef void mouse_button_callback(GLFWwindow* window, int button, int action, int mods):
    cdef Window curr_window
    for curr_window in windows:
        if curr_window.window == window:
            curr_window.key_events.append(Event(action, None, button))


windows = []

cdef class Window:

    def __init__(self, size, str title="'Engine Name' Window", bint vsync=False, bint high_dpi=True):
        self.title = title

        if (not glfwInit()):
            raise RuntimeError("Failed to initialize GLFW")

        # window hints
        glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 4)
        glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 1)
        glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE)
        glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE)

        if high_dpi == False:
            glfwWindowHint(GLFW_COCOA_RETINA_FRAMEBUFFER, GL_FALSE)

        # window creation
        self.window = glfwCreateWindow(size[0], size[1], title.encode(), NULL, NULL)
        if (not self.window):
            raise RuntimeError("Failed to create GLFW window")

        glfwMakeContextCurrent(self.window)
        if (not gladLoadGLLoader(<GLADloadproc>glfwGetProcAddress)):
            raise RuntimeError("Failed to initialize GLAD")

        # set callbacks
        glfwSetWindowSizeCallback(self.window, window_size_callback)
        glfwSetFramebufferSizeCallback(self.window, framebuffer_size_callback)
        glfwSetKeyCallback(self.window, key_callback)
        glfwSetMouseButtonCallback(self.window, mouse_button_callback)

        # vsync
        if vsync == False:
            glfwSwapInterval(0)

        # add window to windows list
        windows.append(self)

        self.key_events = []

    cdef _get_framebuffer_size(self, int* width, int* height):
        glfwGetFramebufferSize(self.window, width, height)

    def get_framebuffer_size(self):
        cdef int width, height
        glfwGetFramebufferSize(self.window, &width, &height)
        return (width, height)

    cdef _get_size(self, int* width, int* height):
        glfwGetWindowSize(self.window, width, height)

    def get_size(self):
        cdef int width, height
        glfwGetWindowSize(self.window, &width, &height)
        return (width, height)

    def create_renderer(self):
        return Renderer(self)

    def create_surface(self, size, bint resize_nearest=False, high_dpi=None):
        pass

    def set_title(self, str title):
        self.title = title
        glfwSetWindowTitle(self.window, title.encode())

    def get_title(self):
        return self.title

    def close(self):
        glfwSetWindowShouldClose(self.window, True)

    def should_close(self):
        return glfwWindowShouldClose(self.window)

    def get_events(self):
        try:
            return self.key_events.copy()
        finally:
            self.key_events = []

    def get_key(self, key):
        return glfwGetKey(self.window, key)

    def get_mouse_button(self, button):
        return glfwGetMouseButton(self.window, button)

    def update(self):
        glfwSwapBuffers(self.window)
        glfwPollEvents()

    def quit(self):
        glfwTerminate()

