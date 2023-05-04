from libc.stdlib cimport malloc, free
from libc.stdio cimport printf
from libcpp.vector cimport vector
from libcpp.set cimport set

from cyclone.lib.test cimport next, prev, advance, distance
from cyclone.lib.cglm cimport *


cdef size_t[3] *triangulate_linked_list(
    vec2 *points, size_t length, size_t *num_indices_ptr
)

cdef size_t[3] *triangulate(
    vec2 *points, size_t length, size_t *num_indices
)