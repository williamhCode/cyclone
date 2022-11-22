
cdef extern from "glm/glm.hpp" namespace "glm::detail":
    cppclass is_int[T]:
        enum test:
            value = 0
    cppclass is_int:
        enum test:
            value = -1
    cppclass is_int:
        enum test:
            value = -1
    ctypedef int uint64
    ctypedef int int64
    cppclass is_aligned[P]:
        pass
    cppclass storage[L, T, is_aligned]:
        struct type:
            T data[L]
        ctypedef type type
    enum genTypeEnum:
        GENTYPE_VEC = 0
        GENTYPE_MAT = 1
        GENTYPE_QUAT = 2
    cppclass genTypeTrait[genType]:
        pass
    cppclass init_gentype[genType, type]:
        pass
    cppclass compute_equal[T, isFloat]:
        @staticmethod
        bint call(T, T)
    ctypedef int int8
    ctypedef int int16
    ctypedef int int32
    ctypedef int uint8
    ctypedef int uint16
    ctypedef int uint32
    cppclass compute_vec4_add[T, Q, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&, glm_vec[void, T, void]&)
    cppclass compute_vec4_sub[T, Q, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&, glm_vec[void, T, void]&)
    cppclass compute_vec4_mul[T, Q, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&, glm_vec[void, T, void]&)
    cppclass compute_vec4_div[T, Q, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&, glm_vec[void, T, void]&)
    cppclass compute_vec4_mod[T, Q, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&, glm_vec[void, T, void]&)
    cppclass compute_vec4_and[T, Q, IsInt, Size, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&, glm_vec[void, T, void]&)
    cppclass compute_vec4_or[T, Q, IsInt, Size, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&, glm_vec[void, T, void]&)
    cppclass compute_vec4_xor[T, Q, IsInt, Size, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&, glm_vec[void, T, void]&)
    cppclass compute_vec4_shift_left[T, Q, IsInt, Size, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&, glm_vec[void, T, void]&)
    cppclass compute_vec4_shift_right[T, Q, IsInt, Size, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&, glm_vec[void, T, void]&)
    cppclass compute_vec4_equal[T, Q, IsInt, Size, Aligned]:
        @staticmethod
        bint call(glm_vec[void, T, void]&, glm_vec[void, T, void]&)
    cppclass compute_vec4_nequal[T, Q, IsInt, Size, Aligned]:
        @staticmethod
        bint call(glm_vec[void, T, void]&, glm_vec[void, T, void]&)
    cppclass compute_vec4_bitwise_not[T, Q, IsInt, Size, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&)
    cppclass outerProduct_trait[C, R, T, Q]:
        pass
    cppclass functor1[L, R, T, Q]:
        pass
    cppclass functor2[L, T, Q]:
        pass
    cppclass functor2_vec_sca[L, T, Q]:
        pass
    cppclass functor2_vec_int[L, T, Q]:
        pass
    cppclass compute_log2[L, T, Q, isFloat, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&)
    cppclass compute_sqrt[L, T, Q, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&)
    cppclass compute_inversesqrt[L, T, Q, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&)
    cppclass compute_abs[genFIType]:
        pass
    cppclass compute_abs_vector[L, T, Q, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&)
    cppclass compute_mix_vector[L, T, U, Q, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&, glm_vec[void, T, void]&, glm_vec[void, U, void]&)
    cppclass compute_mix_scalar[L, T, U, Q, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&, glm_vec[void, T, void]&, const U&)
    cppclass compute_mix[T, U]:
        @staticmethod
        T call(const T&, const T&, const U&)
    cppclass compute_sign[L, T, Q, isFloat, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&)
    cppclass compute_floor[L, T, Q, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&)
    cppclass compute_ceil[L, T, Q, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&)
    cppclass compute_fract[L, T, Q, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&)
    cppclass compute_trunc[L, T, Q, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&)
    cppclass compute_round[L, T, Q, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&)
    cppclass compute_mod[L, T, Q, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&, glm_vec[void, T, void]&)
    cppclass compute_min_vector[L, T, Q, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&, glm_vec[void, T, void]&)
    cppclass compute_max_vector[L, T, Q, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&, glm_vec[void, T, void]&)
    cppclass compute_clamp_vector[L, T, Q, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&, glm_vec[void, T, void]&, glm_vec[void, T, void]&)
    cppclass compute_step_vector[L, T, Q, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&, glm_vec[void, T, void]&)
    cppclass compute_smoothstep_vector[L, T, Q, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&, glm_vec[void, T, void]&, glm_vec[void, T, void]&)
    cppclass compute_length[L, T, Q, Aligned]:
        @staticmethod
        T call(glm_vec[void, T, void]&)
    cppclass compute_distance[L, T, Q, Aligned]:
        @staticmethod
        T call(glm_vec[void, T, void]&, glm_vec[void, T, void]&)
    cppclass compute_dot[V, T, Aligned]:
        pass
    cppclass compute_cross[T, Q, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&, glm_vec[void, T, void]&)
    cppclass compute_normalize[L, T, Q, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&)
    cppclass compute_faceforward[L, T, Q, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&, glm_vec[void, T, void]&, glm_vec[void, T, void]&)
    cppclass compute_reflect[L, T, Q, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&, glm_vec[void, T, void]&)
    cppclass compute_refract[L, T, Q, Aligned]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&, glm_vec[void, T, void]&, T)
    cppclass compute_matrixCompMult[C, R, T, Q, Aligned]:
        @staticmethod
        glm_mat[void, void, T, void] call(glm_mat[void, void, T, void]&, glm_mat[void, void, T, void]&)
    cppclass compute_transpose[C, R, T, Q, Aligned]:
        pass
    cppclass compute_determinant[C, R, T, Q, Aligned]:
        pass
    cppclass compute_inverse[C, R, T, Q, Aligned]:
        pass
    ctypedef short hdata
    float toFloat32(hdata)
    hdata toFloat16(const float&)
    float overflow()
    union uif32:
        float f
        unsigned int i
    float toFloat32(hdata)
    hdata toFloat16(const float&)
    T mask[T](T)
    cppclass compute_bitfieldReverseStep[L, T, Q, Aligned, EXEC]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&, T, T)
    cppclass compute_bitfieldBitCountStep[L, T, Q, Aligned, EXEC]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&, T, T)
    cppclass compute_findLSB[genIUType, Bits]:
        @staticmethod
        int call(genIUType)
    cppclass compute_findMSB_step_vec[L, T, Q, EXEC]:
        @staticmethod
        glm_vec[void, T, void] call(glm_vec[void, T, void]&, T)
    cppclass compute_findMSB_vec[L, T, Q]:
        @staticmethod
        glm_vec[void, int, void] call(glm_vec[void, T, void]&)


