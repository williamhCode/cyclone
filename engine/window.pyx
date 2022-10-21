from engine.libs.glad cimport *
from engine.libs.glfw cimport *


cdef class Window:
    cdef GLFWwindow* window

    def __init__(self, size, window_name="'Engine Name' Window"):
        window_name = window_name.encode()

        glfwInit()
        glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 4)
        glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 1)
        glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE)
        glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE)

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

    def get_key(self, key):
        return glfwGetKey(self.window, key)

    def update(self):
        glfwSwapBuffers(self.window)
        glfwPollEvents()

    def quit(self):
        glfwTerminate()

cdef void framebuffer_size_callback(GLFWwindow* window, int width, int height):
    glViewport(0, 0, width, height)


