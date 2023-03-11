from cyclone.constants import (
    KEY_CALLBACK, MOUSE_BUTTON_CALLBACK, CURSOR_POSITION_CALLBACK, WINDOW_CLOSE_CALLBACK
)


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
            curr_window.callbacks.append(
                (KEY_CALLBACK, KeyData(key, scancode, action, mods))
            )


cdef void mouse_button_callback(GLFWwindow* window, int button, int action, int mods):
    cdef Window curr_window
    for curr_window in windows:
        if curr_window.window == window:
            curr_window.callbacks.append(
                (MOUSE_BUTTON_CALLBACK, MouseButtonData(button, action, mods))
            )


cdef void cursor_position_callback(GLFWwindow* window, double xpos, double ypos):
    cdef Window curr_window
    for curr_window in windows:
        if curr_window.window == window:
            curr_window.callbacks.append(
                (CURSOR_POSITION_CALLBACK, CursorPositionData(xpos, ypos))
            )


cdef void window_close_callback(GLFWwindow* window):
    cdef Window curr_window
    for curr_window in windows:
        if curr_window.window == window:
            curr_window.callbacks.append((WINDOW_CLOSE_CALLBACK, None))


windows = []

cdef class Window:

    def __init__(
        self,
        size,
        str title="Cyclone Window",
        bint vsync=False,
        bint high_dpi=True
    ):
        self.title = title
        self.high_dpi = high_dpi

        if not glfwInit():
            raise RuntimeError("Failed to initialize GLFW")

        # window hints
        glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 4)
        glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 1)
        glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE)
        glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE)

        if not high_dpi:
            glfwWindowHint(GLFW_COCOA_RETINA_FRAMEBUFFER, GL_FALSE)

        # window creation
        self.window = glfwCreateWindow(size[0], size[1], title.encode(), NULL, NULL)
        if not self.window:
            raise RuntimeError("Failed to create GLFW window")

        glfwMakeContextCurrent(self.window)
        if not gladLoadGLLoader(<GLADloadproc>glfwGetProcAddress):
            raise RuntimeError("Failed to initialize GLAD")

        # fix bug with high_dpi=False not setting the correct framebuffer size
        glfwPollEvents()

        # set callbacks
        glfwSetWindowSizeCallback(self.window, window_size_callback)
        glfwSetFramebufferSizeCallback(self.window, framebuffer_size_callback)
        glfwSetKeyCallback(self.window, key_callback)
        glfwSetMouseButtonCallback(self.window, mouse_button_callback)
        glfwSetCursorPosCallback(self.window, cursor_position_callback)
        glfwSetWindowCloseCallback(self.window, window_close_callback)

        # get initial window size
        glfwGetWindowSize(self.window, &self.width, &self.height)
        glfwGetFramebufferSize(
            self.window, &self.framebuffer_width, &self.framebuffer_height
        )

        # vsync
        if not vsync:
            glfwSwapInterval(0)

        self.callbacks = []

        # add window to windows list
        windows.append(self)

        self.closed = False

    cdef void make_context_current(self):
        glfwMakeContextCurrent(self.window)

    def get_size(self):
        return (self.width, self.height)

    def get_framebuffer_size(self):
        return (self.framebuffer_width, self.framebuffer_height)

    def create_renderer(self):
        return Renderer(self)

    def create_render_texture(
        self, size, bint resize_nearest=False, bint high_dpi=True
    ):
        return RenderTexture(self, size, resize_nearest, high_dpi)

    def set_title(self, str title):
        self.title = title
        glfwSetWindowTitle(self.window, title.encode())

    def get_title(self):
        return self.title

    def get_callbacks(self):
        glfwPollEvents()
        callback = self.callbacks.copy()
        self.callbacks = []
        return callback

    def update(self):
        glfwSwapBuffers(self.window)

    # Input ----------------------------------------------------------
    # Keys
    def get_key(self, key):
        return glfwGetKey(self.window, key)

    def is_key_pressed(self, key):
        return glfwGetKey(self.window, key) == GLFW_PRESS

    def is_key_released(self, key):
        return glfwGetKey(self.window, key) == GLFW_RELEASE

    # Mouse
    def get_mouse_button(self, button):
        return glfwGetMouseButton(self.window, button)

    def is_mouse_button_pressed(self, button):
        return glfwGetMouseButton(self.window, button) == GLFW_PRESS

    def is_mouse_button_released(self, button):
        return glfwGetMouseButton(self.window, button) == GLFW_RELEASE

    def get_mouse_position(self):
        cdef double x, y
        glfwGetCursorPos(self.window, &x, &y)
        return (x, y)

    def set_mouse_position(self, x, y):
        glfwSetCursorPos(self.window, x, y)

    # ----------------------------------------------------------------
    def is_closed(self):
        return self.closed

    def close(self):
        glfwDestroyWindow(self.window)
        self.closed = True
        windows.remove(self)
        if len(windows) == 0:
            glfwTerminate()
