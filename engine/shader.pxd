from engine.libs.glad cimport *
from engine.libs.cglm cimport *

cdef struct Shader:
    GLuint ID, vs_ID, fs_ID

cdef void shader_create(Shader *self, const char *vs_path, const char *fs_path)

cdef void shader_destroy(const Shader *self)

cdef void shader_use(const Shader *self)

cdef void shader_set_int_array(const Shader *self, const char *name, GLsizei count, const GLint *values)

cdef void shader_set_mat4(const Shader *self, const char *name, const mat4 mat)

