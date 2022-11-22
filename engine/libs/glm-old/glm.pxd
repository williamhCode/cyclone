from engine.libs.glm.detail cimport int16 as glm_detail_int16
from engine.libs.glm.detail cimport int32 as glm_detail_int32
from engine.libs.glm.detail cimport int64 as glm_detail_int64
from engine.libs.glm.detail cimport int8 as glm_detail_int8
from engine.libs.glm.detail cimport outerProduct_trait as glm_detail_outerProduct_trait
from engine.libs.glm.detail cimport uint16 as glm_detail_uint16
from engine.libs.glm.detail cimport uint32 as glm_detail_uint32
from engine.libs.glm.detail cimport uint64 as glm_detail_uint64
from engine.libs.glm.detail cimport uint8 as glm_detail_uint8

cdef extern from "glm/glm.hpp" namespace "glm":
    cppclass vec[L, T, Q]:
        pass
    cppclass mat[C, R, T, Q]:
        pass
    cppclass qua[T, Q]:
        pass
    ctypedef int length_t
    int countof[T, N]()
    ctypedef unsigned int uint
    enum qualifier:
        packed_highp = 0
        packed_mediump = 1
        packed_lowp = 2
        highp = 0
        mediump = 1
        lowp = 2
        packed = 0
        defaultp = 0
    ctypedef qualifier precision
    ctypedef int int8
    ctypedef int int16
    ctypedef int int32
    ctypedef int int64
    ctypedef int uint8
    ctypedef int uint16
    ctypedef int uint32
    ctypedef int uint64
    ctypedef int8 lowp_i8
    ctypedef int8 mediump_i8
    ctypedef int8 highp_i8
    ctypedef int8 i8
    ctypedef int8 lowp_int8
    ctypedef int8 mediump_int8
    ctypedef int8 highp_int8
    ctypedef int8 lowp_int8_t
    ctypedef int8 mediump_int8_t
    ctypedef int8 highp_int8_t
    ctypedef int8 int8_t
    ctypedef int16 lowp_i16
    ctypedef int16 mediump_i16
    ctypedef int16 highp_i16
    ctypedef int16 i16
    ctypedef int16 lowp_int16
    ctypedef int16 mediump_int16
    ctypedef int16 highp_int16
    ctypedef int16 lowp_int16_t
    ctypedef int16 mediump_int16_t
    ctypedef int16 highp_int16_t
    ctypedef int16 int16_t
    ctypedef int32 lowp_i32
    ctypedef int32 mediump_i32
    ctypedef int32 highp_i32
    ctypedef int32 i32
    ctypedef int32 lowp_int32
    ctypedef int32 mediump_int32
    ctypedef int32 highp_int32
    ctypedef int32 lowp_int32_t
    ctypedef int32 mediump_int32_t
    ctypedef int32 highp_int32_t
    ctypedef int32 int32_t
    ctypedef int64 lowp_i64
    ctypedef int64 mediump_i64
    ctypedef int64 highp_i64
    ctypedef int64 i64
    ctypedef int64 lowp_int64
    ctypedef int64 mediump_int64
    ctypedef int64 highp_int64
    ctypedef int64 lowp_int64_t
    ctypedef int64 mediump_int64_t
    ctypedef int64 highp_int64_t
    ctypedef int64 int64_t
    ctypedef unsigned int uint
    ctypedef uint8 lowp_u8
    ctypedef uint8 mediump_u8
    ctypedef uint8 highp_u8
    ctypedef uint8 u8
    ctypedef uint8 lowp_uint8
    ctypedef uint8 mediump_uint8
    ctypedef uint8 highp_uint8
    ctypedef uint8 lowp_uint8_t
    ctypedef uint8 mediump_uint8_t
    ctypedef uint8 highp_uint8_t
    ctypedef uint8 uint8_t
    ctypedef uint16 lowp_u16
    ctypedef uint16 mediump_u16
    ctypedef uint16 highp_u16
    ctypedef uint16 u16
    ctypedef uint16 lowp_uint16
    ctypedef uint16 mediump_uint16
    ctypedef uint16 highp_uint16
    ctypedef uint16 lowp_uint16_t
    ctypedef uint16 mediump_uint16_t
    ctypedef uint16 highp_uint16_t
    ctypedef uint16 uint16_t
    ctypedef uint32 lowp_u32
    ctypedef uint32 mediump_u32
    ctypedef uint32 highp_u32
    ctypedef uint32 u32
    ctypedef uint32 lowp_uint32
    ctypedef uint32 mediump_uint32
    ctypedef uint32 highp_uint32
    ctypedef uint32 lowp_uint32_t
    ctypedef uint32 mediump_uint32_t
    ctypedef uint32 highp_uint32_t
    ctypedef uint32 uint32_t
    ctypedef uint64 lowp_u64
    ctypedef uint64 mediump_u64
    ctypedef uint64 highp_u64
    ctypedef uint64 u64
    ctypedef uint64 lowp_uint64
    ctypedef uint64 mediump_uint64
    ctypedef uint64 highp_uint64
    ctypedef uint64 lowp_uint64_t
    ctypedef uint64 mediump_uint64_t
    ctypedef uint64 highp_uint64_t
    ctypedef uint64 uint64_t
    ctypedef float lowp_f32
    ctypedef float mediump_f32
    ctypedef float highp_f32
    ctypedef float f32
    ctypedef float lowp_float32
    ctypedef float mediump_float32
    ctypedef float highp_float32
    ctypedef float float32
    ctypedef float lowp_float32_t
    ctypedef float mediump_float32_t
    ctypedef float highp_float32_t
    ctypedef float float32_t
    ctypedef double lowp_f64
    ctypedef double mediump_f64
    ctypedef double highp_f64
    ctypedef double f64
    ctypedef double lowp_float64
    ctypedef double mediump_float64
    ctypedef double highp_float64
    ctypedef double float64
    ctypedef double lowp_float64_t
    ctypedef double mediump_float64_t
    ctypedef double highp_float64_t
    ctypedef double float64_t
    ctypedef vec[void, bint, void] lowp_bvec1
    ctypedef vec[void, bint, void] lowp_bvec2
    ctypedef vec[void, bint, void] lowp_bvec3
    ctypedef vec[void, bint, void] lowp_bvec4
    ctypedef vec[void, bint, void] mediump_bvec1
    ctypedef vec[void, bint, void] mediump_bvec2
    ctypedef vec[void, bint, void] mediump_bvec3
    ctypedef vec[void, bint, void] mediump_bvec4
    ctypedef vec[void, bint, void] highp_bvec1
    ctypedef vec[void, bint, void] highp_bvec2
    ctypedef vec[void, bint, void] highp_bvec3
    ctypedef vec[void, bint, void] highp_bvec4
    ctypedef vec[void, bint, void] bvec1
    ctypedef vec[void, bint, void] bvec2
    ctypedef vec[void, bint, void] bvec3
    ctypedef vec[void, bint, void] bvec4
    ctypedef vec[void, int, void] lowp_ivec1
    ctypedef vec[void, int, void] lowp_ivec2
    ctypedef vec[void, int, void] lowp_ivec3
    ctypedef vec[void, int, void] lowp_ivec4
    ctypedef vec[void, int, void] mediump_ivec1
    ctypedef vec[void, int, void] mediump_ivec2
    ctypedef vec[void, int, void] mediump_ivec3
    ctypedef vec[void, int, void] mediump_ivec4
    ctypedef vec[void, int, void] highp_ivec1
    ctypedef vec[void, int, void] highp_ivec2
    ctypedef vec[void, int, void] highp_ivec3
    ctypedef vec[void, int, void] highp_ivec4
    ctypedef vec[void, int, void] ivec1
    ctypedef vec[void, int, void] ivec2
    ctypedef vec[void, int, void] ivec3
    ctypedef vec[void, int, void] ivec4
    ctypedef vec[void, i8, void] lowp_i8vec1
    ctypedef vec[void, i8, void] lowp_i8vec2
    ctypedef vec[void, i8, void] lowp_i8vec3
    ctypedef vec[void, i8, void] lowp_i8vec4
    ctypedef vec[void, i8, void] mediump_i8vec1
    ctypedef vec[void, i8, void] mediump_i8vec2
    ctypedef vec[void, i8, void] mediump_i8vec3
    ctypedef vec[void, i8, void] mediump_i8vec4
    ctypedef vec[void, i8, void] highp_i8vec1
    ctypedef vec[void, i8, void] highp_i8vec2
    ctypedef vec[void, i8, void] highp_i8vec3
    ctypedef vec[void, i8, void] highp_i8vec4
    ctypedef vec[void, i8, void] i8vec1
    ctypedef vec[void, i8, void] i8vec2
    ctypedef vec[void, i8, void] i8vec3
    ctypedef vec[void, i8, void] i8vec4
    ctypedef vec[void, i16, void] lowp_i16vec1
    ctypedef vec[void, i16, void] lowp_i16vec2
    ctypedef vec[void, i16, void] lowp_i16vec3
    ctypedef vec[void, i16, void] lowp_i16vec4
    ctypedef vec[void, i16, void] mediump_i16vec1
    ctypedef vec[void, i16, void] mediump_i16vec2
    ctypedef vec[void, i16, void] mediump_i16vec3
    ctypedef vec[void, i16, void] mediump_i16vec4
    ctypedef vec[void, i16, void] highp_i16vec1
    ctypedef vec[void, i16, void] highp_i16vec2
    ctypedef vec[void, i16, void] highp_i16vec3
    ctypedef vec[void, i16, void] highp_i16vec4
    ctypedef vec[void, i16, void] i16vec1
    ctypedef vec[void, i16, void] i16vec2
    ctypedef vec[void, i16, void] i16vec3
    ctypedef vec[void, i16, void] i16vec4
    ctypedef vec[void, i32, void] lowp_i32vec1
    ctypedef vec[void, i32, void] lowp_i32vec2
    ctypedef vec[void, i32, void] lowp_i32vec3
    ctypedef vec[void, i32, void] lowp_i32vec4
    ctypedef vec[void, i32, void] mediump_i32vec1
    ctypedef vec[void, i32, void] mediump_i32vec2
    ctypedef vec[void, i32, void] mediump_i32vec3
    ctypedef vec[void, i32, void] mediump_i32vec4
    ctypedef vec[void, i32, void] highp_i32vec1
    ctypedef vec[void, i32, void] highp_i32vec2
    ctypedef vec[void, i32, void] highp_i32vec3
    ctypedef vec[void, i32, void] highp_i32vec4
    ctypedef vec[void, i32, void] i32vec1
    ctypedef vec[void, i32, void] i32vec2
    ctypedef vec[void, i32, void] i32vec3
    ctypedef vec[void, i32, void] i32vec4
    ctypedef vec[void, i64, void] lowp_i64vec1
    ctypedef vec[void, i64, void] lowp_i64vec2
    ctypedef vec[void, i64, void] lowp_i64vec3
    ctypedef vec[void, i64, void] lowp_i64vec4
    ctypedef vec[void, i64, void] mediump_i64vec1
    ctypedef vec[void, i64, void] mediump_i64vec2
    ctypedef vec[void, i64, void] mediump_i64vec3
    ctypedef vec[void, i64, void] mediump_i64vec4
    ctypedef vec[void, i64, void] highp_i64vec1
    ctypedef vec[void, i64, void] highp_i64vec2
    ctypedef vec[void, i64, void] highp_i64vec3
    ctypedef vec[void, i64, void] highp_i64vec4
    ctypedef vec[void, i64, void] i64vec1
    ctypedef vec[void, i64, void] i64vec2
    ctypedef vec[void, i64, void] i64vec3
    ctypedef vec[void, i64, void] i64vec4
    ctypedef vec[void, uint, void] lowp_uvec1
    ctypedef vec[void, uint, void] lowp_uvec2
    ctypedef vec[void, uint, void] lowp_uvec3
    ctypedef vec[void, uint, void] lowp_uvec4
    ctypedef vec[void, uint, void] mediump_uvec1
    ctypedef vec[void, uint, void] mediump_uvec2
    ctypedef vec[void, uint, void] mediump_uvec3
    ctypedef vec[void, uint, void] mediump_uvec4
    ctypedef vec[void, uint, void] highp_uvec1
    ctypedef vec[void, uint, void] highp_uvec2
    ctypedef vec[void, uint, void] highp_uvec3
    ctypedef vec[void, uint, void] highp_uvec4
    ctypedef vec[void, uint, void] uvec1
    ctypedef vec[void, uint, void] uvec2
    ctypedef vec[void, uint, void] uvec3
    ctypedef vec[void, uint, void] uvec4
    ctypedef vec[void, u8, void] lowp_u8vec1
    ctypedef vec[void, u8, void] lowp_u8vec2
    ctypedef vec[void, u8, void] lowp_u8vec3
    ctypedef vec[void, u8, void] lowp_u8vec4
    ctypedef vec[void, u8, void] mediump_u8vec1
    ctypedef vec[void, u8, void] mediump_u8vec2
    ctypedef vec[void, u8, void] mediump_u8vec3
    ctypedef vec[void, u8, void] mediump_u8vec4
    ctypedef vec[void, u8, void] highp_u8vec1
    ctypedef vec[void, u8, void] highp_u8vec2
    ctypedef vec[void, u8, void] highp_u8vec3
    ctypedef vec[void, u8, void] highp_u8vec4
    ctypedef vec[void, u8, void] u8vec1
    ctypedef vec[void, u8, void] u8vec2
    ctypedef vec[void, u8, void] u8vec3
    ctypedef vec[void, u8, void] u8vec4
    ctypedef vec[void, u16, void] lowp_u16vec1
    ctypedef vec[void, u16, void] lowp_u16vec2
    ctypedef vec[void, u16, void] lowp_u16vec3
    ctypedef vec[void, u16, void] lowp_u16vec4
    ctypedef vec[void, u16, void] mediump_u16vec1
    ctypedef vec[void, u16, void] mediump_u16vec2
    ctypedef vec[void, u16, void] mediump_u16vec3
    ctypedef vec[void, u16, void] mediump_u16vec4
    ctypedef vec[void, u16, void] highp_u16vec1
    ctypedef vec[void, u16, void] highp_u16vec2
    ctypedef vec[void, u16, void] highp_u16vec3
    ctypedef vec[void, u16, void] highp_u16vec4
    ctypedef vec[void, u16, void] u16vec1
    ctypedef vec[void, u16, void] u16vec2
    ctypedef vec[void, u16, void] u16vec3
    ctypedef vec[void, u16, void] u16vec4
    ctypedef vec[void, u32, void] lowp_u32vec1
    ctypedef vec[void, u32, void] lowp_u32vec2
    ctypedef vec[void, u32, void] lowp_u32vec3
    ctypedef vec[void, u32, void] lowp_u32vec4
    ctypedef vec[void, u32, void] mediump_u32vec1
    ctypedef vec[void, u32, void] mediump_u32vec2
    ctypedef vec[void, u32, void] mediump_u32vec3
    ctypedef vec[void, u32, void] mediump_u32vec4
    ctypedef vec[void, u32, void] highp_u32vec1
    ctypedef vec[void, u32, void] highp_u32vec2
    ctypedef vec[void, u32, void] highp_u32vec3
    ctypedef vec[void, u32, void] highp_u32vec4
    ctypedef vec[void, u32, void] u32vec1
    ctypedef vec[void, u32, void] u32vec2
    ctypedef vec[void, u32, void] u32vec3
    ctypedef vec[void, u32, void] u32vec4
    ctypedef vec[void, u64, void] lowp_u64vec1
    ctypedef vec[void, u64, void] lowp_u64vec2
    ctypedef vec[void, u64, void] lowp_u64vec3
    ctypedef vec[void, u64, void] lowp_u64vec4
    ctypedef vec[void, u64, void] mediump_u64vec1
    ctypedef vec[void, u64, void] mediump_u64vec2
    ctypedef vec[void, u64, void] mediump_u64vec3
    ctypedef vec[void, u64, void] mediump_u64vec4
    ctypedef vec[void, u64, void] highp_u64vec1
    ctypedef vec[void, u64, void] highp_u64vec2
    ctypedef vec[void, u64, void] highp_u64vec3
    ctypedef vec[void, u64, void] highp_u64vec4
    ctypedef vec[void, u64, void] u64vec1
    ctypedef vec[void, u64, void] u64vec2
    ctypedef vec[void, u64, void] u64vec3
    ctypedef vec[void, u64, void] u64vec4
    ctypedef vec[void, float, void] lowp_vec1
    ctypedef vec[void, float, void] lowp_vec2
    ctypedef vec[void, float, void] lowp_vec3
    ctypedef vec[void, float, void] lowp_vec4
    ctypedef vec[void, float, void] mediump_vec1
    ctypedef vec[void, float, void] mediump_vec2
    ctypedef vec[void, float, void] mediump_vec3
    ctypedef vec[void, float, void] mediump_vec4
    ctypedef vec[void, float, void] highp_vec1
    ctypedef vec[void, float, void] highp_vec2
    ctypedef vec[void, float, void] highp_vec3
    ctypedef vec[void, float, void] highp_vec4
    ctypedef vec[void, float, void] vec1
    ctypedef vec[void, float, void] vec2
    ctypedef vec[void, float, void] vec3
    ctypedef vec[void, float, void] vec4
    ctypedef vec[void, float, void] lowp_fvec1
    ctypedef vec[void, float, void] lowp_fvec2
    ctypedef vec[void, float, void] lowp_fvec3
    ctypedef vec[void, float, void] lowp_fvec4
    ctypedef vec[void, float, void] mediump_fvec1
    ctypedef vec[void, float, void] mediump_fvec2
    ctypedef vec[void, float, void] mediump_fvec3
    ctypedef vec[void, float, void] mediump_fvec4
    ctypedef vec[void, float, void] highp_fvec1
    ctypedef vec[void, float, void] highp_fvec2
    ctypedef vec[void, float, void] highp_fvec3
    ctypedef vec[void, float, void] highp_fvec4
    ctypedef vec[void, f32, void] fvec1
    ctypedef vec[void, f32, void] fvec2
    ctypedef vec[void, f32, void] fvec3
    ctypedef vec[void, f32, void] fvec4
    ctypedef vec[void, f32, void] lowp_f32vec1
    ctypedef vec[void, f32, void] lowp_f32vec2
    ctypedef vec[void, f32, void] lowp_f32vec3
    ctypedef vec[void, f32, void] lowp_f32vec4
    ctypedef vec[void, f32, void] mediump_f32vec1
    ctypedef vec[void, f32, void] mediump_f32vec2
    ctypedef vec[void, f32, void] mediump_f32vec3
    ctypedef vec[void, f32, void] mediump_f32vec4
    ctypedef vec[void, f32, void] highp_f32vec1
    ctypedef vec[void, f32, void] highp_f32vec2
    ctypedef vec[void, f32, void] highp_f32vec3
    ctypedef vec[void, f32, void] highp_f32vec4
    ctypedef vec[void, f32, void] f32vec1
    ctypedef vec[void, f32, void] f32vec2
    ctypedef vec[void, f32, void] f32vec3
    ctypedef vec[void, f32, void] f32vec4
    ctypedef vec[void, f64, void] lowp_dvec1
    ctypedef vec[void, f64, void] lowp_dvec2
    ctypedef vec[void, f64, void] lowp_dvec3
    ctypedef vec[void, f64, void] lowp_dvec4
    ctypedef vec[void, f64, void] mediump_dvec1
    ctypedef vec[void, f64, void] mediump_dvec2
    ctypedef vec[void, f64, void] mediump_dvec3
    ctypedef vec[void, f64, void] mediump_dvec4
    ctypedef vec[void, f64, void] highp_dvec1
    ctypedef vec[void, f64, void] highp_dvec2
    ctypedef vec[void, f64, void] highp_dvec3
    ctypedef vec[void, f64, void] highp_dvec4
    ctypedef vec[void, f64, void] dvec1
    ctypedef vec[void, f64, void] dvec2
    ctypedef vec[void, f64, void] dvec3
    ctypedef vec[void, f64, void] dvec4
    ctypedef vec[void, f64, void] lowp_f64vec1
    ctypedef vec[void, f64, void] lowp_f64vec2
    ctypedef vec[void, f64, void] lowp_f64vec3
    ctypedef vec[void, f64, void] lowp_f64vec4
    ctypedef vec[void, f64, void] mediump_f64vec1
    ctypedef vec[void, f64, void] mediump_f64vec2
    ctypedef vec[void, f64, void] mediump_f64vec3
    ctypedef vec[void, f64, void] mediump_f64vec4
    ctypedef vec[void, f64, void] highp_f64vec1
    ctypedef vec[void, f64, void] highp_f64vec2
    ctypedef vec[void, f64, void] highp_f64vec3
    ctypedef vec[void, f64, void] highp_f64vec4
    ctypedef vec[void, f64, void] f64vec1
    ctypedef vec[void, f64, void] f64vec2
    ctypedef vec[void, f64, void] f64vec3
    ctypedef vec[void, f64, void] f64vec4
    ctypedef mat[void, void, f32, void] lowp_mat2
    ctypedef mat[void, void, f32, void] lowp_mat3
    ctypedef mat[void, void, f32, void] lowp_mat4
    ctypedef mat[void, void, f32, void] mediump_mat2
    ctypedef mat[void, void, f32, void] mediump_mat3
    ctypedef mat[void, void, f32, void] mediump_mat4
    ctypedef mat[void, void, f32, void] highp_mat2
    ctypedef mat[void, void, f32, void] highp_mat3
    ctypedef mat[void, void, f32, void] highp_mat4
    ctypedef mat[void, void, f32, void] mat2
    ctypedef mat[void, void, f32, void] mat3
    ctypedef mat[void, void, f32, void] mat4
    ctypedef mat[void, void, f32, void] lowp_fmat2
    ctypedef mat[void, void, f32, void] lowp_fmat3
    ctypedef mat[void, void, f32, void] lowp_fmat4
    ctypedef mat[void, void, f32, void] mediump_fmat2
    ctypedef mat[void, void, f32, void] mediump_fmat3
    ctypedef mat[void, void, f32, void] mediump_fmat4
    ctypedef mat[void, void, f32, void] highp_fmat2
    ctypedef mat[void, void, f32, void] highp_fmat3
    ctypedef mat[void, void, f32, void] highp_fmat4
    ctypedef mat[void, void, f32, void] fmat2
    ctypedef mat[void, void, f32, void] fmat3
    ctypedef mat[void, void, f32, void] fmat4
    ctypedef mat[void, void, f32, void] lowp_f32mat2
    ctypedef mat[void, void, f32, void] lowp_f32mat3
    ctypedef mat[void, void, f32, void] lowp_f32mat4
    ctypedef mat[void, void, f32, void] mediump_f32mat2
    ctypedef mat[void, void, f32, void] mediump_f32mat3
    ctypedef mat[void, void, f32, void] mediump_f32mat4
    ctypedef mat[void, void, f32, void] highp_f32mat2
    ctypedef mat[void, void, f32, void] highp_f32mat3
    ctypedef mat[void, void, f32, void] highp_f32mat4
    ctypedef mat[void, void, f32, void] f32mat2
    ctypedef mat[void, void, f32, void] f32mat3
    ctypedef mat[void, void, f32, void] f32mat4
    ctypedef mat[void, void, f64, void] lowp_dmat2
    ctypedef mat[void, void, f64, void] lowp_dmat3
    ctypedef mat[void, void, f64, void] lowp_dmat4
    ctypedef mat[void, void, f64, void] mediump_dmat2
    ctypedef mat[void, void, f64, void] mediump_dmat3
    ctypedef mat[void, void, f64, void] mediump_dmat4
    ctypedef mat[void, void, f64, void] highp_dmat2
    ctypedef mat[void, void, f64, void] highp_dmat3
    ctypedef mat[void, void, f64, void] highp_dmat4
    ctypedef mat[void, void, f64, void] dmat2
    ctypedef mat[void, void, f64, void] dmat3
    ctypedef mat[void, void, f64, void] dmat4
    ctypedef mat[void, void, f64, void] lowp_f64mat2
    ctypedef mat[void, void, f64, void] lowp_f64mat3
    ctypedef mat[void, void, f64, void] lowp_f64mat4
    ctypedef mat[void, void, f64, void] mediump_f64mat2
    ctypedef mat[void, void, f64, void] mediump_f64mat3
    ctypedef mat[void, void, f64, void] mediump_f64mat4
    ctypedef mat[void, void, f64, void] highp_f64mat2
    ctypedef mat[void, void, f64, void] highp_f64mat3
    ctypedef mat[void, void, f64, void] highp_f64mat4
    ctypedef mat[void, void, f64, void] f64mat2
    ctypedef mat[void, void, f64, void] f64mat3
    ctypedef mat[void, void, f64, void] f64mat4
    ctypedef mat[void, void, f32, void] lowp_mat2x2
    ctypedef mat[void, void, f32, void] lowp_mat2x3
    ctypedef mat[void, void, f32, void] lowp_mat2x4
    ctypedef mat[void, void, f32, void] lowp_mat3x2
    ctypedef mat[void, void, f32, void] lowp_mat3x3
    ctypedef mat[void, void, f32, void] lowp_mat3x4
    ctypedef mat[void, void, f32, void] lowp_mat4x2
    ctypedef mat[void, void, f32, void] lowp_mat4x3
    ctypedef mat[void, void, f32, void] lowp_mat4x4
    ctypedef mat[void, void, f32, void] mediump_mat2x2
    ctypedef mat[void, void, f32, void] mediump_mat2x3
    ctypedef mat[void, void, f32, void] mediump_mat2x4
    ctypedef mat[void, void, f32, void] mediump_mat3x2
    ctypedef mat[void, void, f32, void] mediump_mat3x3
    ctypedef mat[void, void, f32, void] mediump_mat3x4
    ctypedef mat[void, void, f32, void] mediump_mat4x2
    ctypedef mat[void, void, f32, void] mediump_mat4x3
    ctypedef mat[void, void, f32, void] mediump_mat4x4
    ctypedef mat[void, void, f32, void] highp_mat2x2
    ctypedef mat[void, void, f32, void] highp_mat2x3
    ctypedef mat[void, void, f32, void] highp_mat2x4
    ctypedef mat[void, void, f32, void] highp_mat3x2
    ctypedef mat[void, void, f32, void] highp_mat3x3
    ctypedef mat[void, void, f32, void] highp_mat3x4
    ctypedef mat[void, void, f32, void] highp_mat4x2
    ctypedef mat[void, void, f32, void] highp_mat4x3
    ctypedef mat[void, void, f32, void] highp_mat4x4
    ctypedef mat[void, void, f32, void] mat2x2
    ctypedef mat[void, void, f32, void] mat3x2
    ctypedef mat[void, void, f32, void] mat4x2
    ctypedef mat[void, void, f32, void] mat2x3
    ctypedef mat[void, void, f32, void] mat3x3
    ctypedef mat[void, void, f32, void] mat4x3
    ctypedef mat[void, void, f32, void] mat2x4
    ctypedef mat[void, void, f32, void] mat3x4
    ctypedef mat[void, void, f32, void] mat4x4
    ctypedef mat[void, void, f32, void] lowp_fmat2x2
    ctypedef mat[void, void, f32, void] lowp_fmat2x3
    ctypedef mat[void, void, f32, void] lowp_fmat2x4
    ctypedef mat[void, void, f32, void] lowp_fmat3x2
    ctypedef mat[void, void, f32, void] lowp_fmat3x3
    ctypedef mat[void, void, f32, void] lowp_fmat3x4
    ctypedef mat[void, void, f32, void] lowp_fmat4x2
    ctypedef mat[void, void, f32, void] lowp_fmat4x3
    ctypedef mat[void, void, f32, void] lowp_fmat4x4
    ctypedef mat[void, void, f32, void] mediump_fmat2x2
    ctypedef mat[void, void, f32, void] mediump_fmat2x3
    ctypedef mat[void, void, f32, void] mediump_fmat2x4
    ctypedef mat[void, void, f32, void] mediump_fmat3x2
    ctypedef mat[void, void, f32, void] mediump_fmat3x3
    ctypedef mat[void, void, f32, void] mediump_fmat3x4
    ctypedef mat[void, void, f32, void] mediump_fmat4x2
    ctypedef mat[void, void, f32, void] mediump_fmat4x3
    ctypedef mat[void, void, f32, void] mediump_fmat4x4
    ctypedef mat[void, void, f32, void] highp_fmat2x2
    ctypedef mat[void, void, f32, void] highp_fmat2x3
    ctypedef mat[void, void, f32, void] highp_fmat2x4
    ctypedef mat[void, void, f32, void] highp_fmat3x2
    ctypedef mat[void, void, f32, void] highp_fmat3x3
    ctypedef mat[void, void, f32, void] highp_fmat3x4
    ctypedef mat[void, void, f32, void] highp_fmat4x2
    ctypedef mat[void, void, f32, void] highp_fmat4x3
    ctypedef mat[void, void, f32, void] highp_fmat4x4
    ctypedef mat[void, void, f32, void] fmat2x2
    ctypedef mat[void, void, f32, void] fmat3x2
    ctypedef mat[void, void, f32, void] fmat4x2
    ctypedef mat[void, void, f32, void] fmat2x3
    ctypedef mat[void, void, f32, void] fmat3x3
    ctypedef mat[void, void, f32, void] fmat4x3
    ctypedef mat[void, void, f32, void] fmat2x4
    ctypedef mat[void, void, f32, void] fmat3x4
    ctypedef mat[void, void, f32, void] fmat4x4
    ctypedef mat[void, void, f32, void] lowp_f32mat2x2
    ctypedef mat[void, void, f32, void] lowp_f32mat2x3
    ctypedef mat[void, void, f32, void] lowp_f32mat2x4
    ctypedef mat[void, void, f32, void] lowp_f32mat3x2
    ctypedef mat[void, void, f32, void] lowp_f32mat3x3
    ctypedef mat[void, void, f32, void] lowp_f32mat3x4
    ctypedef mat[void, void, f32, void] lowp_f32mat4x2
    ctypedef mat[void, void, f32, void] lowp_f32mat4x3
    ctypedef mat[void, void, f32, void] lowp_f32mat4x4
    ctypedef mat[void, void, f32, void] mediump_f32mat2x2
    ctypedef mat[void, void, f32, void] mediump_f32mat2x3
    ctypedef mat[void, void, f32, void] mediump_f32mat2x4
    ctypedef mat[void, void, f32, void] mediump_f32mat3x2
    ctypedef mat[void, void, f32, void] mediump_f32mat3x3
    ctypedef mat[void, void, f32, void] mediump_f32mat3x4
    ctypedef mat[void, void, f32, void] mediump_f32mat4x2
    ctypedef mat[void, void, f32, void] mediump_f32mat4x3
    ctypedef mat[void, void, f32, void] mediump_f32mat4x4
    ctypedef mat[void, void, f32, void] highp_f32mat2x2
    ctypedef mat[void, void, f32, void] highp_f32mat2x3
    ctypedef mat[void, void, f32, void] highp_f32mat2x4
    ctypedef mat[void, void, f32, void] highp_f32mat3x2
    ctypedef mat[void, void, f32, void] highp_f32mat3x3
    ctypedef mat[void, void, f32, void] highp_f32mat3x4
    ctypedef mat[void, void, f32, void] highp_f32mat4x2
    ctypedef mat[void, void, f32, void] highp_f32mat4x3
    ctypedef mat[void, void, f32, void] highp_f32mat4x4
    ctypedef mat[void, void, f32, void] f32mat2x2
    ctypedef mat[void, void, f32, void] f32mat3x2
    ctypedef mat[void, void, f32, void] f32mat4x2
    ctypedef mat[void, void, f32, void] f32mat2x3
    ctypedef mat[void, void, f32, void] f32mat3x3
    ctypedef mat[void, void, f32, void] f32mat4x3
    ctypedef mat[void, void, f32, void] f32mat2x4
    ctypedef mat[void, void, f32, void] f32mat3x4
    ctypedef mat[void, void, f32, void] f32mat4x4
    ctypedef mat[void, void, double, void] lowp_dmat2x2
    ctypedef mat[void, void, double, void] lowp_dmat2x3
    ctypedef mat[void, void, double, void] lowp_dmat2x4
    ctypedef mat[void, void, double, void] lowp_dmat3x2
    ctypedef mat[void, void, double, void] lowp_dmat3x3
    ctypedef mat[void, void, double, void] lowp_dmat3x4
    ctypedef mat[void, void, double, void] lowp_dmat4x2
    ctypedef mat[void, void, double, void] lowp_dmat4x3
    ctypedef mat[void, void, double, void] lowp_dmat4x4
    ctypedef mat[void, void, double, void] mediump_dmat2x2
    ctypedef mat[void, void, double, void] mediump_dmat2x3
    ctypedef mat[void, void, double, void] mediump_dmat2x4
    ctypedef mat[void, void, double, void] mediump_dmat3x2
    ctypedef mat[void, void, double, void] mediump_dmat3x3
    ctypedef mat[void, void, double, void] mediump_dmat3x4
    ctypedef mat[void, void, double, void] mediump_dmat4x2
    ctypedef mat[void, void, double, void] mediump_dmat4x3
    ctypedef mat[void, void, double, void] mediump_dmat4x4
    ctypedef mat[void, void, double, void] highp_dmat2x2
    ctypedef mat[void, void, double, void] highp_dmat2x3
    ctypedef mat[void, void, double, void] highp_dmat2x4
    ctypedef mat[void, void, double, void] highp_dmat3x2
    ctypedef mat[void, void, double, void] highp_dmat3x3
    ctypedef mat[void, void, double, void] highp_dmat3x4
    ctypedef mat[void, void, double, void] highp_dmat4x2
    ctypedef mat[void, void, double, void] highp_dmat4x3
    ctypedef mat[void, void, double, void] highp_dmat4x4
    ctypedef mat[void, void, double, void] dmat2x2
    ctypedef mat[void, void, double, void] dmat3x2
    ctypedef mat[void, void, double, void] dmat4x2
    ctypedef mat[void, void, double, void] dmat2x3
    ctypedef mat[void, void, double, void] dmat3x3
    ctypedef mat[void, void, double, void] dmat4x3
    ctypedef mat[void, void, double, void] dmat2x4
    ctypedef mat[void, void, double, void] dmat3x4
    ctypedef mat[void, void, double, void] dmat4x4
    ctypedef mat[void, void, f64, void] lowp_f64mat2x2
    ctypedef mat[void, void, f64, void] lowp_f64mat2x3
    ctypedef mat[void, void, f64, void] lowp_f64mat2x4
    ctypedef mat[void, void, f64, void] lowp_f64mat3x2
    ctypedef mat[void, void, f64, void] lowp_f64mat3x3
    ctypedef mat[void, void, f64, void] lowp_f64mat3x4
    ctypedef mat[void, void, f64, void] lowp_f64mat4x2
    ctypedef mat[void, void, f64, void] lowp_f64mat4x3
    ctypedef mat[void, void, f64, void] lowp_f64mat4x4
    ctypedef mat[void, void, f64, void] mediump_f64mat2x2
    ctypedef mat[void, void, f64, void] mediump_f64mat2x3
    ctypedef mat[void, void, f64, void] mediump_f64mat2x4
    ctypedef mat[void, void, f64, void] mediump_f64mat3x2
    ctypedef mat[void, void, f64, void] mediump_f64mat3x3
    ctypedef mat[void, void, f64, void] mediump_f64mat3x4
    ctypedef mat[void, void, f64, void] mediump_f64mat4x2
    ctypedef mat[void, void, f64, void] mediump_f64mat4x3
    ctypedef mat[void, void, f64, void] mediump_f64mat4x4
    ctypedef mat[void, void, f64, void] highp_f64mat2x2
    ctypedef mat[void, void, f64, void] highp_f64mat2x3
    ctypedef mat[void, void, f64, void] highp_f64mat2x4
    ctypedef mat[void, void, f64, void] highp_f64mat3x2
    ctypedef mat[void, void, f64, void] highp_f64mat3x3
    ctypedef mat[void, void, f64, void] highp_f64mat3x4
    ctypedef mat[void, void, f64, void] highp_f64mat4x2
    ctypedef mat[void, void, f64, void] highp_f64mat4x3
    ctypedef mat[void, void, f64, void] highp_f64mat4x4
    ctypedef mat[void, void, f64, void] f64mat2x2
    ctypedef mat[void, void, f64, void] f64mat3x2
    ctypedef mat[void, void, f64, void] f64mat4x2
    ctypedef mat[void, void, f64, void] f64mat2x3
    ctypedef mat[void, void, f64, void] f64mat3x3
    ctypedef mat[void, void, f64, void] f64mat4x3
    ctypedef mat[void, void, f64, void] f64mat2x4
    ctypedef mat[void, void, f64, void] f64mat3x4
    ctypedef mat[void, void, f64, void] f64mat4x4
    ctypedef mat[void, void, int, void] lowp_imat2x2
    ctypedef mat[void, void, int, void] lowp_imat2x3
    ctypedef mat[void, void, int, void] lowp_imat2x4
    ctypedef mat[void, void, int, void] lowp_imat3x2
    ctypedef mat[void, void, int, void] lowp_imat3x3
    ctypedef mat[void, void, int, void] lowp_imat3x4
    ctypedef mat[void, void, int, void] lowp_imat4x2
    ctypedef mat[void, void, int, void] lowp_imat4x3
    ctypedef mat[void, void, int, void] lowp_imat4x4
    ctypedef mat[void, void, int, void] mediump_imat2x2
    ctypedef mat[void, void, int, void] mediump_imat2x3
    ctypedef mat[void, void, int, void] mediump_imat2x4
    ctypedef mat[void, void, int, void] mediump_imat3x2
    ctypedef mat[void, void, int, void] mediump_imat3x3
    ctypedef mat[void, void, int, void] mediump_imat3x4
    ctypedef mat[void, void, int, void] mediump_imat4x2
    ctypedef mat[void, void, int, void] mediump_imat4x3
    ctypedef mat[void, void, int, void] mediump_imat4x4
    ctypedef mat[void, void, int, void] highp_imat2x2
    ctypedef mat[void, void, int, void] highp_imat2x3
    ctypedef mat[void, void, int, void] highp_imat2x4
    ctypedef mat[void, void, int, void] highp_imat3x2
    ctypedef mat[void, void, int, void] highp_imat3x3
    ctypedef mat[void, void, int, void] highp_imat3x4
    ctypedef mat[void, void, int, void] highp_imat4x2
    ctypedef mat[void, void, int, void] highp_imat4x3
    ctypedef mat[void, void, int, void] highp_imat4x4
    ctypedef mat[void, void, int, void] imat2x2
    ctypedef mat[void, void, int, void] imat3x2
    ctypedef mat[void, void, int, void] imat4x2
    ctypedef mat[void, void, int, void] imat2x3
    ctypedef mat[void, void, int, void] imat3x3
    ctypedef mat[void, void, int, void] imat4x3
    ctypedef mat[void, void, int, void] imat2x4
    ctypedef mat[void, void, int, void] imat3x4
    ctypedef mat[void, void, int, void] imat4x4
    ctypedef mat[void, void, int8, void] lowp_i8mat2x2
    ctypedef mat[void, void, int8, void] lowp_i8mat2x3
    ctypedef mat[void, void, int8, void] lowp_i8mat2x4
    ctypedef mat[void, void, int8, void] lowp_i8mat3x2
    ctypedef mat[void, void, int8, void] lowp_i8mat3x3
    ctypedef mat[void, void, int8, void] lowp_i8mat3x4
    ctypedef mat[void, void, int8, void] lowp_i8mat4x2
    ctypedef mat[void, void, int8, void] lowp_i8mat4x3
    ctypedef mat[void, void, int8, void] lowp_i8mat4x4
    ctypedef mat[void, void, int8, void] mediump_i8mat2x2
    ctypedef mat[void, void, int8, void] mediump_i8mat2x3
    ctypedef mat[void, void, int8, void] mediump_i8mat2x4
    ctypedef mat[void, void, int8, void] mediump_i8mat3x2
    ctypedef mat[void, void, int8, void] mediump_i8mat3x3
    ctypedef mat[void, void, int8, void] mediump_i8mat3x4
    ctypedef mat[void, void, int8, void] mediump_i8mat4x2
    ctypedef mat[void, void, int8, void] mediump_i8mat4x3
    ctypedef mat[void, void, int8, void] mediump_i8mat4x4
    ctypedef mat[void, void, int8, void] highp_i8mat2x2
    ctypedef mat[void, void, int8, void] highp_i8mat2x3
    ctypedef mat[void, void, int8, void] highp_i8mat2x4
    ctypedef mat[void, void, int8, void] highp_i8mat3x2
    ctypedef mat[void, void, int8, void] highp_i8mat3x3
    ctypedef mat[void, void, int8, void] highp_i8mat3x4
    ctypedef mat[void, void, int8, void] highp_i8mat4x2
    ctypedef mat[void, void, int8, void] highp_i8mat4x3
    ctypedef mat[void, void, int8, void] highp_i8mat4x4
    ctypedef mat[void, void, int8, void] i8mat2x2
    ctypedef mat[void, void, int8, void] i8mat3x2
    ctypedef mat[void, void, int8, void] i8mat4x2
    ctypedef mat[void, void, int8, void] i8mat2x3
    ctypedef mat[void, void, int8, void] i8mat3x3
    ctypedef mat[void, void, int8, void] i8mat4x3
    ctypedef mat[void, void, int8, void] i8mat2x4
    ctypedef mat[void, void, int8, void] i8mat3x4
    ctypedef mat[void, void, int8, void] i8mat4x4
    ctypedef mat[void, void, int16, void] lowp_i16mat2x2
    ctypedef mat[void, void, int16, void] lowp_i16mat2x3
    ctypedef mat[void, void, int16, void] lowp_i16mat2x4
    ctypedef mat[void, void, int16, void] lowp_i16mat3x2
    ctypedef mat[void, void, int16, void] lowp_i16mat3x3
    ctypedef mat[void, void, int16, void] lowp_i16mat3x4
    ctypedef mat[void, void, int16, void] lowp_i16mat4x2
    ctypedef mat[void, void, int16, void] lowp_i16mat4x3
    ctypedef mat[void, void, int16, void] lowp_i16mat4x4
    ctypedef mat[void, void, int16, void] mediump_i16mat2x2
    ctypedef mat[void, void, int16, void] mediump_i16mat2x3
    ctypedef mat[void, void, int16, void] mediump_i16mat2x4
    ctypedef mat[void, void, int16, void] mediump_i16mat3x2
    ctypedef mat[void, void, int16, void] mediump_i16mat3x3
    ctypedef mat[void, void, int16, void] mediump_i16mat3x4
    ctypedef mat[void, void, int16, void] mediump_i16mat4x2
    ctypedef mat[void, void, int16, void] mediump_i16mat4x3
    ctypedef mat[void, void, int16, void] mediump_i16mat4x4
    ctypedef mat[void, void, int16, void] highp_i16mat2x2
    ctypedef mat[void, void, int16, void] highp_i16mat2x3
    ctypedef mat[void, void, int16, void] highp_i16mat2x4
    ctypedef mat[void, void, int16, void] highp_i16mat3x2
    ctypedef mat[void, void, int16, void] highp_i16mat3x3
    ctypedef mat[void, void, int16, void] highp_i16mat3x4
    ctypedef mat[void, void, int16, void] highp_i16mat4x2
    ctypedef mat[void, void, int16, void] highp_i16mat4x3
    ctypedef mat[void, void, int16, void] highp_i16mat4x4
    ctypedef mat[void, void, int16, void] i16mat2x2
    ctypedef mat[void, void, int16, void] i16mat3x2
    ctypedef mat[void, void, int16, void] i16mat4x2
    ctypedef mat[void, void, int16, void] i16mat2x3
    ctypedef mat[void, void, int16, void] i16mat3x3
    ctypedef mat[void, void, int16, void] i16mat4x3
    ctypedef mat[void, void, int16, void] i16mat2x4
    ctypedef mat[void, void, int16, void] i16mat3x4
    ctypedef mat[void, void, int16, void] i16mat4x4
    ctypedef mat[void, void, int32, void] lowp_i32mat2x2
    ctypedef mat[void, void, int32, void] lowp_i32mat2x3
    ctypedef mat[void, void, int32, void] lowp_i32mat2x4
    ctypedef mat[void, void, int32, void] lowp_i32mat3x2
    ctypedef mat[void, void, int32, void] lowp_i32mat3x3
    ctypedef mat[void, void, int32, void] lowp_i32mat3x4
    ctypedef mat[void, void, int32, void] lowp_i32mat4x2
    ctypedef mat[void, void, int32, void] lowp_i32mat4x3
    ctypedef mat[void, void, int32, void] lowp_i32mat4x4
    ctypedef mat[void, void, int32, void] mediump_i32mat2x2
    ctypedef mat[void, void, int32, void] mediump_i32mat2x3
    ctypedef mat[void, void, int32, void] mediump_i32mat2x4
    ctypedef mat[void, void, int32, void] mediump_i32mat3x2
    ctypedef mat[void, void, int32, void] mediump_i32mat3x3
    ctypedef mat[void, void, int32, void] mediump_i32mat3x4
    ctypedef mat[void, void, int32, void] mediump_i32mat4x2
    ctypedef mat[void, void, int32, void] mediump_i32mat4x3
    ctypedef mat[void, void, int32, void] mediump_i32mat4x4
    ctypedef mat[void, void, int32, void] highp_i32mat2x2
    ctypedef mat[void, void, int32, void] highp_i32mat2x3
    ctypedef mat[void, void, int32, void] highp_i32mat2x4
    ctypedef mat[void, void, int32, void] highp_i32mat3x2
    ctypedef mat[void, void, int32, void] highp_i32mat3x3
    ctypedef mat[void, void, int32, void] highp_i32mat3x4
    ctypedef mat[void, void, int32, void] highp_i32mat4x2
    ctypedef mat[void, void, int32, void] highp_i32mat4x3
    ctypedef mat[void, void, int32, void] highp_i32mat4x4
    ctypedef mat[void, void, int32, void] i32mat2x2
    ctypedef mat[void, void, int32, void] i32mat3x2
    ctypedef mat[void, void, int32, void] i32mat4x2
    ctypedef mat[void, void, int32, void] i32mat2x3
    ctypedef mat[void, void, int32, void] i32mat3x3
    ctypedef mat[void, void, int32, void] i32mat4x3
    ctypedef mat[void, void, int32, void] i32mat2x4
    ctypedef mat[void, void, int32, void] i32mat3x4
    ctypedef mat[void, void, int32, void] i32mat4x4
    ctypedef mat[void, void, int64, void] lowp_i64mat2x2
    ctypedef mat[void, void, int64, void] lowp_i64mat2x3
    ctypedef mat[void, void, int64, void] lowp_i64mat2x4
    ctypedef mat[void, void, int64, void] lowp_i64mat3x2
    ctypedef mat[void, void, int64, void] lowp_i64mat3x3
    ctypedef mat[void, void, int64, void] lowp_i64mat3x4
    ctypedef mat[void, void, int64, void] lowp_i64mat4x2
    ctypedef mat[void, void, int64, void] lowp_i64mat4x3
    ctypedef mat[void, void, int64, void] lowp_i64mat4x4
    ctypedef mat[void, void, int64, void] mediump_i64mat2x2
    ctypedef mat[void, void, int64, void] mediump_i64mat2x3
    ctypedef mat[void, void, int64, void] mediump_i64mat2x4
    ctypedef mat[void, void, int64, void] mediump_i64mat3x2
    ctypedef mat[void, void, int64, void] mediump_i64mat3x3
    ctypedef mat[void, void, int64, void] mediump_i64mat3x4
    ctypedef mat[void, void, int64, void] mediump_i64mat4x2
    ctypedef mat[void, void, int64, void] mediump_i64mat4x3
    ctypedef mat[void, void, int64, void] mediump_i64mat4x4
    ctypedef mat[void, void, int64, void] highp_i64mat2x2
    ctypedef mat[void, void, int64, void] highp_i64mat2x3
    ctypedef mat[void, void, int64, void] highp_i64mat2x4
    ctypedef mat[void, void, int64, void] highp_i64mat3x2
    ctypedef mat[void, void, int64, void] highp_i64mat3x3
    ctypedef mat[void, void, int64, void] highp_i64mat3x4
    ctypedef mat[void, void, int64, void] highp_i64mat4x2
    ctypedef mat[void, void, int64, void] highp_i64mat4x3
    ctypedef mat[void, void, int64, void] highp_i64mat4x4
    ctypedef mat[void, void, int64, void] i64mat2x2
    ctypedef mat[void, void, int64, void] i64mat3x2
    ctypedef mat[void, void, int64, void] i64mat4x2
    ctypedef mat[void, void, int64, void] i64mat2x3
    ctypedef mat[void, void, int64, void] i64mat3x3
    ctypedef mat[void, void, int64, void] i64mat4x3
    ctypedef mat[void, void, int64, void] i64mat2x4
    ctypedef mat[void, void, int64, void] i64mat3x4
    ctypedef mat[void, void, int64, void] i64mat4x4
    ctypedef mat[void, void, uint, void] lowp_umat2x2
    ctypedef mat[void, void, uint, void] lowp_umat2x3
    ctypedef mat[void, void, uint, void] lowp_umat2x4
    ctypedef mat[void, void, uint, void] lowp_umat3x2
    ctypedef mat[void, void, uint, void] lowp_umat3x3
    ctypedef mat[void, void, uint, void] lowp_umat3x4
    ctypedef mat[void, void, uint, void] lowp_umat4x2
    ctypedef mat[void, void, uint, void] lowp_umat4x3
    ctypedef mat[void, void, uint, void] lowp_umat4x4
    ctypedef mat[void, void, uint, void] mediump_umat2x2
    ctypedef mat[void, void, uint, void] mediump_umat2x3
    ctypedef mat[void, void, uint, void] mediump_umat2x4
    ctypedef mat[void, void, uint, void] mediump_umat3x2
    ctypedef mat[void, void, uint, void] mediump_umat3x3
    ctypedef mat[void, void, uint, void] mediump_umat3x4
    ctypedef mat[void, void, uint, void] mediump_umat4x2
    ctypedef mat[void, void, uint, void] mediump_umat4x3
    ctypedef mat[void, void, uint, void] mediump_umat4x4
    ctypedef mat[void, void, uint, void] highp_umat2x2
    ctypedef mat[void, void, uint, void] highp_umat2x3
    ctypedef mat[void, void, uint, void] highp_umat2x4
    ctypedef mat[void, void, uint, void] highp_umat3x2
    ctypedef mat[void, void, uint, void] highp_umat3x3
    ctypedef mat[void, void, uint, void] highp_umat3x4
    ctypedef mat[void, void, uint, void] highp_umat4x2
    ctypedef mat[void, void, uint, void] highp_umat4x3
    ctypedef mat[void, void, uint, void] highp_umat4x4
    ctypedef mat[void, void, uint, void] umat2x2
    ctypedef mat[void, void, uint, void] umat3x2
    ctypedef mat[void, void, uint, void] umat4x2
    ctypedef mat[void, void, uint, void] umat2x3
    ctypedef mat[void, void, uint, void] umat3x3
    ctypedef mat[void, void, uint, void] umat4x3
    ctypedef mat[void, void, uint, void] umat2x4
    ctypedef mat[void, void, uint, void] umat3x4
    ctypedef mat[void, void, uint, void] umat4x4
    ctypedef mat[void, void, uint8, void] lowp_u8mat2x2
    ctypedef mat[void, void, uint8, void] lowp_u8mat2x3
    ctypedef mat[void, void, uint8, void] lowp_u8mat2x4
    ctypedef mat[void, void, uint8, void] lowp_u8mat3x2
    ctypedef mat[void, void, uint8, void] lowp_u8mat3x3
    ctypedef mat[void, void, uint8, void] lowp_u8mat3x4
    ctypedef mat[void, void, uint8, void] lowp_u8mat4x2
    ctypedef mat[void, void, uint8, void] lowp_u8mat4x3
    ctypedef mat[void, void, uint8, void] lowp_u8mat4x4
    ctypedef mat[void, void, uint8, void] mediump_u8mat2x2
    ctypedef mat[void, void, uint8, void] mediump_u8mat2x3
    ctypedef mat[void, void, uint8, void] mediump_u8mat2x4
    ctypedef mat[void, void, uint8, void] mediump_u8mat3x2
    ctypedef mat[void, void, uint8, void] mediump_u8mat3x3
    ctypedef mat[void, void, uint8, void] mediump_u8mat3x4
    ctypedef mat[void, void, uint8, void] mediump_u8mat4x2
    ctypedef mat[void, void, uint8, void] mediump_u8mat4x3
    ctypedef mat[void, void, uint8, void] mediump_u8mat4x4
    ctypedef mat[void, void, uint8, void] highp_u8mat2x2
    ctypedef mat[void, void, uint8, void] highp_u8mat2x3
    ctypedef mat[void, void, uint8, void] highp_u8mat2x4
    ctypedef mat[void, void, uint8, void] highp_u8mat3x2
    ctypedef mat[void, void, uint8, void] highp_u8mat3x3
    ctypedef mat[void, void, uint8, void] highp_u8mat3x4
    ctypedef mat[void, void, uint8, void] highp_u8mat4x2
    ctypedef mat[void, void, uint8, void] highp_u8mat4x3
    ctypedef mat[void, void, uint8, void] highp_u8mat4x4
    ctypedef mat[void, void, uint8, void] u8mat2x2
    ctypedef mat[void, void, uint8, void] u8mat3x2
    ctypedef mat[void, void, uint8, void] u8mat4x2
    ctypedef mat[void, void, uint8, void] u8mat2x3
    ctypedef mat[void, void, uint8, void] u8mat3x3
    ctypedef mat[void, void, uint8, void] u8mat4x3
    ctypedef mat[void, void, uint8, void] u8mat2x4
    ctypedef mat[void, void, uint8, void] u8mat3x4
    ctypedef mat[void, void, uint8, void] u8mat4x4
    ctypedef mat[void, void, uint16, void] lowp_u16mat2x2
    ctypedef mat[void, void, uint16, void] lowp_u16mat2x3
    ctypedef mat[void, void, uint16, void] lowp_u16mat2x4
    ctypedef mat[void, void, uint16, void] lowp_u16mat3x2
    ctypedef mat[void, void, uint16, void] lowp_u16mat3x3
    ctypedef mat[void, void, uint16, void] lowp_u16mat3x4
    ctypedef mat[void, void, uint16, void] lowp_u16mat4x2
    ctypedef mat[void, void, uint16, void] lowp_u16mat4x3
    ctypedef mat[void, void, uint16, void] lowp_u16mat4x4
    ctypedef mat[void, void, uint16, void] mediump_u16mat2x2
    ctypedef mat[void, void, uint16, void] mediump_u16mat2x3
    ctypedef mat[void, void, uint16, void] mediump_u16mat2x4
    ctypedef mat[void, void, uint16, void] mediump_u16mat3x2
    ctypedef mat[void, void, uint16, void] mediump_u16mat3x3
    ctypedef mat[void, void, uint16, void] mediump_u16mat3x4
    ctypedef mat[void, void, uint16, void] mediump_u16mat4x2
    ctypedef mat[void, void, uint16, void] mediump_u16mat4x3
    ctypedef mat[void, void, uint16, void] mediump_u16mat4x4
    ctypedef mat[void, void, uint16, void] highp_u16mat2x2
    ctypedef mat[void, void, uint16, void] highp_u16mat2x3
    ctypedef mat[void, void, uint16, void] highp_u16mat2x4
    ctypedef mat[void, void, uint16, void] highp_u16mat3x2
    ctypedef mat[void, void, uint16, void] highp_u16mat3x3
    ctypedef mat[void, void, uint16, void] highp_u16mat3x4
    ctypedef mat[void, void, uint16, void] highp_u16mat4x2
    ctypedef mat[void, void, uint16, void] highp_u16mat4x3
    ctypedef mat[void, void, uint16, void] highp_u16mat4x4
    ctypedef mat[void, void, uint16, void] u16mat2x2
    ctypedef mat[void, void, uint16, void] u16mat3x2
    ctypedef mat[void, void, uint16, void] u16mat4x2
    ctypedef mat[void, void, uint16, void] u16mat2x3
    ctypedef mat[void, void, uint16, void] u16mat3x3
    ctypedef mat[void, void, uint16, void] u16mat4x3
    ctypedef mat[void, void, uint16, void] u16mat2x4
    ctypedef mat[void, void, uint16, void] u16mat3x4
    ctypedef mat[void, void, uint16, void] u16mat4x4
    ctypedef mat[void, void, uint32, void] lowp_u32mat2x2
    ctypedef mat[void, void, uint32, void] lowp_u32mat2x3
    ctypedef mat[void, void, uint32, void] lowp_u32mat2x4
    ctypedef mat[void, void, uint32, void] lowp_u32mat3x2
    ctypedef mat[void, void, uint32, void] lowp_u32mat3x3
    ctypedef mat[void, void, uint32, void] lowp_u32mat3x4
    ctypedef mat[void, void, uint32, void] lowp_u32mat4x2
    ctypedef mat[void, void, uint32, void] lowp_u32mat4x3
    ctypedef mat[void, void, uint32, void] lowp_u32mat4x4
    ctypedef mat[void, void, uint32, void] mediump_u32mat2x2
    ctypedef mat[void, void, uint32, void] mediump_u32mat2x3
    ctypedef mat[void, void, uint32, void] mediump_u32mat2x4
    ctypedef mat[void, void, uint32, void] mediump_u32mat3x2
    ctypedef mat[void, void, uint32, void] mediump_u32mat3x3
    ctypedef mat[void, void, uint32, void] mediump_u32mat3x4
    ctypedef mat[void, void, uint32, void] mediump_u32mat4x2
    ctypedef mat[void, void, uint32, void] mediump_u32mat4x3
    ctypedef mat[void, void, uint32, void] mediump_u32mat4x4
    ctypedef mat[void, void, uint32, void] highp_u32mat2x2
    ctypedef mat[void, void, uint32, void] highp_u32mat2x3
    ctypedef mat[void, void, uint32, void] highp_u32mat2x4
    ctypedef mat[void, void, uint32, void] highp_u32mat3x2
    ctypedef mat[void, void, uint32, void] highp_u32mat3x3
    ctypedef mat[void, void, uint32, void] highp_u32mat3x4
    ctypedef mat[void, void, uint32, void] highp_u32mat4x2
    ctypedef mat[void, void, uint32, void] highp_u32mat4x3
    ctypedef mat[void, void, uint32, void] highp_u32mat4x4
    ctypedef mat[void, void, uint32, void] u32mat2x2
    ctypedef mat[void, void, uint32, void] u32mat3x2
    ctypedef mat[void, void, uint32, void] u32mat4x2
    ctypedef mat[void, void, uint32, void] u32mat2x3
    ctypedef mat[void, void, uint32, void] u32mat3x3
    ctypedef mat[void, void, uint32, void] u32mat4x3
    ctypedef mat[void, void, uint32, void] u32mat2x4
    ctypedef mat[void, void, uint32, void] u32mat3x4
    ctypedef mat[void, void, uint32, void] u32mat4x4
    ctypedef mat[void, void, uint64, void] lowp_u64mat2x2
    ctypedef mat[void, void, uint64, void] lowp_u64mat2x3
    ctypedef mat[void, void, uint64, void] lowp_u64mat2x4
    ctypedef mat[void, void, uint64, void] lowp_u64mat3x2
    ctypedef mat[void, void, uint64, void] lowp_u64mat3x3
    ctypedef mat[void, void, uint64, void] lowp_u64mat3x4
    ctypedef mat[void, void, uint64, void] lowp_u64mat4x2
    ctypedef mat[void, void, uint64, void] lowp_u64mat4x3
    ctypedef mat[void, void, uint64, void] lowp_u64mat4x4
    ctypedef mat[void, void, uint64, void] mediump_u64mat2x2
    ctypedef mat[void, void, uint64, void] mediump_u64mat2x3
    ctypedef mat[void, void, uint64, void] mediump_u64mat2x4
    ctypedef mat[void, void, uint64, void] mediump_u64mat3x2
    ctypedef mat[void, void, uint64, void] mediump_u64mat3x3
    ctypedef mat[void, void, uint64, void] mediump_u64mat3x4
    ctypedef mat[void, void, uint64, void] mediump_u64mat4x2
    ctypedef mat[void, void, uint64, void] mediump_u64mat4x3
    ctypedef mat[void, void, uint64, void] mediump_u64mat4x4
    ctypedef mat[void, void, uint64, void] highp_u64mat2x2
    ctypedef mat[void, void, uint64, void] highp_u64mat2x3
    ctypedef mat[void, void, uint64, void] highp_u64mat2x4
    ctypedef mat[void, void, uint64, void] highp_u64mat3x2
    ctypedef mat[void, void, uint64, void] highp_u64mat3x3
    ctypedef mat[void, void, uint64, void] highp_u64mat3x4
    ctypedef mat[void, void, uint64, void] highp_u64mat4x2
    ctypedef mat[void, void, uint64, void] highp_u64mat4x3
    ctypedef mat[void, void, uint64, void] highp_u64mat4x4
    ctypedef mat[void, void, uint64, void] u64mat2x2
    ctypedef mat[void, void, uint64, void] u64mat3x2
    ctypedef mat[void, void, uint64, void] u64mat4x2
    ctypedef mat[void, void, uint64, void] u64mat2x3
    ctypedef mat[void, void, uint64, void] u64mat3x3
    ctypedef mat[void, void, uint64, void] u64mat4x3
    ctypedef mat[void, void, uint64, void] u64mat2x4
    ctypedef mat[void, void, uint64, void] u64mat3x4
    ctypedef mat[void, void, uint64, void] u64mat4x4
    ctypedef qua[float, void] lowp_quat
    ctypedef qua[float, void] mediump_quat
    ctypedef qua[float, void] highp_quat
    ctypedef qua[float, void] quat
    ctypedef qua[float, void] lowp_fquat
    ctypedef qua[float, void] mediump_fquat
    ctypedef qua[float, void] highp_fquat
    ctypedef qua[float, void] fquat
    ctypedef qua[f32, void] lowp_f32quat
    ctypedef qua[f32, void] mediump_f32quat
    ctypedef qua[f32, void] highp_f32quat
    ctypedef qua[f32, void] f32quat
    ctypedef qua[double, void] lowp_dquat
    ctypedef qua[double, void] mediump_dquat
    ctypedef qua[double, void] highp_dquat
    ctypedef qua[double, void] dquat
    ctypedef qua[f64, void] lowp_f64quat
    ctypedef qua[f64, void] mediump_f64quat
    ctypedef qua[f64, void] highp_f64quat
    ctypedef qua[f64, void] f64quat
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator~[T, Q](vec[void, T, void]&)
    bint operator==[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    bint operator!=[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    # vec[void, bint, void] operator&&[Q](vec[void, bint, void]&, vec[void, bint, void]&)
    # vec[void, bint, void] operator||[Q](vec[void, bint, void]&, vec[void, bint, void]&)
    #  void vec[2, type-parameter-0-0, Q][P, T, Q](vec[void, T, void]&)
    void vec[T, Q](T)
    void vec[T, Q](T, T)
    #  void vec[2, type-parameter-0-0, Q][U, P, T, Q](vec[void, U, void]&)
    #  void vec[2, type-parameter-0-0, Q][A, B, T, Q](A, B)
    #  void vec[2, type-parameter-0-0, Q][A, B, T, Q](vec[void, A, void]&, B)
    #  void vec[2, type-parameter-0-0, Q][A, B, T, Q](A, vec[void, B, void]&)
    #  void vec[2, type-parameter-0-0, Q][A, B, T, Q](vec[void, A, void]&, vec[void, B, void]&)
    #  void vec[2, type-parameter-0-0, Q][U, P, T, Q](vec[void, U, void]&)
    #  void vec[2, type-parameter-0-0, Q][U, P, T, Q](vec[void, U, void]&)
    #  void vec[2, type-parameter-0-0, Q][U, P, T, Q](vec[void, U, void]&)
    #  T& operator[][T, Q](length_type)
    #  const T& operator[][T, Q](length_type)
    vec[void, T, void]& operator=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator+=[U, T, Q](U)
    #  vec[void, T, void]& operator+=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator+=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator-=[U, T, Q](U)
    #  vec[void, T, void]& operator-=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator-=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator*=[U, T, Q](U)
    #  vec[void, T, void]& operator*=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator*=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator/=[U, T, Q](U)
    #  vec[void, T, void]& operator/=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator/=[U, T, Q](vec[void, U, void]&)
    vec[void, T, void]& operator++[T, Q]()
    vec[void, T, void]& operator--[T, Q]()
    vec[void, T, void] operator++[T, Q](int)
    vec[void, T, void] operator--[T, Q](int)
    #  vec[void, T, void]& operator%=[U, T, Q](U)
    #  vec[void, T, void]& operator%=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator%=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator&=[U, T, Q](U)
    #  vec[void, T, void]& operator&=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator&=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator|=[U, T, Q](U)
    #  vec[void, T, void]& operator|=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator|=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator^=[U, T, Q](U)
    #  vec[void, T, void]& operator^=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator^=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator<<=[U, T, Q](U)
    #  vec[void, T, void]& operator<<=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator<<=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator>>=[U, T, Q](U)
    #  vec[void, T, void]& operator>>=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator>>=[U, T, Q](vec[void, U, void]&)

    vec[void, T, void] operator+[T, Q](vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator~[T, Q](vec[void, T, void]&)
    bint operator==[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    bint operator!=[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    # vec[void, bint, void] operator&&[Q](vec[void, bint, void]&, vec[void, bint, void]&)
    # vec[void, bint, void] operator||[Q](vec[void, bint, void]&, vec[void, bint, void]&)
    ctypedef vec[void, bint, void] bvec2
    ctypedef vec[void, bint, void] highp_bvec2
    ctypedef vec[void, bint, void] mediump_bvec2
    ctypedef vec[void, bint, void] lowp_bvec2
    ctypedef vec[void, float, void] vec2
    ctypedef vec[void, float, void] highp_vec2
    ctypedef vec[void, float, void] mediump_vec2
    ctypedef vec[void, float, void] lowp_vec2
    ctypedef vec[void, double, void] dvec2
    ctypedef vec[void, double, void] highp_dvec2
    ctypedef vec[void, double, void] mediump_dvec2
    ctypedef vec[void, double, void] lowp_dvec2
    ctypedef vec[void, int, void] ivec2
    ctypedef glm_detail_int8 int8
    ctypedef glm_detail_int16 int16
    ctypedef glm_detail_int32 int32
    ctypedef glm_detail_int64 int64
    ctypedef vec[void, int8, void] i8vec2
    ctypedef vec[void, int16, void] i16vec2
    ctypedef vec[void, int32, void] i32vec2
    ctypedef vec[void, int64, void] i64vec2
    ctypedef vec[void, unsigned int, void] uvec2
    ctypedef glm_detail_uint8 uint8
    ctypedef glm_detail_uint16 uint16
    ctypedef glm_detail_uint32 uint32
    ctypedef glm_detail_uint64 uint64
    ctypedef vec[void, uint8, void] u8vec2
    ctypedef vec[void, uint16, void] u16vec2
    ctypedef vec[void, uint32, void] u32vec2
    ctypedef vec[void, uint64, void] u64vec2
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator~[T, Q](vec[void, T, void]&)
    bint operator==[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    bint operator!=[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    # vec[void, bint, void] operator&&[Q](vec[void, bint, void]&, vec[void, bint, void]&)
    # vec[void, bint, void] operator||[Q](vec[void, bint, void]&, vec[void, bint, void]&)
    #  void vec[3, type-parameter-0-0, Q][P, T, Q](vec[void, T, void]&)
    void vec[T, Q](T)
    void vec[T, Q](T, T, T)
    #  void vec[3, type-parameter-0-0, Q][U, P, T, Q](vec[void, U, void]&)
    #  void vec[3, type-parameter-0-0, Q][X, Y, Z, T, Q](X, Y, Z)
    #  void vec[3, type-parameter-0-0, Q][X, Y, Z, T, Q](vec[void, X, void]&, Y, Z)
    #  void vec[3, type-parameter-0-0, Q][X, Y, Z, T, Q](X, vec[void, Y, void]&, Z)
    #  void vec[3, type-parameter-0-0, Q][X, Y, Z, T, Q](vec[void, X, void]&, vec[void, Y, void]&, Z)
    #  void vec[3, type-parameter-0-0, Q][X, Y, Z, T, Q](X, Y, vec[void, Z, void]&)
    #  void vec[3, type-parameter-0-0, Q][X, Y, Z, T, Q](vec[void, X, void]&, Y, vec[void, Z, void]&)
    #  void vec[3, type-parameter-0-0, Q][X, Y, Z, T, Q](X, vec[void, Y, void]&, vec[void, Z, void]&)
    #  void vec[3, type-parameter-0-0, Q][X, Y, Z, T, Q](vec[void, X, void]&, vec[void, Y, void]&, vec[void, Z, void]&)
    #  void vec[3, type-parameter-0-0, Q][A, B, P, T, Q](vec[void, A, void]&, B)
    #  void vec[3, type-parameter-0-0, Q][A, B, P, T, Q](vec[void, A, void]&, vec[void, B, void]&)
    #  void vec[3, type-parameter-0-0, Q][A, B, P, T, Q](A, vec[void, B, void]&)
    #  void vec[3, type-parameter-0-0, Q][A, B, P, T, Q](vec[void, A, void]&, vec[void, B, void]&)
    #  void vec[3, type-parameter-0-0, Q][U, P, T, Q](vec[void, U, void]&)
    #  void vec[3, type-parameter-0-0, Q][U, P, T, Q](vec[void, U, void]&)
    #  T& operator[][T, Q](length_type)
    #  const T& operator[][T, Q](length_type)
    vec[void, T, void]& operator=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator+=[U, T, Q](U)
    #  vec[void, T, void]& operator+=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator+=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator-=[U, T, Q](U)
    #  vec[void, T, void]& operator-=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator-=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator*=[U, T, Q](U)
    #  vec[void, T, void]& operator*=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator*=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator/=[U, T, Q](U)
    #  vec[void, T, void]& operator/=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator/=[U, T, Q](vec[void, U, void]&)
    vec[void, T, void]& operator++[T, Q]()
    vec[void, T, void]& operator--[T, Q]()
    vec[void, T, void] operator++[T, Q](int)
    vec[void, T, void] operator--[T, Q](int)
    #  vec[void, T, void]& operator%=[U, T, Q](U)
    #  vec[void, T, void]& operator%=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator%=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator&=[U, T, Q](U)
    #  vec[void, T, void]& operator&=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator&=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator|=[U, T, Q](U)
    #  vec[void, T, void]& operator|=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator|=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator^=[U, T, Q](U)
    #  vec[void, T, void]& operator^=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator^=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator<<=[U, T, Q](U)
    #  vec[void, T, void]& operator<<=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator<<=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator>>=[U, T, Q](U)
    #  vec[void, T, void]& operator>>=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator>>=[U, T, Q](vec[void, U, void]&)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator~[T, Q](vec[void, T, void]&)
    bint operator==[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    bint operator!=[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    # vec[void, bint, void] operator&&[Q](vec[void, bint, void]&, vec[void, bint, void]&)
    # vec[void, bint, void] operator||[Q](vec[void, bint, void]&, vec[void, bint, void]&)
    ctypedef vec[void, bint, void] bvec3
    ctypedef vec[void, bint, void] highp_bvec3
    ctypedef vec[void, bint, void] mediump_bvec3
    ctypedef vec[void, bint, void] lowp_bvec3
    ctypedef vec[void, float, void] vec3
    ctypedef vec[void, float, void] highp_vec3
    ctypedef vec[void, float, void] mediump_vec3
    ctypedef vec[void, float, void] lowp_vec3
    ctypedef vec[void, double, void] dvec3
    ctypedef vec[void, double, void] highp_dvec3
    ctypedef vec[void, double, void] mediump_dvec3
    ctypedef vec[void, double, void] lowp_dvec3
    ctypedef vec[void, int, void] ivec3
    ctypedef vec[void, int8, void] i8vec3
    ctypedef vec[void, int16, void] i16vec3
    ctypedef vec[void, int32, void] i32vec3
    ctypedef vec[void, int64, void] i64vec3
    ctypedef vec[void, unsigned int, void] uvec3
    ctypedef vec[void, uint8, void] u8vec3
    ctypedef vec[void, uint16, void] u16vec3
    ctypedef vec[void, uint32, void] u32vec3
    ctypedef vec[void, uint64, void] u64vec3
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, const T&)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, const T&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, const T&)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, const T&)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator~[T, Q](vec[void, T, void]&)
    bint operator==[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    bint operator!=[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    # vec[void, bint, void] operator&&[Q](vec[void, bint, void]&, vec[void, bint, void]&)
    # vec[void, bint, void] operator||[Q](vec[void, bint, void]&, vec[void, bint, void]&)
    #  void vec[4, type-parameter-0-0, Q][P, T, Q](vec[void, T, void]&)
    void vec[T, Q](T)
    void vec[T, Q](T, T, T, T)
    #  void vec[4, type-parameter-0-0, Q][U, P, T, Q](vec[void, U, void]&)
    #  void vec[4, type-parameter-0-0, Q][X, Y, Z, W, T, Q](X, Y, Z, W)
    #  void vec[4, type-parameter-0-0, Q][X, Y, Z, W, T, Q](vec[void, X, void]&, Y, Z, W)
    #  void vec[4, type-parameter-0-0, Q][X, Y, Z, W, T, Q](X, vec[void, Y, void]&, Z, W)
    #  void vec[4, type-parameter-0-0, Q][X, Y, Z, W, T, Q](vec[void, X, void]&, vec[void, Y, void]&, Z, W)
    #  void vec[4, type-parameter-0-0, Q][X, Y, Z, W, T, Q](X, Y, vec[void, Z, void]&, W)
    #  void vec[4, type-parameter-0-0, Q][X, Y, Z, W, T, Q](vec[void, X, void]&, Y, vec[void, Z, void]&, W)
    #  void vec[4, type-parameter-0-0, Q][X, Y, Z, W, T, Q](X, vec[void, Y, void]&, vec[void, Z, void]&, W)
    #  void vec[4, type-parameter-0-0, Q][X, Y, Z, W, T, Q](vec[void, X, void]&, vec[void, Y, void]&, vec[void, Z, void]&, W)
    #  void vec[4, type-parameter-0-0, Q][X, Y, Z, W, T, Q](vec[void, X, void]&, Y, Z, vec[void, W, void]&)
    #  void vec[4, type-parameter-0-0, Q][X, Y, Z, W, T, Q](X, vec[void, Y, void]&, Z, vec[void, W, void]&)
    #  void vec[4, type-parameter-0-0, Q][X, Y, Z, W, T, Q](vec[void, X, void]&, vec[void, Y, void]&, Z, vec[void, W, void]&)
    #  void vec[4, type-parameter-0-0, Q][X, Y, Z, W, T, Q](X, Y, vec[void, Z, void]&, vec[void, W, void]&)
    #  void vec[4, type-parameter-0-0, Q][X, Y, Z, W, T, Q](vec[void, X, void]&, Y, vec[void, Z, void]&, vec[void, W, void]&)
    #  void vec[4, type-parameter-0-0, Q][X, Y, Z, W, T, Q](X, vec[void, Y, void]&, vec[void, Z, void]&, vec[void, W, void]&)
    #  void vec[4, type-parameter-0-0, Q][X, Y, Z, W, T, Q](vec[void, X, void]&, vec[void, Y, void]&, vec[void, Z, void]&, vec[void, W, void]&)
    #  void vec[4, type-parameter-0-0, Q][A, B, C, P, T, Q](vec[void, A, void]&, B, C)
    #  void vec[4, type-parameter-0-0, Q][A, B, C, P, T, Q](vec[void, A, void]&, vec[void, B, void]&, C)
    #  void vec[4, type-parameter-0-0, Q][A, B, C, P, T, Q](vec[void, A, void]&, B, vec[void, C, void]&)
    #  void vec[4, type-parameter-0-0, Q][A, B, C, P, T, Q](vec[void, A, void]&, vec[void, B, void]&, vec[void, C, void]&)
    #  void vec[4, type-parameter-0-0, Q][A, B, C, P, T, Q](A, vec[void, B, void]&, C)
    #  void vec[4, type-parameter-0-0, Q][A, B, C, P, T, Q](vec[void, A, void]&, vec[void, B, void]&, C)
    #  void vec[4, type-parameter-0-0, Q][A, B, C, P, T, Q](A, vec[void, B, void]&, vec[void, C, void]&)
    #  void vec[4, type-parameter-0-0, Q][A, B, C, P, T, Q](vec[void, A, void]&, vec[void, B, void]&, vec[void, C, void]&)
    #  void vec[4, type-parameter-0-0, Q][A, B, C, P, T, Q](A, B, vec[void, C, void]&)
    #  void vec[4, type-parameter-0-0, Q][A, B, C, P, T, Q](vec[void, A, void]&, B, vec[void, C, void]&)
    #  void vec[4, type-parameter-0-0, Q][A, B, C, P, T, Q](A, vec[void, B, void]&, vec[void, C, void]&)
    #  void vec[4, type-parameter-0-0, Q][A, B, C, P, T, Q](vec[void, A, void]&, vec[void, B, void]&, vec[void, C, void]&)
    #  void vec[4, type-parameter-0-0, Q][A, B, P, T, Q](vec[void, A, void]&, B)
    #  void vec[4, type-parameter-0-0, Q][A, B, P, T, Q](vec[void, A, void]&, vec[void, B, void]&)
    #  void vec[4, type-parameter-0-0, Q][A, B, P, T, Q](A, vec[void, B, void]&)
    #  void vec[4, type-parameter-0-0, Q][A, B, P, T, Q](vec[void, A, void]&, vec[void, B, void]&)
    #  void vec[4, type-parameter-0-0, Q][A, B, P, T, Q](vec[void, A, void]&, vec[void, B, void]&)
    #  void vec[4, type-parameter-0-0, Q][U, P, T, Q](vec[void, U, void]&)
    #  T& operator[][T, Q](length_type)
    #  const T& operator[][T, Q](length_type)
    vec[void, T, void]& operator=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator+=[U, T, Q](U)
    #  vec[void, T, void]& operator+=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator+=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator-=[U, T, Q](U)
    #  vec[void, T, void]& operator-=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator-=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator*=[U, T, Q](U)
    #  vec[void, T, void]& operator*=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator*=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator/=[U, T, Q](U)
    #  vec[void, T, void]& operator/=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator/=[U, T, Q](vec[void, U, void]&)
    vec[void, T, void]& operator++[T, Q]()
    vec[void, T, void]& operator--[T, Q]()
    vec[void, T, void] operator++[T, Q](int)
    vec[void, T, void] operator--[T, Q](int)
    #  vec[void, T, void]& operator%=[U, T, Q](U)
    #  vec[void, T, void]& operator%=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator%=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator&=[U, T, Q](U)
    #  vec[void, T, void]& operator&=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator&=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator|=[U, T, Q](U)
    #  vec[void, T, void]& operator|=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator|=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator^=[U, T, Q](U)
    #  vec[void, T, void]& operator^=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator^=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator<<=[U, T, Q](U)
    #  vec[void, T, void]& operator<<=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator<<=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator>>=[U, T, Q](U)
    #  vec[void, T, void]& operator>>=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator>>=[U, T, Q](vec[void, U, void]&)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, const T&)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, const T&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, const T&)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, const T&)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator~[T, Q](vec[void, T, void]&)
    bint operator==[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    bint operator!=[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    # vec[void, bint, void] operator&&[Q](vec[void, bint, void]&, vec[void, bint, void]&)
    # vec[void, bint, void] operator||[Q](vec[void, bint, void]&, vec[void, bint, void]&)
    ctypedef vec[void, bint, void] bvec4
    ctypedef vec[void, bint, void] highp_bvec4
    ctypedef vec[void, bint, void] mediump_bvec4
    ctypedef vec[void, bint, void] lowp_bvec4
    ctypedef vec[void, float, void] vec4
    ctypedef vec[void, float, void] highp_vec4
    ctypedef vec[void, float, void] mediump_vec4
    ctypedef vec[void, float, void] lowp_vec4
    ctypedef vec[void, double, void] dvec4
    ctypedef vec[void, double, void] highp_dvec4
    ctypedef vec[void, double, void] mediump_dvec4
    ctypedef vec[void, double, void] lowp_dvec4
    ctypedef vec[void, int, void] ivec4
    ctypedef vec[void, int8, void] i8vec4
    ctypedef vec[void, int16, void] i16vec4
    ctypedef vec[void, int32, void] i32vec4
    ctypedef vec[void, int64, void] i64vec4
    ctypedef vec[void, unsigned int, void] uvec4
    ctypedef vec[void, uint8, void] u8vec4
    ctypedef vec[void, uint16, void] u16vec4
    ctypedef vec[void, uint32, void] u32vec4
    ctypedef vec[void, uint64, void] u64vec4
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator+[T, Q](T, mat[void, void, T, void]&)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator-[T, Q](T, mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator*[T, Q](T, mat[void, void, T, void]&)
    #  mat[2, 2, T, Q].col_type operator*[T, Q](mat[void, void, T, void]&, const mat[2, 2, T, Q].row_type&)
    #  mat[2, 2, T, Q].row_type operator*[T, Q](const mat[2, 2, T, Q].col_type&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator/[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator/[T, Q](T, mat[void, void, T, void]&)
    #  mat[2, 2, T, Q].col_type operator/[T, Q](mat[void, void, T, void]&, const mat[2, 2, T, Q].row_type&)
    #  mat[2, 2, T, Q].row_type operator/[T, Q](const mat[2, 2, T, Q].col_type&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator/[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    bint operator==[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    bint operator!=[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator*[T, Q](T, mat[void, void, T, void]&)
    #  mat[2, 3, T, Q].col_type operator*[T, Q](mat[void, void, T, void]&, const mat[2, 3, T, Q].row_type&)
    #  mat[2, 3, T, Q].row_type operator*[T, Q](const mat[2, 3, T, Q].col_type&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator/[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator/[T, Q](T, mat[void, void, T, void]&)
    bint operator==[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    bint operator!=[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    #  void mat[2, 3, type-parameter-0-0, Q][P, T, Q](mat[void, void, T, void]&)
    void mat[T, Q](T)
    void mat[T, Q](T, T, T, T, T, T)
    void mat[T, Q](col_type&, col_type&)
    #  void mat[2, 3, type-parameter-0-0, Q][X1, Y1, Z1, X2, Y2, Z2, T, Q](X1, Y1, Z1, X2, Y2, Z2)
    #  void mat[2, 3, type-parameter-0-0, Q][V1, V2, T, Q](vec[void, V1, void]&, vec[void, V2, void]&)
    #  void mat[2, 3, type-parameter-0-0, Q][U, P, T, Q](mat[void, void, U, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    #  col_type& operator[][T, Q](length_type)
    #  col_type& operator[][T, Q](length_type)
    mat[void, void, T, void]& operator=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator+=[U, T, Q](U)
    #  mat[void, void, T, void]& operator+=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator-=[U, T, Q](U)
    #  mat[void, void, T, void]& operator-=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator*=[U, T, Q](U)
    #  mat[void, void, T, void]& operator/=[U, T, Q](U)
    mat[void, void, T, void]& operator++[T, Q]()
    mat[void, void, T, void]& operator--[T, Q]()
    mat[void, void, T, void] operator++[T, Q](int)
    mat[void, void, T, void] operator--[T, Q](int)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator*[T, Q](T, mat[void, void, T, void]&)
    #  mat[2, 3, T, Q].col_type operator*[T, Q](mat[void, void, T, void]&, const mat[2, 3, T, Q].row_type&)
    #  mat[2, 3, T, Q].row_type operator*[T, Q](const mat[2, 3, T, Q].col_type&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator/[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator/[T, Q](T, mat[void, void, T, void]&)
    bint operator==[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    bint operator!=[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    ctypedef mat[void, void, double, void] dmat2x3
    ctypedef mat[void, void, double, void] lowp_dmat2x3
    ctypedef mat[void, void, double, void] mediump_dmat2x3
    ctypedef mat[void, void, double, void] highp_dmat2x3
    ctypedef mat[void, void, float, void] mat2x3
    ctypedef mat[void, void, float, void] lowp_mat2x3
    ctypedef mat[void, void, float, void] mediump_mat2x3
    ctypedef mat[void, void, float, void] highp_mat2x3
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator*[T, Q](T, mat[void, void, T, void]&)
    #  mat[2, 4, T, Q].col_type operator*[T, Q](mat[void, void, T, void]&, const mat[2, 4, T, Q].row_type&)
    #  mat[2, 4, T, Q].row_type operator*[T, Q](const mat[2, 4, T, Q].col_type&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator/[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator/[T, Q](T, mat[void, void, T, void]&)
    bint operator==[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    bint operator!=[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    #  void mat[2, 4, type-parameter-0-0, Q][P, T, Q](mat[void, void, T, void]&)
    void mat[T, Q](T)
    void mat[T, Q](T, T, T, T, T, T, T, T)
    void mat[T, Q](col_type&, col_type&)
    #  void mat[2, 4, type-parameter-0-0, Q][X1, Y1, Z1, W1, X2, Y2, Z2, W2, T, Q](X1, Y1, Z1, W1, X2, Y2, Z2, W2)
    #  void mat[2, 4, type-parameter-0-0, Q][V1, V2, T, Q](vec[void, V1, void]&, vec[void, V2, void]&)
    #  void mat[2, 4, type-parameter-0-0, Q][U, P, T, Q](mat[void, void, U, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    #  col_type& operator[][T, Q](length_type)
    #  col_type& operator[][T, Q](length_type)
    mat[void, void, T, void]& operator=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator+=[U, T, Q](U)
    #  mat[void, void, T, void]& operator+=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator-=[U, T, Q](U)
    #  mat[void, void, T, void]& operator-=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator*=[U, T, Q](U)
    #  mat[void, void, T, void]& operator/=[U, T, Q](U)
    mat[void, void, T, void]& operator++[T, Q]()
    mat[void, void, T, void]& operator--[T, Q]()
    mat[void, void, T, void] operator++[T, Q](int)
    mat[void, void, T, void] operator--[T, Q](int)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator*[T, Q](T, mat[void, void, T, void]&)
    #  mat[2, 4, T, Q].col_type operator*[T, Q](mat[void, void, T, void]&, const mat[2, 4, T, Q].row_type&)
    #  mat[2, 4, T, Q].row_type operator*[T, Q](const mat[2, 4, T, Q].col_type&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator/[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator/[T, Q](T, mat[void, void, T, void]&)
    bint operator==[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    bint operator!=[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    ctypedef mat[void, void, double, void] dmat2x4
    ctypedef mat[void, void, double, void] lowp_dmat2x4
    ctypedef mat[void, void, double, void] mediump_dmat2x4
    ctypedef mat[void, void, double, void] highp_dmat2x4
    ctypedef mat[void, void, float, void] mat2x4
    ctypedef mat[void, void, float, void] lowp_mat2x4
    ctypedef mat[void, void, float, void] mediump_mat2x4
    ctypedef mat[void, void, float, void] highp_mat2x4
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator*[T, Q](T, mat[void, void, T, void]&)
    #  mat[3, 2, T, Q].col_type operator*[T, Q](mat[void, void, T, void]&, const mat[3, 2, T, Q].row_type&)
    #  mat[3, 2, T, Q].row_type operator*[T, Q](const mat[3, 2, T, Q].col_type&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator/[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator/[T, Q](T, mat[void, void, T, void]&)
    bint operator==[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    bint operator!=[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    #  void mat[3, 2, type-parameter-0-0, Q][P, T, Q](mat[void, void, T, void]&)
    void mat[T, Q](T)
    void mat[T, Q](T, T, T, T, T, T)
    void mat[T, Q](col_type&, col_type&, col_type&)
    #  void mat[3, 2, type-parameter-0-0, Q][X0, Y0, X1, Y1, X2, Y2, T, Q](X0, Y0, X1, Y1, X2, Y2)
    #  void mat[3, 2, type-parameter-0-0, Q][V0, V1, V2, T, Q](vec[void, V0, void]&, vec[void, V1, void]&, vec[void, V2, void]&)
    #  void mat[3, 2, type-parameter-0-0, Q][U, P, T, Q](mat[void, void, U, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    #  col_type& operator[][T, Q](length_type)
    #  col_type& operator[][T, Q](length_type)
    mat[void, void, T, void]& operator=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator+=[U, T, Q](U)
    #  mat[void, void, T, void]& operator+=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator-=[U, T, Q](U)
    #  mat[void, void, T, void]& operator-=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator*=[U, T, Q](U)
    #  mat[void, void, T, void]& operator/=[U, T, Q](U)
    mat[void, void, T, void]& operator++[T, Q]()
    mat[void, void, T, void]& operator--[T, Q]()
    mat[void, void, T, void] operator++[T, Q](int)
    mat[void, void, T, void] operator--[T, Q](int)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator*[T, Q](T, mat[void, void, T, void]&)
    #  mat[3, 2, T, Q].col_type operator*[T, Q](mat[void, void, T, void]&, const mat[3, 2, T, Q].row_type&)
    #  mat[3, 2, T, Q].row_type operator*[T, Q](const mat[3, 2, T, Q].col_type&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator/[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator/[T, Q](T, mat[void, void, T, void]&)
    bint operator==[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    bint operator!=[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    ctypedef mat[void, void, double, void] dmat3x2
    ctypedef mat[void, void, double, void] lowp_dmat3x2
    ctypedef mat[void, void, double, void] mediump_dmat3x2
    ctypedef mat[void, void, double, void] highp_dmat3x2
    ctypedef mat[void, void, float, void] mat3x2
    ctypedef mat[void, void, float, void] lowp_mat3x2
    ctypedef mat[void, void, float, void] mediump_mat3x2
    ctypedef mat[void, void, float, void] highp_mat3x2
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator+[T, Q](T, mat[void, void, T, void]&)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator-[T, Q](T, mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator*[T, Q](T, mat[void, void, T, void]&)
    #  mat[3, 3, T, Q].col_type operator*[T, Q](mat[void, void, T, void]&, const mat[3, 3, T, Q].row_type&)
    #  mat[3, 3, T, Q].row_type operator*[T, Q](const mat[3, 3, T, Q].col_type&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator/[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator/[T, Q](T, mat[void, void, T, void]&)
    #  mat[3, 3, T, Q].col_type operator/[T, Q](mat[void, void, T, void]&, const mat[3, 3, T, Q].row_type&)
    #  mat[3, 3, T, Q].row_type operator/[T, Q](const mat[3, 3, T, Q].col_type&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator/[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    bint operator==[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    bint operator!=[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    #  void mat[3, 3, type-parameter-0-0, Q][P, T, Q](mat[void, void, T, void]&)
    void mat[T, Q](T)
    void mat[T, Q](T, T, T, T, T, T, T, T, T)
    void mat[T, Q](col_type&, col_type&, col_type&)
    #  void mat[3, 3, type-parameter-0-0, Q][X1, Y1, Z1, X2, Y2, Z2, X3, Y3, Z3, T, Q](X1, Y1, Z1, X2, Y2, Z2, X3, Y3, Z3)
    #  void mat[3, 3, type-parameter-0-0, Q][V1, V2, V3, T, Q](vec[void, V1, void]&, vec[void, V2, void]&, vec[void, V3, void]&)
    #  void mat[3, 3, type-parameter-0-0, Q][U, P, T, Q](mat[void, void, U, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    #  col_type& operator[][T, Q](length_type)
    #  col_type& operator[][T, Q](length_type)
    mat[void, void, T, void]& operator=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator+=[U, T, Q](U)
    #  mat[void, void, T, void]& operator+=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator-=[U, T, Q](U)
    #  mat[void, void, T, void]& operator-=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator*=[U, T, Q](U)
    #  mat[void, void, T, void]& operator*=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator/=[U, T, Q](U)
    #  mat[void, void, T, void]& operator/=[U, T, Q](mat[void, void, U, void]&)
    mat[void, void, T, void]& operator++[T, Q]()
    mat[void, void, T, void]& operator--[T, Q]()
    mat[void, void, T, void] operator++[T, Q](int)
    mat[void, void, T, void] operator--[T, Q](int)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator+[T, Q](T, mat[void, void, T, void]&)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator-[T, Q](T, mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator*[T, Q](T, mat[void, void, T, void]&)
    #  mat[3, 3, T, Q].col_type operator*[T, Q](mat[void, void, T, void]&, const mat[3, 3, T, Q].row_type&)
    #  mat[3, 3, T, Q].row_type operator*[T, Q](const mat[3, 3, T, Q].col_type&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator/[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator/[T, Q](T, mat[void, void, T, void]&)
    #  mat[3, 3, T, Q].col_type operator/[T, Q](mat[void, void, T, void]&, const mat[3, 3, T, Q].row_type&)
    #  mat[3, 3, T, Q].row_type operator/[T, Q](const mat[3, 3, T, Q].col_type&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator/[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    bint operator==[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    bint operator!=[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    ctypedef mat[void, void, double, void] dmat3x3
    ctypedef mat[void, void, double, void] dmat3
    ctypedef mat[void, void, double, void] lowp_dmat3
    ctypedef mat[void, void, double, void] mediump_dmat3
    ctypedef mat[void, void, double, void] highp_dmat3
    ctypedef mat[void, void, double, void] lowp_dmat3x3
    ctypedef mat[void, void, double, void] mediump_dmat3x3
    ctypedef mat[void, void, double, void] highp_dmat3x3
    ctypedef mat[void, void, float, void] mat3x3
    ctypedef mat[void, void, float, void] mat3
    ctypedef mat[void, void, float, void] lowp_mat3
    ctypedef mat[void, void, float, void] mediump_mat3
    ctypedef mat[void, void, float, void] highp_mat3
    ctypedef mat[void, void, float, void] lowp_mat3x3
    ctypedef mat[void, void, float, void] mediump_mat3x3
    ctypedef mat[void, void, float, void] highp_mat3x3
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator*[T, Q](T, mat[void, void, T, void]&)
    #  mat[3, 4, T, Q].col_type operator*[T, Q](mat[void, void, T, void]&, const mat[3, 4, T, Q].row_type&)
    #  mat[3, 4, T, Q].row_type operator*[T, Q](const mat[3, 4, T, Q].col_type&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator/[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator/[T, Q](T, mat[void, void, T, void]&)
    bint operator==[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    bint operator!=[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    #  void mat[3, 4, type-parameter-0-0, Q][P, T, Q](mat[void, void, T, void]&)
    void mat[T, Q](T)
    void mat[T, Q](T, T, T, T, T, T, T, T, T, T, T, T)
    void mat[T, Q](col_type&, col_type&, col_type&)
    #  void mat[3, 4, type-parameter-0-0, Q][X0, Y0, Z0, W0, X1, Y1, Z1, W1, X2, Y2, Z2, W2, T, Q](X0, Y0, Z0, W0, X1, Y1, Z1, W1, X2, Y2, Z2, W2)
    #  void mat[3, 4, type-parameter-0-0, Q][V1, V2, V3, T, Q](vec[void, V1, void]&, vec[void, V2, void]&, vec[void, V3, void]&)
    #  void mat[3, 4, type-parameter-0-0, Q][U, P, T, Q](mat[void, void, U, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    #  col_type& operator[][T, Q](length_type)
    #  col_type& operator[][T, Q](length_type)
    mat[void, void, T, void]& operator=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator+=[U, T, Q](U)
    #  mat[void, void, T, void]& operator+=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator-=[U, T, Q](U)
    #  mat[void, void, T, void]& operator-=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator*=[U, T, Q](U)
    #  mat[void, void, T, void]& operator/=[U, T, Q](U)
    mat[void, void, T, void]& operator++[T, Q]()
    mat[void, void, T, void]& operator--[T, Q]()
    mat[void, void, T, void] operator++[T, Q](int)
    mat[void, void, T, void] operator--[T, Q](int)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator*[T, Q](T, mat[void, void, T, void]&)
    #  mat[3, 4, T, Q].col_type operator*[T, Q](mat[void, void, T, void]&, const mat[3, 4, T, Q].row_type&)
    #  mat[3, 4, T, Q].row_type operator*[T, Q](const mat[3, 4, T, Q].col_type&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator/[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator/[T, Q](T, mat[void, void, T, void]&)
    bint operator==[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    bint operator!=[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    ctypedef mat[void, void, double, void] dmat3x4
    ctypedef mat[void, void, double, void] lowp_dmat3x4
    ctypedef mat[void, void, double, void] mediump_dmat3x4
    ctypedef mat[void, void, double, void] highp_dmat3x4
    ctypedef mat[void, void, float, void] mat3x4
    ctypedef mat[void, void, float, void] lowp_mat3x4
    ctypedef mat[void, void, float, void] mediump_mat3x4
    ctypedef mat[void, void, float, void] highp_mat3x4
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator*[T, Q](T, mat[void, void, T, void]&)
    #  mat[4, 2, T, Q].col_type operator*[T, Q](mat[void, void, T, void]&, const mat[4, 2, T, Q].row_type&)
    #  mat[4, 2, T, Q].row_type operator*[T, Q](const mat[4, 2, T, Q].col_type&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator/[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator/[T, Q](T, mat[void, void, T, void]&)
    bint operator==[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    bint operator!=[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    #  void mat[4, 2, type-parameter-0-0, Q][P, T, Q](mat[void, void, T, void]&)
    void mat[T, Q](T)
    void mat[T, Q](T, T, T, T, T, T, T, T)
    void mat[T, Q](col_type&, col_type&, col_type&, col_type&)
    #  void mat[4, 2, type-parameter-0-0, Q][X0, Y0, X1, Y1, X2, Y2, X3, Y3, T, Q](X0, Y0, X1, Y1, X2, Y2, X3, Y3)
    #  void mat[4, 2, type-parameter-0-0, Q][V0, V1, V2, V3, T, Q](vec[void, V0, void]&, vec[void, V1, void]&, vec[void, V2, void]&, vec[void, V3, void]&)
    #  void mat[4, 2, type-parameter-0-0, Q][U, P, T, Q](mat[void, void, U, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    #  col_type& operator[][T, Q](length_type)
    #  col_type& operator[][T, Q](length_type)
    mat[void, void, T, void]& operator=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator+=[U, T, Q](U)
    #  mat[void, void, T, void]& operator+=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator-=[U, T, Q](U)
    #  mat[void, void, T, void]& operator-=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator*=[U, T, Q](U)
    #  mat[void, void, T, void]& operator/=[U, T, Q](U)
    mat[void, void, T, void]& operator++[T, Q]()
    mat[void, void, T, void]& operator--[T, Q]()
    mat[void, void, T, void] operator++[T, Q](int)
    mat[void, void, T, void] operator--[T, Q](int)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator*[T, Q](T, mat[void, void, T, void]&)
    #  mat[4, 2, T, Q].col_type operator*[T, Q](mat[void, void, T, void]&, const mat[4, 2, T, Q].row_type&)
    #  mat[4, 2, T, Q].row_type operator*[T, Q](const mat[4, 2, T, Q].col_type&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator/[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator/[T, Q](T, mat[void, void, T, void]&)
    bint operator==[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    bint operator!=[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    ctypedef mat[void, void, double, void] dmat4x2
    ctypedef mat[void, void, double, void] lowp_dmat4x2
    ctypedef mat[void, void, double, void] mediump_dmat4x2
    ctypedef mat[void, void, double, void] highp_dmat4x2
    ctypedef mat[void, void, float, void] mat4x2
    ctypedef mat[void, void, float, void] lowp_mat4x2
    ctypedef mat[void, void, float, void] mediump_mat4x2
    ctypedef mat[void, void, float, void] highp_mat4x2
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, const T&)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, const T&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, const T&)
    mat[void, void, T, void] operator*[T, Q](const T&, mat[void, void, T, void]&)
    #  mat[4, 3, T, Q].col_type operator*[T, Q](mat[void, void, T, void]&, const mat[4, 3, T, Q].row_type&)
    #  mat[4, 3, T, Q].row_type operator*[T, Q](const mat[4, 3, T, Q].col_type&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator/[T, Q](mat[void, void, T, void]&, const T&)
    mat[void, void, T, void] operator/[T, Q](const T&, mat[void, void, T, void]&)
    bint operator==[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    bint operator!=[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    #  void mat[4, 3, type-parameter-0-0, Q][P, T, Q](mat[void, void, T, void]&)
    void mat[T, Q](const T&)
    void mat[T, Q](const T&, const T&, const T&, const T&, const T&, const T&, const T&, const T&, const T&, const T&, const T&, const T&)
    void mat[T, Q](col_type&, col_type&, col_type&, col_type&)
    #  void mat[4, 3, type-parameter-0-0, Q][X0, Y0, Z0, X1, Y1, Z1, X2, Y2, Z2, X3, Y3, Z3, T, Q](const X0&, const Y0&, const Z0&, const X1&, const Y1&, const Z1&, const X2&, const Y2&, const Z2&, const X3&, const Y3&, const Z3&)
    #  void mat[4, 3, type-parameter-0-0, Q][V1, V2, V3, V4, T, Q](vec[void, V1, void]&, vec[void, V2, void]&, vec[void, V3, void]&, vec[void, V4, void]&)
    #  void mat[4, 3, type-parameter-0-0, Q][U, P, T, Q](mat[void, void, U, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    #  col_type& operator[][T, Q](length_type)
    #  col_type& operator[][T, Q](length_type)
    mat[void, void, T, void]& operator=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator+=[U, T, Q](U)
    #  mat[void, void, T, void]& operator+=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator-=[U, T, Q](U)
    #  mat[void, void, T, void]& operator-=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator*=[U, T, Q](U)
    #  mat[void, void, T, void]& operator/=[U, T, Q](U)
    mat[void, void, T, void]& operator++[T, Q]()
    mat[void, void, T, void]& operator--[T, Q]()
    mat[void, void, T, void] operator++[T, Q](int)
    mat[void, void, T, void] operator--[T, Q](int)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, const T&)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, const T&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, const T&)
    mat[void, void, T, void] operator*[T, Q](const T&, mat[void, void, T, void]&)
    #  mat[4, 3, T, Q].col_type operator*[T, Q](mat[void, void, T, void]&, const mat[4, 3, T, Q].row_type&)
    #  mat[4, 3, T, Q].row_type operator*[T, Q](const mat[4, 3, T, Q].col_type&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator/[T, Q](mat[void, void, T, void]&, const T&)
    mat[void, void, T, void] operator/[T, Q](const T&, mat[void, void, T, void]&)
    bint operator==[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    bint operator!=[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    ctypedef mat[void, void, double, void] dmat4x3
    ctypedef mat[void, void, double, void] lowp_dmat4x3
    ctypedef mat[void, void, double, void] mediump_dmat4x3
    ctypedef mat[void, void, double, void] highp_dmat4x3
    ctypedef mat[void, void, float, void] mat4x3
    ctypedef mat[void, void, float, void] lowp_mat4x3
    ctypedef mat[void, void, float, void] mediump_mat4x3
    ctypedef mat[void, void, float, void] highp_mat4x3
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, const T&)
    mat[void, void, T, void] operator+[T, Q](const T&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, const T&)
    mat[void, void, T, void] operator-[T, Q](const T&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, const T&)
    mat[void, void, T, void] operator*[T, Q](const T&, mat[void, void, T, void]&)
    #  mat[4, 4, T, Q].col_type operator*[T, Q](mat[void, void, T, void]&, const mat[4, 4, T, Q].row_type&)
    #  mat[4, 4, T, Q].row_type operator*[T, Q](const mat[4, 4, T, Q].col_type&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator/[T, Q](mat[void, void, T, void]&, const T&)
    mat[void, void, T, void] operator/[T, Q](const T&, mat[void, void, T, void]&)
    #  mat[4, 4, T, Q].col_type operator/[T, Q](mat[void, void, T, void]&, const mat[4, 4, T, Q].row_type&)
    #  mat[4, 4, T, Q].row_type operator/[T, Q](const mat[4, 4, T, Q].col_type&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator/[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    bint operator==[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    bint operator!=[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    #  void mat[4, 4, type-parameter-0-0, Q][P, T, Q](mat[void, void, T, void]&)
    void mat[T, Q](const T&)
    void mat[T, Q](const T&, const T&, const T&, const T&, const T&, const T&, const T&, const T&, const T&, const T&, const T&, const T&, const T&, const T&, const T&, const T&)
    void mat[T, Q](col_type&, col_type&, col_type&, col_type&)
    #  void mat[4, 4, type-parameter-0-0, Q][U, P, T, Q](mat[void, void, U, void]&)
    #  void mat[4, 4, type-parameter-0-0, Q][X1, Y1, Z1, W1, X2, Y2, Z2, W2, X3, Y3, Z3, W3, X4, Y4, Z4, W4, T, Q](const X1&, const Y1&, const Z1&, const W1&, const X2&, const Y2&, const Z2&, const W2&, const X3&, const Y3&, const Z3&, const W3&, const X4&, const Y4&, const Z4&, const W4&)
    #  void mat[4, 4, type-parameter-0-0, Q][V1, V2, V3, V4, T, Q](vec[void, V1, void]&, vec[void, V2, void]&, vec[void, V3, void]&, vec[void, V4, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    #  col_type& operator[][T, Q](length_type)
    #  col_type& operator[][T, Q](length_type)
    mat[void, void, T, void]& operator=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator+=[U, T, Q](U)
    #  mat[void, void, T, void]& operator+=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator-=[U, T, Q](U)
    #  mat[void, void, T, void]& operator-=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator*=[U, T, Q](U)
    #  mat[void, void, T, void]& operator*=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator/=[U, T, Q](U)
    #  mat[void, void, T, void]& operator/=[U, T, Q](mat[void, void, U, void]&)
    mat[void, void, T, void]& operator++[T, Q]()
    mat[void, void, T, void]& operator--[T, Q]()
    mat[void, void, T, void] operator++[T, Q](int)
    mat[void, void, T, void] operator--[T, Q](int)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, const T&)
    mat[void, void, T, void] operator+[T, Q](const T&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, const T&)
    mat[void, void, T, void] operator-[T, Q](const T&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, const T&)
    mat[void, void, T, void] operator*[T, Q](const T&, mat[void, void, T, void]&)
    #  mat[4, 4, T, Q].col_type operator*[T, Q](mat[void, void, T, void]&, const mat[4, 4, T, Q].row_type&)
    #  mat[4, 4, T, Q].row_type operator*[T, Q](const mat[4, 4, T, Q].col_type&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator/[T, Q](mat[void, void, T, void]&, const T&)
    mat[void, void, T, void] operator/[T, Q](const T&, mat[void, void, T, void]&)
    #  mat[4, 4, T, Q].col_type operator/[T, Q](mat[void, void, T, void]&, const mat[4, 4, T, Q].row_type&)
    #  mat[4, 4, T, Q].row_type operator/[T, Q](const mat[4, 4, T, Q].col_type&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator/[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    bint operator==[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    bint operator!=[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    ctypedef mat[void, void, double, void] dmat4x4
    ctypedef mat[void, void, double, void] dmat4
    ctypedef mat[void, void, double, void] lowp_dmat4
    ctypedef mat[void, void, double, void] mediump_dmat4
    ctypedef mat[void, void, double, void] highp_dmat4
    ctypedef mat[void, void, double, void] lowp_dmat4x4
    ctypedef mat[void, void, double, void] mediump_dmat4x4
    ctypedef mat[void, void, double, void] highp_dmat4x4
    ctypedef mat[void, void, float, void] mat4x4
    ctypedef mat[void, void, float, void] mat4
    ctypedef mat[void, void, float, void] lowp_mat4
    ctypedef mat[void, void, float, void] mediump_mat4
    ctypedef mat[void, void, float, void] highp_mat4
    ctypedef mat[void, void, float, void] lowp_mat4x4
    ctypedef mat[void, void, float, void] mediump_mat4x4
    ctypedef mat[void, void, float, void] highp_mat4x4
    mat[void, void, T, void] matrixCompMult[C, R, T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    #  detail.outerProduct_trait[C, R, T, Q].type outerProduct[C, R, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    #  mat[C, R, T, Q].transpose_type transpose[C, R, T, Q](mat[void, void, T, void]&)
    T determinant[C, R, T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] inverse[C, R, T, Q](mat[void, void, T, void]&)
    T length[L, T, Q](vec[void, T, void]&)
    T distance[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    T dot[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] cross[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] normalize[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] faceforward[L, T, Q](vec[void, T, void]&, vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] reflect[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] refract[L, T, Q](vec[void, T, void]&, vec[void, T, void]&, T)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator+[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator-[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator*[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator/[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator%[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator&[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator|[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator^[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator<<[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator>>[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator~[T, Q](vec[void, T, void]&)
    bint operator==[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    bint operator!=[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    # vec[void, bint, void] operator&&[Q](vec[void, bint, void]&, vec[void, bint, void]&)
    # vec[void, bint, void] operator||[Q](vec[void, bint, void]&, vec[void, bint, void]&)
    #  void vec[1, type-parameter-0-0, Q][P, T, Q](vec[void, T, void]&)
    void vec[T, Q](T)
    #  void vec[1, type-parameter-0-0, Q][U, P, T, Q](vec[void, U, void]&)
    #  void vec[1, type-parameter-0-0, Q][U, P, T, Q](vec[void, U, void]&)
    #  void vec[1, type-parameter-0-0, Q][U, P, T, Q](vec[void, U, void]&)
    #  void vec[1, type-parameter-0-0, Q][U, P, T, Q](vec[void, U, void]&)
    #  T& operator[][T, Q](length_type)
    #  const T& operator[][T, Q](length_type)
    vec[void, T, void]& operator=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator+=[U, T, Q](U)
    #  vec[void, T, void]& operator+=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator-=[U, T, Q](U)
    #  vec[void, T, void]& operator-=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator*=[U, T, Q](U)
    #  vec[void, T, void]& operator*=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator/=[U, T, Q](U)
    #  vec[void, T, void]& operator/=[U, T, Q](vec[void, U, void]&)
    vec[void, T, void]& operator++[T, Q]()
    vec[void, T, void]& operator--[T, Q]()
    vec[void, T, void] operator++[T, Q](int)
    vec[void, T, void] operator--[T, Q](int)
    #  vec[void, T, void]& operator%=[U, T, Q](U)
    #  vec[void, T, void]& operator%=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator&=[U, T, Q](U)
    #  vec[void, T, void]& operator&=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator|=[U, T, Q](U)
    #  vec[void, T, void]& operator|=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator^=[U, T, Q](U)
    #  vec[void, T, void]& operator^=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator<<=[U, T, Q](U)
    #  vec[void, T, void]& operator<<=[U, T, Q](vec[void, U, void]&)
    #  vec[void, T, void]& operator>>=[U, T, Q](U)
    #  vec[void, T, void]& operator>>=[U, T, Q](vec[void, U, void]&)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator+[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator+[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator-[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator-[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator*[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator*[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator/[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator/[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator%[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator%[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator&[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator&[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator|[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator|[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator^[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator^[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator<<[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator<<[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, T)
    vec[void, T, void] operator>>[T, Q](T, vec[void, T, void]&)
    vec[void, T, void] operator>>[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] operator~[T, Q](vec[void, T, void]&)
    bint operator==[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    bint operator!=[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    # vec[void, bint, void] operator&&[Q](vec[void, bint, void]&, vec[void, bint, void]&)
    # vec[void, bint, void] operator||[Q](vec[void, bint, void]&, vec[void, bint, void]&)
    vec[void, T, void] pow[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] exp[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] log[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] exp2[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] log2[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] sqrt[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] inversesqrt[L, T, Q](vec[void, T, void]&)
    vec[void, bint, void] lessThan[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, bint, void] lessThanEqual[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, bint, void] greaterThan[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, bint, void] greaterThanEqual[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, bint, void] equal[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, bint, void] notEqual[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    bint any[L, Q](vec[void, bint, void]&)
    bint all[L, Q](vec[void, bint, void]&)
    vec[void, bint, void] not_[L, Q](vec[void, bint, void]&)
    vec[void, bint, void] lessThan[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, bint, void] lessThanEqual[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, bint, void] greaterThan[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, bint, void] greaterThanEqual[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, bint, void] equal[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, bint, void] notEqual[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    bint any[L, Q](vec[void, bint, void]&)
    bint all[L, Q](vec[void, bint, void]&)
    vec[void, bint, void] not_[L, Q](vec[void, bint, void]&)
    vec[void, T, void] pow[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] exp[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] log[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] exp2[L, T, Q](vec[void, T, void]&)
    genType log2[genType](genType)
    vec[void, T, void] log2[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] sqrt[L, T, Q](vec[void, T, void]&)
    genType inversesqrt[genType](genType)
    vec[void, T, void] inversesqrt[L, T, Q](vec[void, T, void]&)
    genType abs[genType](genType)
    vec[void, T, void] abs[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] sign[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] floor[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] trunc[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] round[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] roundEven[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] ceil[L, T, Q](vec[void, T, void]&)
    genType fract[genType](genType)
    vec[void, T, void] fract[L, T, Q](vec[void, T, void]&)
    genType mod[genType](genType, genType)
    vec[void, T, void] mod[L, T, Q](vec[void, T, void]&, T)
    vec[void, T, void] mod[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    genType modf[genType](genType, genType&)
    genType min[genType](genType, genType)
    vec[void, T, void] min[L, T, Q](vec[void, T, void]&, T)
    vec[void, T, void] min[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    genType max[genType](genType, genType)
    vec[void, T, void] max[L, T, Q](vec[void, T, void]&, T)
    vec[void, T, void] max[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    genType clamp[genType](genType, genType, genType)
    vec[void, T, void] clamp[L, T, Q](vec[void, T, void]&, T, T)
    vec[void, T, void] clamp[L, T, Q](vec[void, T, void]&, vec[void, T, void]&, vec[void, T, void]&)
    genTypeT mix[genTypeT, genTypeU](genTypeT, genTypeT, genTypeU)
    vec[void, T, void] mix[L, T, U, Q](vec[void, T, void]&, vec[void, T, void]&, vec[void, U, void]&)
    vec[void, T, void] mix[L, T, U, Q](vec[void, T, void]&, vec[void, T, void]&, U)
    genType step[genType](genType, genType)
    vec[void, T, void] step[L, T, Q](T, vec[void, T, void]&)
    vec[void, T, void] step[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    genType smoothstep[genType](genType, genType, genType)
    vec[void, T, void] smoothstep[L, T, Q](T, T, vec[void, T, void]&)
    vec[void, T, void] smoothstep[L, T, Q](vec[void, T, void]&, vec[void, T, void]&, vec[void, T, void]&)
    vec[void, bint, void] isnan[L, T, Q](vec[void, T, void]&)
    vec[void, bint, void] isinf[L, T, Q](vec[void, T, void]&)
    int floatBitsToInt(const float&)
    vec[void, int, void] floatBitsToInt[L, Q](vec[void, float, void]&)
    uint floatBitsToUint(const float&)
    vec[void, uint, void] floatBitsToUint[L, Q](vec[void, float, void]&)
    float intBitsToFloat(const int&)
    vec[void, float, void] intBitsToFloat[L, Q](vec[void, int, void]&)
    float uintBitsToFloat(uint&)
    vec[void, float, void] uintBitsToFloat[L, Q](vec[void, uint, void]&)
    genType fma[genType](const genType&, const genType&, const genType&)
    genType frexp[genType](genType, int&)
    vec[void, T, void] frexp[L, T, Q](vec[void, T, void]&, vec[void, int, void]&)
    genType ldexp[genType](const genType&, const int&)
    vec[void, T, void] ldexp[L, T, Q](vec[void, T, void]&, vec[void, int, void]&)
    genType min[genType](genType, genType)
    genType max[genType](genType, genType)
    int abs(int)
    genFIType abs[genFIType](genFIType)
    vec[void, T, void] abs[L, T, Q](vec[void, T, void]&)
    genFIType sign[genFIType](genFIType)
    vec[void, T, void] sign[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] floor[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] trunc[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] round[L, T, Q](vec[void, T, void]&)
    genType roundEven[genType](genType)
    vec[void, T, void] roundEven[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] ceil[L, T, Q](vec[void, T, void]&)
    genType fract[genType](genType)
    vec[void, T, void] fract[L, T, Q](vec[void, T, void]&)
    genType mod[genType](genType, genType)
    vec[void, T, void] mod[L, T, Q](vec[void, T, void]&, T)
    vec[void, T, void] mod[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    genType modf[genType](genType, genType&)
    vec[void, T, void] modf[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] modf[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] modf[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] modf[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] min[L, T, Q](vec[void, T, void]&, T)
    vec[void, T, void] min[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] max[L, T, Q](vec[void, T, void]&, T)
    vec[void, T, void] max[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    genType clamp[genType](genType, genType, genType)
    vec[void, T, void] clamp[L, T, Q](vec[void, T, void]&, T, T)
    vec[void, T, void] clamp[L, T, Q](vec[void, T, void]&, vec[void, T, void]&, vec[void, T, void]&)
    genTypeT mix[genTypeT, genTypeU](genTypeT, genTypeT, genTypeU)
    vec[void, T, void] mix[L, T, U, Q](vec[void, T, void]&, vec[void, T, void]&, U)
    vec[void, T, void] mix[L, T, U, Q](vec[void, T, void]&, vec[void, T, void]&, vec[void, U, void]&)
    genType step[genType](genType, genType)
    vec[void, T, void] step[L, T, Q](T, vec[void, T, void]&)
    vec[void, T, void] step[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    genType smoothstep[genType](genType, genType, genType)
    vec[void, T, void] smoothstep[L, T, Q](T, T, vec[void, T, void]&)
    vec[void, T, void] smoothstep[L, T, Q](vec[void, T, void]&, vec[void, T, void]&, vec[void, T, void]&)
    vec[void, bint, void] isnan[L, T, Q](vec[void, T, void]&)
    vec[void, bint, void] isinf[L, T, Q](vec[void, T, void]&)
    int floatBitsToInt(const float&)
    vec[void, int, void] floatBitsToInt[L, Q](vec[void, float, void]&)
    uint floatBitsToUint(const float&)
    vec[void, uint, void] floatBitsToUint[L, Q](vec[void, float, void]&)
    float intBitsToFloat(const int&)
    vec[void, float, void] intBitsToFloat[L, Q](vec[void, int, void]&)
    float uintBitsToFloat(uint&)
    vec[void, float, void] uintBitsToFloat[L, Q](vec[void, uint, void]&)
    genType frexp[genType](genType, int&)
    vec[void, T, void] frexp[L, T, Q](vec[void, T, void]&, vec[void, int, void]&)
    genType ldexp[genType](const genType&, const int&)
    vec[void, T, void] ldexp[L, T, Q](vec[void, T, void]&, vec[void, int, void]&)
    genType length[genType](genType)
    T length[L, T, Q](vec[void, T, void]&)
    genType distance[genType](const genType&, const genType&)
    T distance[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    T dot[T](T, T)
    T dot[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] cross[T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] normalize[L, T, Q](vec[void, T, void]&)
    genType faceforward[genType](const genType&, const genType&, const genType&)
    vec[void, T, void] faceforward[L, T, Q](vec[void, T, void]&, vec[void, T, void]&, vec[void, T, void]&)
    genType reflect[genType](const genType&, const genType&)
    vec[void, T, void] reflect[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    genType refract[genType](const genType&, const genType&, genType)
    vec[void, T, void] refract[L, T, Q](vec[void, T, void]&, vec[void, T, void]&, T)
    mat[void, void, T, void] matrixCompMult[C, R, T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    #  detail.outerProduct_trait[DA, DB, T, Q].type outerProduct[DA, DB, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    #  mat[C, R, T, Q].transpose_type transpose[C, R, T, Q](mat[void, void, T, void]&)
    T determinant[C, R, T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] inverse[C, R, T, Q](mat[void, void, T, void]&)
    #  void mat[2, 2, type-parameter-0-0, Q][P, T, Q](mat[void, void, T, void]&)
    void mat[T, Q](T)
    void mat[T, Q](const T&, const T&, const T&, const T&)
    void mat[T, Q](col_type&, col_type&)
    #  void mat[2, 2, type-parameter-0-0, Q][X1, Y1, X2, Y2, T, Q](const X1&, const Y1&, const X2&, const Y2&)
    #  void mat[2, 2, type-parameter-0-0, Q][V1, V2, T, Q](vec[void, V1, void]&, vec[void, V2, void]&)
    #  void mat[2, 2, type-parameter-0-0, Q][U, P, T, Q](mat[void, void, U, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    void mat[T, Q](mat[void, void, T, void]&)
    #  col_type& operator[][T, Q](length_type)
    #  col_type& operator[][T, Q](length_type)
    mat[void, void, T, void]& operator=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator+=[U, T, Q](U)
    #  mat[void, void, T, void]& operator+=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator-=[U, T, Q](U)
    #  mat[void, void, T, void]& operator-=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator*=[U, T, Q](U)
    #  mat[void, void, T, void]& operator*=[U, T, Q](mat[void, void, U, void]&)
    #  mat[void, void, T, void]& operator/=[U, T, Q](U)
    #  mat[void, void, T, void]& operator/=[U, T, Q](mat[void, void, U, void]&)
    mat[void, void, T, void]& operator++[T, Q]()
    mat[void, void, T, void]& operator--[T, Q]()
    mat[void, void, T, void] operator++[T, Q](int)
    mat[void, void, T, void] operator--[T, Q](int)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator+[T, Q](T, mat[void, void, T, void]&)
    mat[void, void, T, void] operator+[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator-[T, Q](T, mat[void, void, T, void]&)
    mat[void, void, T, void] operator-[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator*[T, Q](T, mat[void, void, T, void]&)
    #  mat[2, 2, T, Q].col_type operator*[T, Q](mat[void, void, T, void]&, const mat[2, 2, T, Q].row_type&)
    #  mat[2, 2, T, Q].row_type operator*[T, Q](const mat[2, 2, T, Q].col_type&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator*[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator/[T, Q](mat[void, void, T, void]&, T)
    mat[void, void, T, void] operator/[T, Q](T, mat[void, void, T, void]&)
    #  mat[2, 2, T, Q].col_type operator/[T, Q](mat[void, void, T, void]&, const mat[2, 2, T, Q].row_type&)
    #  mat[2, 2, T, Q].row_type operator/[T, Q](const mat[2, 2, T, Q].col_type&, mat[void, void, T, void]&)
    mat[void, void, T, void] operator/[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    bint operator==[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    bint operator!=[T, Q](mat[void, void, T, void]&, mat[void, void, T, void]&)
    ctypedef mat[void, void, double, void] dmat2x2
    ctypedef mat[void, void, double, void] dmat2
    ctypedef mat[void, void, double, void] lowp_dmat2
    ctypedef mat[void, void, double, void] mediump_dmat2
    ctypedef mat[void, void, double, void] highp_dmat2
    ctypedef mat[void, void, double, void] lowp_dmat2x2
    ctypedef mat[void, void, double, void] mediump_dmat2x2
    ctypedef mat[void, void, double, void] highp_dmat2x2
    ctypedef mat[void, void, float, void] mat2x2
    ctypedef mat[void, void, float, void] mat2
    ctypedef mat[void, void, float, void] lowp_mat2
    ctypedef mat[void, void, float, void] mediump_mat2
    ctypedef mat[void, void, float, void] highp_mat2
    ctypedef mat[void, void, float, void] lowp_mat2x2
    ctypedef mat[void, void, float, void] mediump_mat2x2
    ctypedef mat[void, void, float, void] highp_mat2x2
    vec[void, T, void] radians[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] degrees[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] sin[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] cos[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] tan[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] asin[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] acos[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] atan[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] atan[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] sinh[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] cosh[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] tanh[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] asinh[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] acosh[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] atanh[L, T, Q](vec[void, T, void]&)
    genType radians[genType](genType)
    vec[void, T, void] radians[L, T, Q](vec[void, T, void]&)
    genType degrees[genType](genType)
    vec[void, T, void] degrees[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] sin[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] cos[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] tan[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] asin[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] acos[L, T, Q](vec[void, T, void]&)
    genType atan[genType](genType, genType)
    vec[void, T, void] atan[L, T, Q](vec[void, T, void]&, vec[void, T, void]&)
    vec[void, T, void] atan[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] sinh[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] cosh[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] tanh[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] asinh[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] acosh[L, T, Q](vec[void, T, void]&)
    vec[void, T, void] atanh[L, T, Q](vec[void, T, void]&)
    uint packUnorm2x16(vec2&)
    uint packSnorm2x16(vec2&)
    uint packUnorm4x8(vec4&)
    uint packSnorm4x8(vec4&)
    vec2 unpackUnorm2x16(uint)
    vec2 unpackSnorm2x16(uint)
    vec4 unpackUnorm4x8(uint)
    vec4 unpackSnorm4x8(uint)
    double packDouble2x32(uvec2&)
    uvec2 unpackDouble2x32(double)
    uint packHalf2x16(vec2&)
    vec2 unpackHalf2x16(uint)
    uint packUnorm2x16(vec2&)
    vec2 unpackUnorm2x16(uint)
    uint packSnorm2x16(vec2&)
    vec2 unpackSnorm2x16(uint)
    uint packUnorm4x8(vec4&)
    vec4 unpackUnorm4x8(uint)
    uint packSnorm4x8(vec4&)
    vec4 unpackSnorm4x8(uint)
    double packDouble2x32(uvec2&)
    uvec2 unpackDouble2x32(double)
    uint packHalf2x16(vec2&)
    vec2 unpackHalf2x16(uint)
    vec[void, uint, void] uaddCarry[L, Q](vec[void, uint, void]&, vec[void, uint, void]&, vec[void, uint, void]&)
    vec[void, uint, void] usubBorrow[L, Q](vec[void, uint, void]&, vec[void, uint, void]&, vec[void, uint, void]&)
    void umulExtended[L, Q](vec[void, uint, void]&, vec[void, uint, void]&, vec[void, uint, void]&, vec[void, uint, void]&)
    void imulExtended[L, Q](vec[void, int, void]&, vec[void, int, void]&, vec[void, int, void]&, vec[void, int, void]&)
    vec[void, T, void] bitfieldExtract[L, T, Q](vec[void, T, void]&, int, int)
    vec[void, T, void] bitfieldInsert[L, T, Q](vec[void, T, void]&, vec[void, T, void]&, int, int)
    vec[void, T, void] bitfieldReverse[L, T, Q](vec[void, T, void]&)
    int bitCount[genType](genType)
    vec[void, int, void] bitCount[L, T, Q](vec[void, T, void]&)
    int findLSB[genIUType](genIUType)
    vec[void, int, void] findLSB[L, T, Q](vec[void, T, void]&)
    int findMSB[genIUType](genIUType)
    vec[void, int, void] findMSB[L, T, Q](vec[void, T, void]&)
    uint uaddCarry(uint&, uint&, uint&)
    vec[void, uint, void] uaddCarry[L, Q](vec[void, uint, void]&, vec[void, uint, void]&, vec[void, uint, void]&)
    uint usubBorrow(uint&, uint&, uint&)
    vec[void, uint, void] usubBorrow[L, Q](vec[void, uint, void]&, vec[void, uint, void]&, vec[void, uint, void]&)
    void umulExtended(uint&, uint&, uint&, uint&)
    void umulExtended[L, Q](vec[void, uint, void]&, vec[void, uint, void]&, vec[void, uint, void]&, vec[void, uint, void]&)
    void imulExtended(int, int, int&, int&)
    void imulExtended[L, Q](vec[void, int, void]&, vec[void, int, void]&, vec[void, int, void]&, vec[void, int, void]&)
    genIUType bitfieldExtract[genIUType](genIUType, int, int)
    vec[void, T, void] bitfieldExtract[L, T, Q](vec[void, T, void]&, int, int)
    genIUType bitfieldInsert[genIUType](const genIUType&, const genIUType&, int, int)
    vec[void, T, void] bitfieldInsert[L, T, Q](vec[void, T, void]&, vec[void, T, void]&, int, int)
    genIUType bitfieldReverse[genIUType](genIUType)
    vec[void, T, void] bitfieldReverse[L, T, Q](vec[void, T, void]&)
    int bitCount[genIUType](genIUType)
    vec[void, int, void] bitCount[L, T, Q](vec[void, T, void]&)
    int findLSB[genIUType](genIUType)
    vec[void, int, void] findLSB[L, T, Q](vec[void, T, void]&)
    int findMSB[genIUType](genIUType)
    vec[void, int, void] findMSB[L, T, Q](vec[void, T, void]&)


