from engine.libs.glad cimport *

cdef struct Shader:
    GLuint ID, vs_ID, fs_ID

cdef Shader shader_create(char* vertexPath, char* fragmentPath)

cdef void shader_destroy(Shader self)

cdef void shader_use(Shader self)


