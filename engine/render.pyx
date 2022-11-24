from libc cimport math
from libcpp.vector cimport vector

from engine.libs.glad cimport *
from engine.libs cimport glm

from engine cimport shader
from engine.shader cimport Shader


DEF MAX_QUAD_COUNT = 100000
DEF MAX_VERTEX_COUNT = MAX_QUAD_COUNT * 4
DEF MAX_INDEX_COUNT = MAX_QUAD_COUNT * 6
DEF MAX_TEXTURES = 16
# DEF QUAD_VERTEX_STRIDE = 10
# DEF CIRCLE_VERTEX_STRIDE = 11
# DEF RECTANGLE_VERTEX_STRIDE = 13
# DEF LINE_VERTEX_STRIDE = 7


cdef struct QuadVertex:
    glm.vec3 position
    glm.vec4 color
    glm.vec2 tex_coord
    float tex_index


cdef struct CircleVertex:
    glm.vec3 position
    glm.vec2 local_position
    glm.vec4 color
    float thickness
    float fade


cdef struct RectangleVertex:
    glm.vec3 position
    glm.vec2 local_position
    glm.vec4 color
    glm.vec2 thickness
    glm.vec2 fade


cdef struct LineVertex:
    glm.vec3 position
    glm.vec4 color


cdef class Renderer:
    cdef:
        # shaders
        Shader quad_shader
        Shader circle_shader
        Shader rectangle_shader
        Shader line_shader
        Shader[4] shaders

        QuadVertex[MAX_VERTEX_COUNT] quad_vertices
        GLuint quad_vao
        GLuint quad_vbo
        GLuint quad_ebo

        CircleVertex[MAX_VERTEX_COUNT] circle_vertices
        GLuint circle_vao
        GLuint circle_vbo
        GLuint circle_ebo

        RectangleVertex[MAX_VERTEX_COUNT] rectangle_vertices
        GLuint rectangle_vao
        GLuint rectangle_vbo
        GLuint rectangle_ebo

        LineVertex[MAX_VERTEX_COUNT] line_vertices
        GLuint line_vao
        GLuint line_vbo
        GLuint line_ebo

    def __init__(self):
        glEnable(GL_BLEND)
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)

        # shader stuff ----------------------------------------- #
        self.quad_shader = shader.create(b'./engine/shaders/quad.vert', b'./engine/shaders/quad.frag')
        self.circle_shader = shader.create(b'./engine/shaders/circle.vert', b'./engine/shaders/circle.frag')
        self.rectangle_shader = shader.create(b'./engine/shaders/rectangle.vert', b'./engine/shaders/rectangle.frag')
        self.line_shader = shader.create(b'./engine/shaders/line.vert', b'./engine/shaders/line.frag')
        self.shaders = [self.quad_shader, self.circle_shader, self.rectangle_shader, self.line_shader]

        # set sampler2Ds
        shader.use(self.quad_shader)
        cdef GLint[MAX_TEXTURES] values
        cdef size_t i
        for i in range(MAX_TEXTURES):
            values[i] = i
        shader.set_int_array(self.quad_shader, 'u_Textures', MAX_TEXTURES, values)

        # quad initialization ----------------------------------------- #
        glGenVertexArrays(1, &self.quad_vao)
        glBindVertexArray(self.quad_vao)

        glGenBuffers(1, &self.quad_vbo)
        glBindBuffer(GL_ARRAY_BUFFER, self.quad_vbo)
        glBufferData(
            GL_ARRAY_BUFFER, sizeof(self.quad_vertices), NULL, GL_DYNAMIC_DRAW
        )

        # 3 position, 4 color, 2 tex_coord, 1 tex_index
        self._set_attrib_pointers(4, [3, 4, 2, 1])

        # generate index buffer and buffer data
        cdef unsigned int[MAX_INDEX_COUNT] indices
        cdef int offset = 0
        for i in range(0, MAX_INDEX_COUNT, 6):
            indices[i + 0] = offset + 0
            indices[i + 1] = offset + 1
            indices[i + 2] = offset + 2
            indices[i + 3] = offset + 2
            indices[i + 4] = offset + 3
            indices[i + 5] = offset + 0
            offset += 4

        glGenBuffers(1, &self.quad_ebo)
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, self.quad_ebo)
        glBufferData(
            GL_ELEMENT_ARRAY_BUFFER, 
            sizeof(indices), indices, GL_STATIC_DRAW
        )

        # circle initialization ----------------------------------------- #
        glGenVertexArrays(1, &self.circle_vao)
        glBindVertexArray(self.circle_vao)

        glGenBuffers(1, &self.circle_vbo)
        glBindBuffer(GL_ARRAY_BUFFER, self.circle_vbo)
        glBufferData(
            GL_ARRAY_BUFFER, sizeof(self.circle_vertices), NULL, GL_DYNAMIC_DRAW
        )

        # 3 position, 2 local_position, 4 color, 1 thickness, 1 fade
        self._set_attrib_pointers(5, [3, 2, 4, 1, 1])

        glGenBuffers(1, &self.circle_ebo)
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, self.circle_ebo)
        glBufferData(
            GL_ELEMENT_ARRAY_BUFFER, 
            sizeof(indices), indices, GL_STATIC_DRAW
        )

        # rectangle initialization ----------------------------------------- #
        glGenVertexArrays(1, &self.rectangle_vao)
        glBindVertexArray(self.rectangle_vao)

        glGenBuffers(1, &self.rectangle_vbo)
        glBindBuffer(GL_ARRAY_BUFFER, self.rectangle_vbo)
        glBufferData(
            GL_ARRAY_BUFFER, sizeof(self.rectangle_vertices), NULL, GL_DYNAMIC_DRAW
        )

        # 3 position, 2 local_position, 4 color, 2 thickness, 2 fade
        self._set_attrib_pointers(5, [3, 2, 4, 2, 2])

        glGenBuffers(1, &self.rectangle_ebo)
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, self.rectangle_ebo)
        glBufferData(
            GL_ELEMENT_ARRAY_BUFFER, 
            sizeof(indices), indices, GL_STATIC_DRAW
        )

        # line initialization ----------------------------------------- #
        glGenVertexArrays(1, &self.line_vao)
        glBindVertexArray(self.line_vao)

        glGenBuffers(1, &self.line_vbo)
        glBindBuffer(GL_ARRAY_BUFFER, self.line_vbo)
        glBufferData(
            GL_ARRAY_BUFFER, sizeof(self.line_vertices), NULL, GL_DYNAMIC_DRAW
        )

        # 3 position, 4 color
        self._set_attrib_pointers(2, [3, 4])

        glGenBuffers(1, &self.line_ebo)
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, self.line_ebo)
        glBufferData(
            GL_ELEMENT_ARRAY_BUFFER, 
            sizeof(indices), indices, GL_STATIC_DRAW
        )

    cdef void _set_attrib_pointers(self, int size, int[] attrib_sizes):
        cdef int stride = 0
        cdef size_t i
        for i in range(size):
            stride += attrib_sizes[i]
        stride *= sizeof(float)
        
        cdef int offset = 0
        for i in range(size):
            glEnableVertexAttribArray(i)
            glVertexAttribPointer(
                i, attrib_sizes[i], GL_FLOAT, GL_FALSE, stride, <void *>offset
            )
            offset += attrib_sizes[i] * sizeof(float)


    def set_size(self, width: int, height: int):
        pass

    def set_clear_color(self, color):
        pass
    
    def clear(self):
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)

    def begin(self, view_matrix=None):
        pass

    def end(self):
        pass

    def draw_texture(self, texture: Texture, position, float rotation=0.0, offset=[0.0, 0.0], bint flipped=False, color=[255, 255, 255, 255]):
        pass

    def draw_circle(self, color, position, float radius, float width = 0.0, float fade = 0.0):
        pass

    def draw_rectangle(self, color, position, size, float rotation=0.0, offset=[0.0, 0.0], float width=0.0, float fade=0.0):
        pass

    def draw_line(self, color, start, end, float width=1.0):
        pass

    def draw_lines(self, color, points, float width=1.0):
        pass

    def draw_lines_miter(self, color, points, float width=1.0):
        pass

