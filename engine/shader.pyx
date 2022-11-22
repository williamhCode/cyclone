from libc.stdio cimport *
from libc.stdlib cimport malloc, free
from libcpp.string cimport string as cppstring
from engine.libs.glad cimport *

import errno
import os

cdef char *read_file(char *filename):
    cdef FILE *file = fopen(filename, "r")
  
    if (file == NULL):
        raise FileNotFoundError(errno.ENOENT, os.strerror(errno.ENOENT), filename)
  
    fseek(file, 0, SEEK_END) 
    cdef int length = ftell(file)
    fseek(file, 0, SEEK_SET)

    cdef char *out = <char *>malloc(sizeof(char) * (length + 1))
    cdef char c
    cdef int i = 0
    while (True):
        c = fgetc(file)
        if (c == EOF):
            break
        out[i] = c
        i += 1
    out[i] = b'\0'

    fclose(file)

    return out


cdef class Shader:

    def __cinit__(self, char* vertexPath, char* fragmentPath):
        cdef char* vShaderCode = read_file(vertexPath)
        cdef char* fShaderCode = read_file(fragmentPath)

        cdef unsigned int vertex, fragment

        vertex = glCreateShader(GL_VERTEX_SHADER)
        glShaderSource(vertex, 1, &vShaderCode, NULL)
        glCompileShader(vertex)
        self.checkCompileErrors(vertex, b"VERTEX")

        fragment = glCreateShader(GL_FRAGMENT_SHADER)
        glShaderSource(fragment, 1, &fShaderCode, NULL)
        glCompileShader(fragment)
        self.checkCompileErrors(fragment, b"FRAGMENT")

        self.ID = glCreateProgram()
        glAttachShader(self.ID, vertex)
        glAttachShader(self.ID, fragment)
        glLinkProgram(self.ID)
        self.checkCompileErrors(self.ID, b"PROGRAM")

        free(vShaderCode)
        free(fShaderCode)

    cdef void checkCompileErrors(self, GLuint shader, cppstring compile_type):
        cdef GLint success
        cdef GLchar infoLog[1024]
        if (compile_type != b"PROGRAM"):
            glGetShaderiv(shader, GL_COMPILE_STATUS, &success)
            if (not success):
                glGetShaderInfoLog(shader, 1024, NULL, infoLog)
                print("ERROR::SHADER_COMPILATION_ERROR of compile_type: ", compile_type.decode())
                print(infoLog.decode())
                print("-- --------------------------------------------------- -- ")
        else:
            glGetProgramiv(shader, GL_LINK_STATUS, &success)
            if (not success):
                glGetProgramInfoLog(shader, 1024, NULL, infoLog)
                print("ERROR::PROGRAM_LINKING_ERROR of compile_type: ", compile_type.decode())
                print(infoLog.decode())
                print("-- --------------------------------------------------- -- ")

