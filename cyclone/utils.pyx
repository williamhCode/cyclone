cdef void convert_mat4(py_mat, mat4 mat):
    cdef size_t i, j
    for i in range(4):
        for j in range(4):
            mat[i][j] = py_mat[i][j]


cdef void convert_color(py_color, vec4 color):
    if len(py_color) == 3:
        color[:4] = [
            py_color[0] / 255.0, py_color[1] / 255.0, py_color[2] / 255.0, 1.0
        ]
    else:
        color[:4] = [
            py_color[0] / 255.0,
            py_color[1] / 255.0,
            py_color[2] / 255.0,
            py_color[3] / 255.0
        ]


cdef bint is_convex(vec2 p0, vec2 p1, vec2 p2):
    cdef float area_sum = (
        p0[0] * (p1[1] - p2[1]) +
        p1[0] * (p2[1] - p0[1]) +
        p2[0] * (p0[1] - p1[1])
    )
    return True if area_sum > 0 else False
