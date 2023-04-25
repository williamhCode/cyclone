from importlib.resources import files


cdef char *_read_file(char *filename):
    data = files("cyclone").joinpath(filename.decode()).read_bytes()

    cdef char *out = <char *>malloc(sizeof(char) * (len(data) + 1))
    strcpy(out, data)

    return out


cdef void _checkCompileErrors(
    GLuint shader, char *compile_type, char *path
):
    cdef GLint success
    cdef GLchar infoLog[1024]
    if not strcmp(compile_type, "PROGRAM") == 0:
        glGetShaderiv(shader, GL_COMPILE_STATUS, &success)
        if not success:
            glGetShaderInfoLog(shader, 1024, NULL, infoLog)
            raise RuntimeError(
                f"Error compiling shader at {path.decode()}:\n{infoLog.decode()}"
            )

    else:
        glGetProgramiv(shader, GL_LINK_STATUS, &success)
        if not success:
            glGetProgramInfoLog(shader, 1024, NULL, infoLog)
            raise RuntimeError(
                f"Error linking shader at {path.decode()}:\n{infoLog.decode()}"
            )


cdef void shader_create(
    s_Shader *self, char *vs_path, char *fs_path
):
    cdef char *vs_code = _read_file(vs_path)
    cdef char *fs_code = _read_file(fs_path)

    # vertex shader
    self.vs_ID = glCreateShader(GL_VERTEX_SHADER)
    glShaderSource(self.vs_ID, 1, &vs_code, NULL)
    glCompileShader(self.vs_ID)
    _checkCompileErrors(self.vs_ID, "VERTEX", vs_path)

    # fragment shader
    self.fs_ID = glCreateShader(GL_FRAGMENT_SHADER)
    glShaderSource(self.fs_ID, 1, &fs_code, NULL)
    glCompileShader(self.fs_ID)
    _checkCompileErrors(self.fs_ID, "FRAGMENT", fs_path)

    # shader program
    self.ID = glCreateProgram()
    glAttachShader(self.ID, self.vs_ID)
    glAttachShader(self.ID, self.fs_ID)
    glLinkProgram(self.ID)

    cdef char buf[512]
    snprintf(buf, 512, "[%s, %s]", vs_path, fs_path)
    _checkCompileErrors(self.ID, "PROGRAM", buf)

    free(vs_code)
    free(fs_code)


cdef void shader_destroy(s_Shader *self):
    glDeleteProgram(self.ID)
    glDeleteShader(self.vs_ID)
    glDeleteShader(self.fs_ID)


cdef void shader_use(s_Shader *self):
    glUseProgram(self.ID)


cdef void shader_set_int_array(
    s_Shader *self, char *name, GLsizei count, GLint *value
):
    glUniform1iv(glGetUniformLocation(self.ID, name), count, value)


cdef void shader_set_mat4(s_Shader *self, char *name, mat4 mat):
    glUniformMatrix4fv(glGetUniformLocation(self.ID, name), 1, GL_FALSE, <float *>mat)


# cdef class Shader:

#     def __init__(self, str vs_path, str fs_path):
#         shader_create(&shader, vs_path.encode(), fs_path.encode())

#     def __del__(self):
#         shader_destroy(&shader)

#     def use(self):
#         shader_use(&shader)
