from libcpp.string cimport string as cppstring
from engine.libs.glad cimport *

cdef class Shader:
    cdef unsigned int ID;

    cdef void checkCompileErrors(self, GLuint shader, cppstring compile_type)

