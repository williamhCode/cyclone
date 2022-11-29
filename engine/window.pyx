from engine.libs.glad cimport *
from engine.libs.glfw cimport *


cdef void framebuffer_size_callback(GLFWwindow* window, int width, int height):
    glViewport(0, 0, width, height)


cdef class Window:
    cdef GLFWwindow* window

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
        if (self.window == NULL):
            print("Failed to create GLFW window")
            glfwTerminate()
            return
        glfwMakeContextCurrent(self.window)

        if (not gladLoadGLLoader(<GLADloadproc>glfwGetProcAddress)):
            print("Failed to initialize GLAD")
            return

        glfwSetFramebufferSizeCallback(self.window, framebuffer_size_callback)

        if vsync == False:
            glfwSwapInterval(0)

    def set_title(self, name):
        glfwSetWindowTitle(self.window, name.encode());

    def set_should_close(self, bint should_close):
        glfwSetWindowShouldClose(self.window, should_close)

    def should_close(self):
        return glfwWindowShouldClose(self.window)

    def get_key(self, key):
        return glfwGetKey(self.window, key)

    def update(self):
        glfwSwapBuffers(self.window)
        glfwPollEvents()

    def quit(self):
        glfwTerminate()

