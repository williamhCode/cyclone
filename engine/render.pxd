from engine.lib.glad cimport *
from engine.lib.cglm cimport *

from engine.shader cimport *
from engine.window cimport Window
from engine.shapes cimport Rectangle


cdef struct Vertex:
    # 0 = texture, 1 = circle, 2 = rectangle, 3 = line
    float render_type 
    vec3 position
    vec4 color
    vec4[3] extra_data


cdef class Renderer:
    cdef:
        Window window

        unsigned int MAX_QUADS
        unsigned int MAX_VERTICES
        unsigned int MAX_INDICES
        int MAX_TEXTURE_SLOTS

        # shaders
        s_Shader shader
        s_Shader shaders[1]

        # Vertex attributes
        GLuint vao
        GLuint vbo
        GLuint ebo
        unsigned int count
        Vertex *vertices
        Vertex *vertices_ptr

        GLuint *texture_slots
        size_t texture_slot_index

        # matrices
        mat4 proj_mat
        mat4 view_mat

    cdef void _set_proj_mat(self, float width, float height)

    cdef void _begin_batch(self)

    cdef void _end_batch(self)

    cdef void _handle_color(self, py_color, vec4 color)

    cdef void _draw_texture(self, GLuint texture_id, vec2 position, vec2 size, float rotation, vec2 offset, Rectangle region, bint flipped, vec4 color)

    cdef void _draw_circle(self, vec4 color, vec2 position, float radius, float width = *, float fade = *)

    cdef void _draw_rectangle(self, vec4 color, vec2 position, vec2 size, float rotation, vec2 offset, float width, float fade)

    cdef void _draw_line(self, vec4 color, vec2 start, vec2 end, float width)

cdef void py_to_glm_mat4(py_mat, mat4 mat)
