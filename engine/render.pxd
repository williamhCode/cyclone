from engine.libs.glad cimport *
from engine.libs.cglm cimport *

from engine.shader cimport *


cdef struct QuadVertex:
    vec2 local_position
    vec2 offset
    float rotation
    vec3 position
    vec4 color
    vec2 tex_coord
    float tex_index


cdef struct CircleVertex:
    vec3 position
    vec2 local_position
    vec4 color
    float thickness
    float fade


cdef struct RectangleVertex:
    vec3 position
    vec2 local_position
    vec4 color
    vec2 thickness
    vec2 fade


cdef struct LineVertex:
    vec3 position
    vec4 color


cdef class Renderer:
    cdef:
        unsigned int MAX_QUADS
        unsigned int MAX_VERTICES
        unsigned int MAX_INDICES
        unsigned int MAX_TEXTURE_SLOTS

        # shaders
        s_Shader quad_shader
        s_Shader circle_shader
        s_Shader rectangle_shader
        s_Shader line_shader
        s_Shader shaders[4]

        # matrices
        mat4 proj_mat
        mat4 view_mat

        # quad attributes
        GLuint quad_vao
        GLuint quad_vbo
        GLuint quad_ebo
        unsigned int quad_count
        QuadVertex *quad_vertices
        QuadVertex *quad_vertices_ptr

        GLuint *texture_slots
        size_t texture_slot_index

        # circle attributes
        GLuint circle_vao
        GLuint circle_vbo
        GLuint circle_ebo
        unsigned int circle_count
        CircleVertex *circle_vertices
        CircleVertex *circle_vertices_ptr

        # rectangle attributes
        GLuint rectangle_vao
        GLuint rectangle_vbo
        GLuint rectangle_ebo
        unsigned int rectangle_count
        RectangleVertex *rectangle_vertices
        RectangleVertex *rectangle_vertices_ptr

        # line attributes
        GLuint line_vao
        GLuint line_vbo
        GLuint line_ebo
        unsigned int line_count
        LineVertex *line_vertices
        LineVertex *line_vertices_ptr

        # depth sorting
        float draw_count

    cdef void set_size(self, float width, float height)

    cdef void _begin_quad_batch(self)

    cdef void _begin_circle_batch(self)

    cdef void _begin_rectangle_batch(self)

    cdef void _begin_line_batch(self)

    cdef void _end_quad_batch(self)

    cdef void _end_circle_batch(self)

    cdef void _end_rectangle_batch(self)

    cdef void _end_line_batch(self)

    cdef void _handle_color(self, py_color, vec4 color)

    cdef void _draw_texture(self, GLuint texture_id, vec2 position, vec2 size, float rotation, vec2 offset, bint flipped, vec4 color)

    cdef void _draw_circle(self, vec4 color, vec2 position, float radius, float width = *, float fade = *)

    cdef void _draw_rectangle(self, vec4 color, vec2 position, vec2 size, float rotation, vec2 offset, float width, float fade)

    cdef void _draw_line(self, vec4 color, vec2 start, vec2 end, float width)

cdef void py_to_glm_mat4(py_mat, mat4 mat)
