from libc.stdio cimport *
from libc.string cimport strcmp, strcpy
from libc.stdlib cimport malloc, free

from cyclone.lib.glad cimport *
from cyclone.lib.cglm cimport *


cdef struct s_Shader:
    GLuint ID, vs_ID, fs_ID

cdef void shader_create(
    s_Shader *self, char *vs_path, char *fs_path
)

cdef void shader_destroy(s_Shader *self)

cdef void shader_use(s_Shader *self)

cdef void shader_set_int_array(
    s_Shader *self, char *name, GLsizei count, GLint *values
)

cdef void shader_set_mat4(s_Shader *self, char *name, mat4 mat)
