from engine.libs.glad cimport *
from engine.libs.glfw cimport *

from engine.render cimport Renderer
from engine.event import Event


cdef void window_size_callback(GLFWwindow* window, int width, int height):
    cdef Window curr_window
    for curr_window in windows:
        if curr_window.window == window:
            curr_window.width = width
            curr_window.height = height


cdef void framebuffer_size_callback(GLFWwindow* window, int width, int height):
    cdef Window curr_window
    for curr_window in windows:
        if curr_window.window == window:
            curr_window.framebuffer_width = width
            curr_window.framebuffer_height = height


cdef void key_callback(GLFWwindow* window, int key, int scancode, int action, int mods):
    cdef Window curr_window
    for curr_window in windows:
        if curr_window.window == window:
            curr_window.key_events.append(Event(key, None, action))


cdef void mouse_button_callback(GLFWwindow* window, int button, int action, int mods):
    cdef Window curr_window
    for curr_window in windows:
        if curr_window.window == window:
            curr_window.key_events.append(Event(None, button, action))


windows = []

cdef class Window:

    def __init__(self, size, window_name="'Engine Name' Window", vsync=False, high_dpi=True):
        window_name = window_name.encode()

        glfwInit()
        glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 4)
        glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 1)
        glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE)
        glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE)

        if high_dpi == False:
            glfwWindowHint(GLFW_COCOA_RETINA_FRAMEBUFFER, GL_FALSE)

        # window creation
        self.window = glfwCreateWindow(size[0], size[1], window_name, NULL, NULL)
        self.width = size[0]
        self.height = size[1]
        glfwGetFramebufferSize(self.window, &self.framebuffer_width, &self.framebuffer_height);

        if (self.window == NULL):
            print("Failed to create GLFW window")
            glfwTerminate()
            return
        glfwMakeContextCurrent(self.window)

        if (not gladLoadGLLoader(<GLADloadproc>glfwGetProcAddress)):
            print("Failed to initialize GLAD")
            return

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

        # initalize other variables
        self.renderer = Renderer(self)

        self.key_events = []

    def get_size(self):
        return (self.width, self.height)

    def get_renderer(self):
        return self.renderer

    def set_title(self, str title):
        self.title = title
        glfwSetWindowTitle(self.window, title.encode());

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

