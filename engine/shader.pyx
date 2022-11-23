from libc.stdio cimport *
from libc.string cimport strcmp
from libc.stdlib cimport malloc, free
from engine.libs.glad cimport *

import errno
import os
import sys
import traceback

cdef char *read_file(char *filename):
    cdef FILE *file = fopen(filename, "r")
  
    if (file == NULL):
        try:
            raise FileNotFoundError(errno.ENOENT, os.strerror(errno.ENOENT), filename)
        except Exception as e:
            traceback.print_exc()
            sys.exit()
  
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

cdef void _checkCompileErrors(GLuint shader, char *compile_type, char *path):
    cdef GLint success
    cdef GLchar infoLog[1024]
    if (strcmp(compile_type, "PROGRAM") != 0):
        glGetShaderiv(shader, GL_COMPILE_STATUS, &success)
        if (not success):
            glGetShaderInfoLog(shader, 1024, NULL, infoLog)
            try:
                raise RuntimeError(f"Error compiling shader at {path.decode()}:\n{infoLog.decode()}")
            except Exception as e:
                traceback.print_exc()
                sys.exit()

    else:
        glGetProgramiv(shader, GL_LINK_STATUS, &success)
        if (not success):
            glGetProgramInfoLog(shader, 1024, NULL, infoLog)
            try:
                raise RuntimeError(f"Error linking shader at {path.decode()}:\n{infoLog.decode()}")
            except Exception as e:
                traceback.print_exc()
                sys.exit()

cdef Shader shader_create(char* vs_path, char* fs_path):
    cdef Shader self

    cdef char* vShaderCode = read_file(vs_path)
    cdef char* fShaderCode = read_file(fs_path)

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

    cdef char buf[512];
    snprintf(buf, 512, "[%s, %s]", vs_path, fs_path);
    _checkCompileErrors(self.ID, b"PROGRAM", buf)

    free(vShaderCode)
    free(fShaderCode)

    return self

cdef void shader_destroy(Shader self):
    glDeleteProgram(self.ID);
    glDeleteShader(self.vs_ID);
    glDeleteShader(self.fs_ID);

cdef void shader_use(Shader self):
    glUseProgram(self.ID); 


