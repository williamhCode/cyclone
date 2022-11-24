from engine.libs.glad cimport *

cdef struct Shader:
    GLuint ID, vs_ID, fs_ID

cdef Shader create(char* vertexPath, char* fragmentPath)

cdef void destroy(Shader self)

cdef void use(Shader self)

cdef void set_int_array(Shader self, char *name, GLsizei count, const GLint *values)
