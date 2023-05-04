from cyclone.window.input import (
    KEY_CALLBACK, MOUSE_BUTTON_CALLBACK, CURSOR_POSITION_CALLBACK, WINDOW_CLOSE_CALLBACK
)


cdef void window_size_callback(GLFWwindow* _window, int width, int height) noexcept:
    cdef Window window
    for window in windows:
        if window.window == _window:
            window.width = width
            window.height = height


cdef void framebuffer_size_callback(
    GLFWwindow* _window, int width, int height
) noexcept:
    cdef Window window
    for window in windows:
        if window.window == _window:
            window.framebuffer_width = width
            window.framebuffer_height = height


cdef void key_callback(
    GLFWwindow* _window, int key, int scancode, int action, int mods
) noexcept:
    cdef Window window
    for window in windows:
        if window.window == _window:
            window.callbacks.append(
                (KEY_CALLBACK, KeyData(key, scancode, action, mods))
            )


cdef void mouse_button_callback(
    GLFWwindow* _window, int button, int action, int mods
) noexcept:
    cdef Window window
    for window in windows:
        if window.window == _window:
            window.callbacks.append(
                (MOUSE_BUTTON_CALLBACK, MouseButtonData(button, action, mods))
            )


cdef void cursor_position_callback(
    GLFWwindow* _window, double xpos, double ypos
) noexcept:
    cdef Window window
    for window in windows:
        if window.window == _window:
            window.callbacks.append(
                (
                    CURSOR_POSITION_CALLBACK,
                    CursorPositionData(xpos, window.height - ypos)
                )
            )


cdef void window_close_callback(GLFWwindow* _window) noexcept:
    cdef Window window
    for window in windows:
        if window.window == _window:
            window.callbacks.append((WINDOW_CLOSE_CALLBACK, None))


cdef list windows = []


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
        cyclone.current_window = self

    cdef void make_context_current(self):
        glfwMakeContextCurrent(self.window)

    def set_current(self):
        cyclone.current_window = self

    def should_close(self):
        if self.window == NULL:
            return True
        return glfwWindowShouldClose(self.window)

    def close(self):
        glfwSetWindowShouldClose(self.window, True)

    def get_size(self):
        return (self.width, self.height)

    def get_framebuffer_size(self):
        return (self.framebuffer_width, self.framebuffer_height)

    def set_title(self, str title):
        self.title = title
        glfwSetWindowTitle(self.window, title.encode())

    def get_title(self):
        return self.title

    def get_callbacks(self):
        glfwPollEvents()
        try:
            return self.callbacks
        finally:
            self.callbacks = []

    # Input ----------------------------------------------------------
    # Keys
    def get_key(self, key):
        return glfwGetKey(self.window, key)

    def key_pressed(self, key):
        return glfwGetKey(self.window, key) == GLFW_PRESS

    def key_released(self, key):
        return glfwGetKey(self.window, key) == GLFW_RELEASE

    # Mouse
    def get_mouse_button(self, button):
        return glfwGetMouseButton(self.window, button)

    def mouse_button_pressed(self, button):
        return glfwGetMouseButton(self.window, button) == GLFW_PRESS

    def mouse_button_released(self, button):
        return glfwGetMouseButton(self.window, button) == GLFW_RELEASE

    def get_cursor_position(self):
        cdef double x, y
        glfwGetCursorPos(self.window, &x, &y)
        y = self.height - y
        return (x, y)

    def set_cursor_position(self, double x, double y):
        y = self.height - y
        glfwSetCursorPos(self.window, x, y)

    # ----------------------------------------------------------------
    def update(self):
        glfwSwapBuffers(self.window)

    def destroy(self):
        if self.window == NULL:
            raise RuntimeError(f"Window '{self.title}' already destroyed")

        glfwDestroyWindow(self.window)
        self.window = NULL

        windows.remove(self)
        if len(windows) == 0:
            glfwTerminate()
