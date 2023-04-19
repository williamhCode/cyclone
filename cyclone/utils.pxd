from libc.stdlib cimport malloc, free
from libc.stdio cimport printf

from cyclone.lib.cglm cimport *

cdef void convert_mat4(py_mat, mat4 mat)

cdef size_t[3] *triangulate_polygon(
    const vec2 *points, size_t length, size_t *num_indices
)
