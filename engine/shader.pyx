from libc.stdio cimport *
from libc.string cimport strcmp
from libc.stdlib cimport malloc, free
from engine.lib.glad cimport *
from engine.lib.cglm cimport *

import errno
import os
import sys
import traceback


cdef char *_read_file(const char *filename) except *:
    cdef FILE *file = fopen(filename, "r")

    if file == NULL:
        raise FileNotFoundError(errno.ENOENT, os.strerror(errno.ENOENT), filename)

    fseek(file, 0, SEEK_END)
    cdef int length = ftell(file)
    fseek(file, 0, SEEK_SET)

    cdef char *out = <char *>malloc(sizeof(char) * (length + 1))
    cdef char c
    cdef int i = 0
    while True:
        c = fgetc(file)
        if c == EOF:
            break
        out[i] = c
        i += 1
    out[i] = b'\0'

    fclose(file)

    return out


cdef void _checkCompileErrors(GLuint shader, const char *compile_type, const char *path) except *:
    cdef GLint success
    cdef GLchar infoLog[1024]
    if strcmp(compile_type, "PROGRAM") != 0:
        glGetShaderiv(shader, GL_COMPILE_STATUS, &success)
        if not success:
            glGetShaderInfoLog(shader, 1024, NULL, infoLog)
            raise RuntimeError(f"Error compiling shader at {path.decode()}:\n{infoLog.decode()}")

    else:
        glGetProgramiv(shader, GL_LINK_STATUS, &success)
        if not success:
            glGetProgramInfoLog(shader, 1024, NULL, infoLog)
            raise RuntimeError(f"Error linking shader at {path.decode()}:\n{infoLog.decode()}")


cdef void shader_create(s_Shader *self, const char *vs_path, const char *fs_path) except *:
    cdef char *vShaderCode = _read_file(vs_path)
    cdef char *fShaderCode = _read_file(fs_path)

    # vertex shader
    self.vs_ID = glCreateShader(GL_VERTEX_SHADER)
    glShaderSource(self.vs_ID, 1, &vShaderCode, NULL)
    glCompileShader(self.vs_ID)
    _checkCompileErrors(self.vs_ID, b"VERTEX", vs_path)

    # fragment shader
    self.fs_ID = glCreateShader(GL_FRAGMENT_SHADER)
    glShaderSource(self.fs_ID, 1, &fShaderCode, NULL)
    glCompileShader(self.fs_ID)
    _checkCompileErrors(self.fs_ID, b"FRAGMENT", fs_path)

    # shader program
    self.ID = glCreateProgram()
    glAttachShader(self.ID, self.vs_ID)
    glAttachShader(self.ID, self.fs_ID)
    glLinkProgram(self.ID)

    cdef char buf[512]
    snprintf(buf, 512, "[%s, %s]", vs_path, fs_path)
    _checkCompileErrors(self.ID, b"PROGRAM", buf)

    free(vShaderCode)
    free(fShaderCode)


cdef void shader_destroy(const s_Shader *self):
    glDeleteProgram(self.ID);
    glDeleteShader(self.vs_ID);
    glDeleteShader(self.fs_ID);


cdef void shader_use(const s_Shader *self):
    glUseProgram(self.ID);


cdef void shader_set_int_array(const s_Shader *self, const char *name, GLsizei count, const GLint *value):
    glUniform1iv(glGetUniformLocation(self.ID, name), count, value)


cdef void shader_set_mat4(const s_Shader *self, const char *name, const mat4 mat):
    glUniformMatrix4fv(glGetUniformLocation(self.ID, name), 1, GL_FALSE, <float *>mat)


# cdef class Shader:

#     def __init__(self, str vs_path, str fs_path):
#         shader_create(&shader, vs_path.encode(), fs_path.encode())

#     def __del__(self):
#         shader_destroy(&shader)

#     def use(self):
#         shader_use(&shader)

