from cyclone.lib.cglm cimport *

cdef void convert_mat4(py_mat, mat4 mat)

cdef void convert_color(py_color, vec4 color)

cdef bint is_convex(vec2 p0, vec2 p1, vec2 p2)
