cdef void convert_mat4(py_mat, mat4 mat):
    cdef size_t i, j
    for i in range(4):
        for j in range(4):
            mat[i][j] = py_mat[i][j]
