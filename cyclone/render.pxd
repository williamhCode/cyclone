from libc cimport math
from libc.stdlib cimport malloc, free, realloc
from libc.string cimport memcpy

from cyclone.lib.glad cimport *
from cyclone.lib.cglm cimport *

cimport cyclone
from cyclone.shader cimport *
from cyclone.window cimport Window
from cyclone.texture cimport Texture, RenderTexture
from cyclone.shapes cimport Rectangle
from cyclone.font cimport Font, CharData
from cyclone cimport utils
from cyclone cimport triangulation


cdef struct Vertex:
    # 0 = texture, 1 = circle, 2 = rectangle, 3 = line
    float render_type
    vec3 position
    vec4 color
    vec4[3] extra_data


cdef class Renderer:
    cdef:
        Window window

        unsigned int MAX_TRIANGLES
        unsigned int MAX_VERTICES
        unsigned int MAX_INDICES
        int MAX_TEXTURE_SLOTS

        # shaders
        s_Shader shader
        s_Shader[1] shaders

        # Vertex attributes
        GLuint vao
        GLuint vbo
        GLuint ebo
        unsigned int vertex_count
        unsigned int index_count
        Vertex *vertices
        Vertex *vertices_ptr
        GLuint *indices
        GLuint *indices_ptr

        GLuint *texture_slots
        size_t texture_slot_index

        # matrices
        mat4 proj_mat
        mat4 view_mat

    cdef void _set_proj_mat(self, float width, float height)

    cdef void _begin_batch(self)

    cdef void _end_batch(self)

    cdef void _draw_texture(
        self,
        GLuint texture_id,
        vec2 position,
        vec4 region,
        vec2 size,
        float rotation,
        vec2 offset,
        int flip_mode,
        vec4 color
    )

    cdef void _draw_text(self, Font font, char *text, vec2 position, vec4 color)

    cdef void _draw_circle(
        self,
        vec4 color,
        vec2 position,
        float radius,
        float width = *,
        float fade = *
    )

    cdef void _draw_rectangle(
        self,
        vec4 color,
        vec2 position,
        vec2 size,
        float rotation,
        vec2 offset,
        float width,
        float fade
    )

    cdef void _draw_line(self, vec4 color, vec2 start, vec2 end, float width)

    cdef void _set_quad_indices(self)

    cdef void _draw_polygon_filled(self, vec4 color, vec2 *points, size_t length)

    cdef void _draw_polygon_outline(
        self, vec4 color, vec2 *points, size_t length, float width
    )

    cdef void _calc_inner_point(self, vec2 a, vec2 b, vec2 c, float width, vec2 dest)
