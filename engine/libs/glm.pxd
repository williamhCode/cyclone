cdef extern from "glm/glm.hpp" namespace "glm":
    cppclass vec[L, T, Q=*]:
        vec(...)
        T& operator[](int)

    ctypedef int length_t

    enum qualifier:
        packed_highp
        packed_mediump
        packed_lowp
        highp
        mediump
        lowp
        packed
        defaultp

    # vec
    ctypedef length_t _L "2"
    ctypedef qualifier _Q "glm::defaultp"
    ctypedef vec[_L, float, _Q] vec2

    ctypedef length_t _L "3"
    ctypedef vec[_L, float, _Q] vec3

    ctypedef length_t _L "4"
    ctypedef vec[_L, float, _Q] vec4


    # bvec
    ctypedef length_t _L "2"
    ctypedef vec[_L, bint, _Q] bvec2

    ctypedef length_t _L "3"
    ctypedef vec[_L, bint, _Q] bvec3

    ctypedef length_t _L "4"
    ctypedef vec[_L, bint, _Q] bvec4

    vec[L, T, Q] radians[L, T, Q](vec[L, T, Q]&)

    vec[L, T, Q] pow[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    vec[L, T, Q] exp[L, T, Q](vec[L, T, Q]&)
    vec[L, T, Q] log[L, T, Q](vec[L, T, Q]&)
    vec[L, T, Q] exp2[L, T, Q](vec[L, T, Q]&)
    vec[L, T, Q] log2[L, T, Q](vec[L, T, Q]&)
    vec[L, T, Q] sqrt[L, T, Q](vec[L, T, Q]&)
    vec[L, T, Q] inversesqrt[L, T, Q](vec[L, T, Q]&)
    vec[L, bint, Q] lessThan[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    vec[L, bint, Q] lessThanEqual[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    vec[L, bint, Q] greaterThan[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    vec[L, bint, Q] greaterThanEqual[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    vec[L, bint, Q] equal[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    vec[L, bint, Q] notEqual[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    bint any[L, Q](vec[L, bint, Q]&)
    bint all[L, Q](vec[L, bint, Q]&)
    # vec[L, bint, Q] not_[L, Q](vec[L, bint, Q]&)
    # vec[L, bint, Q] lessThan[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    # vec[L, bint, Q] lessThanEqual[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    # vec[L, bint, Q] greaterThan[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    # vec[L, bint, Q] greaterThanEqual[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    # vec[L, bint, Q] equal[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    # vec[L, bint, Q] notEqual[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    # bint any[L, Q](vec[L, bint, Q]&)
    # bint all[L, Q](vec[L, bint, Q]&)
    # vec[L, bint, Q] not_[L, Q](vec[L, bint, Q]&)
    # vec[L, T, Q] pow[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    # vec[L, T, Q] exp[L, T, Q](vec[L, T, Q]&)
    # vec[L, T, Q] log[L, T, Q](vec[L, T, Q]&)
    # vec[L, T, Q] exp2[L, T, Q](vec[L, T, Q]&)
    # genType log2[genType](genType)
    # vec[L, T, Q] log2[L, T, Q](vec[L, T, Q]&)
    # vec[L, T, Q] sqrt[L, T, Q](vec[L, T, Q]&)
    # genType inversesqrt[genType](genType)
    # vec[L, T, Q] inversesqrt[L, T, Q](vec[L, T, Q]&)
    # genType abs[genType](genType)
    # vec[L, T, Q] abs[L, T, Q](vec[L, T, Q]&)
    # vec[L, T, Q] sign[L, T, Q](vec[L, T, Q]&)
    # vec[L, T, Q] floor[L, T, Q](vec[L, T, Q]&)
    # vec[L, T, Q] trunc[L, T, Q](vec[L, T, Q]&)
    # vec[L, T, Q] round[L, T, Q](vec[L, T, Q]&)
    # vec[L, T, Q] roundEven[L, T, Q](vec[L, T, Q]&)
    # vec[L, T, Q] ceil[L, T, Q](vec[L, T, Q]&)
    # genType fract[genType](genType)
    # vec[L, T, Q] fract[L, T, Q](vec[L, T, Q]&)
    # genType mod[genType](genType, genType)
    # vec[L, T, Q] mod[L, T, Q](vec[L, T, Q]&, T)
    # vec[L, T, Q] mod[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    # genType modf[genType](genType, genType&)
    # genType min[genType](genType, genType)
    # vec[L, T, Q] min[L, T, Q](vec[L, T, Q]&, T)
    # vec[L, T, Q] min[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    # genType max[genType](genType, genType)
    # vec[L, T, Q] max[L, T, Q](vec[L, T, Q]&, T)
    # vec[L, T, Q] max[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    # genType clamp[genType](genType, genType, genType)
    # vec[L, T, Q] clamp[L, T, Q](vec[L, T, Q]&, T, T)
    # vec[L, T, Q] clamp[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&, vec[L, T, Q]&)
    # genTypeT mix[genTypeT, genTypeU](genTypeT, genTypeT, genTypeU)
    # vec[L, T, Q] mix[L, T, U, Q](vec[L, T, Q]&, vec[L, T, Q]&, vec[void, U, void]&)
    # vec[L, T, Q] mix[L, T, U, Q](vec[L, T, Q]&, vec[L, T, Q]&, U)
    # genType step[genType](genType, genType)
    # vec[L, T, Q] step[L, T, Q](T, vec[L, T, Q]&)
    # vec[L, T, Q] step[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    # genType smoothstep[genType](genType, genType, genType)
    # vec[L, T, Q] smoothstep[L, T, Q](T, T, vec[L, T, Q]&)
    # vec[L, T, Q] smoothstep[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&, vec[L, T, Q]&)
    # vec[L, bint, Q] isnan[L, T, Q](vec[L, T, Q]&)
    # vec[L, bint, Q] isinf[L, T, Q](vec[L, T, Q]&)
    # int floatBitsToInt(const float&)
    # vec[L, int, Q] floatBitsToInt[L, Q](vec[L, float, Q]&)
    # uint floatBitsToUint(const float&)
    # vec[void, uint, void] floatBitsToUint[L, Q](vec[L, float, Q]&)
    # float intBitsToFloat(const int&)
    # vec[L, float, Q] intBitsToFloat[L, Q](vec[L, int, Q]&)
    # float uintBitsToFloat(uint&)
    # vec[L, float, Q] uintBitsToFloat[L, Q](vec[void, uint, void]&)
    # genType fma[genType](const genType&, const genType&, const genType&)
    # genType frexp[genType](genType, int&)
    # vec[L, T, Q] frexp[L, T, Q](vec[L, T, Q]&, vec[L, int, Q]&)
    # genType ldexp[genType](const genType&, const int&)
    # vec[L, T, Q] ldexp[L, T, Q](vec[L, T, Q]&, vec[L, int, Q]&)
    # genType min[genType](genType, genType)
    # genType max[genType](genType, genType)
    # int abs(int)
    # genFIType abs[genFIType](genFIType)
    # vec[L, T, Q] abs[L, T, Q](vec[L, T, Q]&)
    # genFIType sign[genFIType](genFIType)
    # vec[L, T, Q] sign[L, T, Q](vec[L, T, Q]&)
    # vec[L, T, Q] floor[L, T, Q](vec[L, T, Q]&)
    # vec[L, T, Q] trunc[L, T, Q](vec[L, T, Q]&)
    # vec[L, T, Q] round[L, T, Q](vec[L, T, Q]&)
    # genType roundEven[genType](genType)
    # vec[L, T, Q] roundEven[L, T, Q](vec[L, T, Q]&)
    # vec[L, T, Q] ceil[L, T, Q](vec[L, T, Q]&)
    # genType fract[genType](genType)
    # vec[L, T, Q] fract[L, T, Q](vec[L, T, Q]&)
    # genType mod[genType](genType, genType)
    # vec[L, T, Q] mod[L, T, Q](vec[L, T, Q]&, T)
    # vec[L, T, Q] mod[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    # genType modf[genType](genType, genType&)
    # vec[L, T, Q] modf[T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    # vec[L, T, Q] modf[T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    # vec[L, T, Q] modf[T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    # vec[L, T, Q] modf[T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    # vec[L, T, Q] min[L, T, Q](vec[L, T, Q]&, T)
    # vec[L, T, Q] min[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    # vec[L, T, Q] max[L, T, Q](vec[L, T, Q]&, T)
    # vec[L, T, Q] max[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    # genType clamp[genType](genType, genType, genType)
    # vec[L, T, Q] clamp[L, T, Q](vec[L, T, Q]&, T, T)
    # vec[L, T, Q] clamp[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&, vec[L, T, Q]&)
    # genTypeT mix[genTypeT, genTypeU](genTypeT, genTypeT, genTypeU)
    # vec[L, T, Q] mix[L, T, U, Q](vec[L, T, Q]&, vec[L, T, Q]&, U)
    # vec[L, T, Q] mix[L, T, U, Q](vec[L, T, Q]&, vec[L, T, Q]&, vec[void, U, void]&)
    # genType step[genType](genType, genType)
    # vec[L, T, Q] step[L, T, Q](T, vec[L, T, Q]&)
    # vec[L, T, Q] step[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    # genType smoothstep[genType](genType, genType, genType)
    # vec[L, T, Q] smoothstep[L, T, Q](T, T, vec[L, T, Q]&)
    # vec[L, T, Q] smoothstep[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&, vec[L, T, Q]&)
    # vec[L, bint, Q] isnan[L, T, Q](vec[L, T, Q]&)
    # vec[L, bint, Q] isinf[L, T, Q](vec[L, T, Q]&)
    # int floatBitsToInt(const float&)
    # vec[L, int, Q] floatBitsToInt[L, Q](vec[L, float, Q]&)
    # uint floatBitsToUint(const float&)
    # vec[void, uint, void] floatBitsToUint[L, Q](vec[L, float, Q]&)
    # float intBitsToFloat(const int&)
    # vec[L, float, Q] intBitsToFloat[L, Q](vec[L, int, Q]&)
    # float uintBitsToFloat(uint&)
    # vec[L, float, Q] uintBitsToFloat[L, Q](vec[void, uint, void]&)
    # genType frexp[genType](genType, int&)
    # vec[L, T, Q] frexp[L, T, Q](vec[L, T, Q]&, vec[L, int, Q]&)
    # genType ldexp[genType](const genType&, const int&)
    # vec[L, T, Q] ldexp[L, T, Q](vec[L, T, Q]&, vec[L, int, Q]&)
    # genType length[genType](genType)
    # T length[L, T, Q](vec[L, T, Q]&)
    # genType distance[genType](const genType&, const genType&)
    # T distance[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    # T dot[T](T, T)
    # T dot[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    # vec[L, T, Q] cross[T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    # vec[L, T, Q] normalize[L, T, Q](vec[L, T, Q]&)
    # genType faceforward[genType](const genType&, const genType&, const genType&)
    # vec[L, T, Q] faceforward[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&, vec[L, T, Q]&)
    # genType reflect[genType](const genType&, const genType&)
    # vec[L, T, Q] reflect[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&)
    # genType refract[genType](const genType&, const genType&, genType)
    # vec[L, T, Q] refract[L, T, Q](vec[L, T, Q]&, vec[L, T, Q]&, T)
    # # mat[void, void, T, void] matrixCompMult[C, R, T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
