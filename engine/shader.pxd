from engine.libs.glad cimport *
from engine.libs.cglm cimport *

cdef struct Shader:
    GLuint ID, vs_ID, fs_ID

cdef Shader shader_create(char* vertexPath, char* fragmentPath)

cdef void shader_destroy(Shader self)

cdef void shader_use(Shader self)

cdef void shader_set_int_array(Shader self, const char *name, GLsizei count, const GLint *values)

cdef void shader_set_mat4(Shader self, const char *name, mat4 mat)

