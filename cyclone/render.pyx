cdef class Renderer:

    def __init__(self):
        self.window = cyclone.current_window
        self.window.make_context_current()

        # glPolygonMode(GL_FRONT_AND_BACK, GL_LINE)
        # glEnable(GL_LINE_SMOOTH)

        # gl options
        glEnable(GL_BLEND)
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)

        self.MAX_TRIANGLES = 200000
        self.MAX_VERTICES = self.MAX_TRIANGLES * 3  # worst case, all triangles
        self.MAX_INDICES = self.MAX_TRIANGLES * 3
        glGetIntegerv(GL_MAX_TEXTURE_IMAGE_UNITS, &self.MAX_TEXTURE_SLOTS)

        # shader stuff ----------------------------------------- #
        shader_create(&self.shader, "shaders/all.vert", "shaders/all.frag")
        self.shaders = [self.shader]

        # set sampler2Ds
        shader_use(&self.shader)

        cdef GLint *values = <GLint *>malloc(self.MAX_TEXTURE_SLOTS * sizeof(GLint))
        cdef size_t i
        for i in range(self.MAX_TEXTURE_SLOTS):
            values[i] = i
        shader_set_int_array(&self.shader, "u_Textures", self.MAX_TEXTURE_SLOTS, values)
        free(values)

        # initialization ----------------------------------------- #
        self.vertices = <Vertex *>malloc(self.MAX_VERTICES * sizeof(Vertex))

        glGenVertexArrays(1, &self.vao)
        glBindVertexArray(self.vao)

        glGenBuffers(1, &self.vbo)
        glBindBuffer(GL_ARRAY_BUFFER, self.vbo)
        glBufferData(
            GL_ARRAY_BUFFER, self.MAX_VERTICES * sizeof(Vertex), NULL, GL_DYNAMIC_DRAW
        )

        # float render_type
        # vec3 position
        # vec4 color
        # vec4[3] extra_data
        glEnableVertexAttribArray(0)
        glVertexAttribPointer(
            0,
            1,
            GL_FLOAT,
            GL_FALSE,
            sizeof(Vertex),
            <void *><size_t>&((<Vertex *>0).render_type)
        )

        glEnableVertexAttribArray(1)
        glVertexAttribPointer(
            1,
            3,
            GL_FLOAT,
            GL_FALSE,
            sizeof(Vertex),
            <void *><size_t>&((<Vertex *>0).position)
        )

        glEnableVertexAttribArray(2)
        glVertexAttribPointer(
            2,
            4,
            GL_FLOAT,
            GL_FALSE,
            sizeof(Vertex),
            <void *><size_t>&((<Vertex *>0).color)
        )

        for i in range(3):
            glEnableVertexAttribArray(i + 3)
            glVertexAttribPointer(
                i + 3,
                4,
                GL_FLOAT,
                GL_FALSE,
                sizeof(Vertex),
                <void *><size_t>&((<Vertex *>0).extra_data[i])
            )

        # generate index buffer and buffer data
        self.indices = <GLuint *>malloc(self.MAX_INDICES * sizeof(GLuint))
        glGenBuffers(1, &self.ebo)
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, self.ebo)
        glBufferData(
            GL_ELEMENT_ARRAY_BUFFER,
            self.MAX_INDICES * sizeof(GLuint),
            self.indices,
            GL_DYNAMIC_DRAW
        )

        self.texture_slots = <GLuint *>malloc(self.MAX_TEXTURE_SLOTS * sizeof(GLuint))

    def __del__(self):
        cdef s_Shader shader
        for shader in self.shaders:
            shader_destroy(&shader)

        free(self.vertices)
        free(self.indices)
        free(self.texture_slots)

    def clear(self, color):
        cdef vec4 _color
        utils.convert_color(color, _color)
        glClearColor(_color[0], _color[1], _color[2], _color[3])
        glClear(GL_COLOR_BUFFER_BIT)

    def begin(self, view_matrix=None, RenderTexture target=None):
        self.window.make_context_current()
        if target is None:
            glBindFramebuffer(GL_FRAMEBUFFER, 0)
            glViewport(
                0, 0, self.window.framebuffer_width, self.window.framebuffer_height
            )
            self._set_proj_mat(self.window.width, self.window.height)
        else:
            glBindFramebuffer(GL_FRAMEBUFFER, target.fbo)
            glViewport(0, 0, target.framebuffer_width, target.framebuffer_height)
            self._set_proj_mat(target.width, target.height)

        # set view matrix
        if view_matrix is None:
            glm_mat4_identity(self.view_mat)
        else:
            utils.convert_mat4(view_matrix, self.view_mat)

        cdef mat4 proj_view_mat
        glm_mat4_mul(self.proj_mat, self.view_mat, proj_view_mat)

        cdef s_Shader shader
        for shader in self.shaders:
            shader_use(&shader)
            shader_set_mat4(&shader, "u_ProjView", proj_view_mat)

        self._begin_batch()

    cdef void _set_proj_mat(self, float width, float height):
        glm_ortho(0, width, 0, height, -1, 1, self.proj_mat)

    cdef void _begin_batch(self):
        self.vertex_count = 0
        self.vertices_ptr = self.vertices
        self.index_count = 0
        self.indices_ptr = self.indices
        self.texture_slot_index = 0

    def end(self):
        self._end_batch()

    cdef void _end_batch(self):
        glBindBuffer(GL_ARRAY_BUFFER, self.vbo)
        glBufferSubData(
            GL_ARRAY_BUFFER,
            0,
            self.vertex_count * sizeof(Vertex),
            self.vertices
        )

        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, self.ebo)
        glBufferSubData(
            GL_ELEMENT_ARRAY_BUFFER,
            0,
            self.index_count * sizeof(GLuint),
            self.indices
        )

        cdef size_t i
        for i in range(self.texture_slot_index):
            glActiveTexture(GL_TEXTURE0 + i)
            glBindTexture(GL_TEXTURE_2D, self.texture_slots[i])

        shader_use(&self.shader)
        glBindVertexArray(self.vao)
        glDrawElements(GL_TRIANGLES, self.index_count, GL_UNSIGNED_INT, NULL)

    def draw_texture(
        self,
        Texture texture not None,
        position,
        float rotation=0.0,
        offset=(0.0, 0.0),
        int flip_mode=0,
        color=(255, 255, 255, 255)
    ):
        cdef GLuint texture_id = texture.texture_id
        cdef vec2 t_position = [position[0], position[1]]
        cdef vec2 t_size = [texture.width, texture.height]
        cdef vec2 t_offset = [offset[0], offset[1]]
        cdef vec4 t_color
        utils.convert_color(color, t_color)

        self._draw_texture(
            texture_id, t_position, NULL, t_size, rotation, t_offset, flip_mode, t_color
        )

    def draw_texture_region(
        self,
        Texture texture not None,
        position,
        region,
        float rotation=0.0,
        offset=(0.0, 0.0),
        int flip_mode=0,
        color=(255, 255, 255, 255)
    ):
        cdef GLuint texture_id = texture.texture_id
        cdef vec2 t_position = [position[0], position[1]]
        cdef vec4 t_region
        if isinstance(region, Rectangle):
            t_region = [region.x, region.y, region.width, region.height]
        else:
            t_region = [region[0], region[1], region[2], region[3]]
        cdef vec2 t_size = [texture.width, texture.height]
        cdef vec2 t_offset = [offset[0], offset[1]]
        cdef vec4 t_color
        utils.convert_color(color, t_color)

        self._draw_texture(
            texture_id,
            t_position,
            t_region,
            t_size,
            rotation,
            t_offset,
            flip_mode,
            t_color
        )

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
    ):
        cdef size_t i

        if (
            self.index_count >= self.MAX_INDICES
            or self.texture_slot_index >= self.MAX_TEXTURE_SLOTS
        ):
            self._end_batch()
            self._begin_batch()

        cdef float rad_rotation = rotation * math.pi / 180.0

        cdef float texture_index = -1.0
        for i in range(self.texture_slot_index):
            if self.texture_slots[i] == texture_id:
                texture_index = <float>i
                break

        if texture_index == -1.0:
            texture_index = <float>self.texture_slot_index
            self.texture_slots[self.texture_slot_index] = texture_id
            self.texture_slot_index += 1

        cdef vec2[4] local_positions
        cdef vec2[4] tex_coords
        cdef float left, right, top, bottom
        if region == NULL:
            local_positions = [
                [0, 0],
                [size[0], 0],
                [size[0], size[1]],
                [0, size[1]]
            ]

            tex_coords = [
                [0, 0],
                [1, 0],
                [1, 1],
                [0, 1]
            ]
        else:
            local_positions = [
                [0, 0],
                [region[2], 0],
                [region[2], region[3]],
                [0, region[3]]
            ]

            # region = [x, y, width, height]
            left = region[0] / size[0]
            right = (region[0] + region[2]) / size[0]
            bottom = region[1] / size[1]
            top = (region[1] + region[3]) / size[1]

            tex_coords = [
                [left, bottom],
                [right, bottom],
                [right, top],
                [left, top]
            ]

        if flip_mode == 1 or flip_mode == 3:
            tex_coords = [
                tex_coords[1],
                tex_coords[0],
                tex_coords[3],
                tex_coords[2]
            ]
        if flip_mode == 2 or flip_mode == 3:
            tex_coords = [
                tex_coords[3],
                tex_coords[2],
                tex_coords[1],
                tex_coords[0]
            ]

        cdef vec3 _position = [position[0], position[1], 0.0]

        for i in range(4):
            self.vertices_ptr.render_type = 0.0
            self.vertices_ptr.position = _position
            self.vertices_ptr.color = color
            self.vertices_ptr.extra_data[0][0:2] = local_positions[i]
            self.vertices_ptr.extra_data[0][2:4] = offset
            self.vertices_ptr.extra_data[1][0] = rad_rotation
            self.vertices_ptr.extra_data[1][1:3] = tex_coords[i]
            self.vertices_ptr.extra_data[1][3] = texture_index
            self.vertices_ptr += 1

        self._set_quad_indices()
        self.vertex_count += 4
        self.index_count += 6

    def draw_text(self, Font font, str text, position, color=(255, 255, 255, 255)):
        cdef bytes b_text = text.encode()
        cdef char *t_text = b_text
        cdef vec2 t_position = [position[0], position[1]]
        cdef vec4 t_color
        utils.convert_color(color, t_color)

        self._draw_text(font, t_text, t_position, t_color)

    cdef void _draw_text(self, Font font, char *text, vec2 position, vec4 color):
        cdef float xpos, ypos
        cdef vec4 region
        cdef CharData char_data
        cdef char c
        for c in text:
            char_data = font.char_datas[c]
            region = [
                (c % 16) * (font.size + 2) + 1,
                (c // 16) * (font.size + 2) + 1,
                font.size,
                font.size
            ]

            xpos = position[0] + char_data.bearing[0]
            ypos = position[1] - font.size + char_data.bearing[1]

            self._draw_texture(
                font.texture.texture_id,
                [xpos, ypos],
                region,
                [font.texture.width, font.texture.height],
                0,
                [0, 0],
                2,
                color,
            )

            position[0] += char_data.advance

    def draw_circle(
        self, color, position, float radius, float width = 0.0, float fade = 0.0
    ):
        cdef vec4 t_color
        utils.convert_color(color, t_color)
        cdef vec2 t_position = [position[0], position[1]]

        self._draw_circle(t_color, t_position, radius, width, fade)

    cdef void _draw_circle(
        self,
        vec4 color,
        vec2 position,
        float radius,
        float width = 0.0,
        float fade = 0.0
    ):
        if self.index_count >= self.MAX_INDICES:
            self._end_batch()
            self._begin_batch()

        cdef vec3[4] positions = [
            [position[0] - radius, position[1] - radius, 0.0],
            [position[0] + radius, position[1] - radius, 0.0],
            [position[0] + radius, position[1] + radius, 0.0],
            [position[0] - radius, position[1] + radius, 0.0]
        ]

        cdef vec2[4] local_positions = [
            [-1.0, -1.0],
            [1.0, -1.0],
            [1.0, 1.0],
            [-1.0, 1.0]
        ]

        cdef float thickness
        if width == 0.0:
            thickness = 1.0
        else:
            thickness = width / radius

        fade = fade / radius

        cdef size_t i
        for i in range(4):
            self.vertices_ptr.render_type = 1.0
            self.vertices_ptr.position = positions[i]
            self.vertices_ptr.color = color
            self.vertices_ptr.extra_data[0][0:2] = local_positions[i]
            self.vertices_ptr.extra_data[0][2] = thickness
            self.vertices_ptr.extra_data[0][3] = fade
            self.vertices_ptr += 1

        self._set_quad_indices()
        self.vertex_count += 4
        self.index_count += 6

    # rectangle functions ----------------------------------- #
    def draw_rectangle(
        self,
        color,
        position,
        size,
        float rotation=0.0,
        offset=(0.0, 0.0),
        float width=0.0,
        float fade=0.0
    ):
        cdef vec4 t_color
        utils.convert_color(color, t_color)
        cdef vec2 t_position = [position[0], position[1]]
        cdef vec2 t_size = [size[0], size[1]]
        cdef vec2 t_offset = [offset[0], offset[1]]

        self._draw_rectangle(
            t_color, t_position, t_size, rotation, t_offset, width, fade
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
    ):
        cdef size_t i

        if self.index_count >= self.MAX_INDICES:
            self._end_batch()
            self._begin_batch()

        cdef float rad_rotation = rotation * math.pi / 180.0

        cdef vec2[4] local_positions = [
            [0, 0],
            [size[0], 0],
            [size[0], size[1]],
            [0, size[1]],
        ]

        cdef vec2[4] relative_coords = [
            [-1.0, -1.0],
            [1.0, -1.0],
            [1.0, 1.0],
            [-1.0, 1.0]
        ]

        cdef vec2 thickness
        if width == 0.0:
            thickness = [1.0, 1.0]
        else:
            thickness = [width / size[0] * 2, width / size[1] * 2]

        cdef vec2 _fade = [fade / size[0] * 2, fade / size[1] * 2]

        cdef vec3 _position = [position[0], position[1], 0.0]

        for i in range(4):
            self.vertices_ptr.render_type = 2.0
            self.vertices_ptr.position = _position
            self.vertices_ptr.color = color
            self.vertices_ptr.extra_data[0][0:2] = local_positions[i]
            self.vertices_ptr.extra_data[0][2:4] = offset
            self.vertices_ptr.extra_data[1][0] = rad_rotation
            self.vertices_ptr.extra_data[1][1:3] = relative_coords[i]
            self.vertices_ptr.extra_data[2][0:2] = thickness
            self.vertices_ptr.extra_data[2][2:4] = _fade
            self.vertices_ptr += 1

        self._set_quad_indices()
        self.vertex_count += 4
        self.index_count += 6

    def draw_line(self, color, start, end, float width=1.0):
        cdef vec4 t_color
        utils.convert_color(color, t_color)
        cdef vec2 t_start = [start[0], start[1]]
        cdef vec2 t_end = [end[0], end[1]]

        self._draw_line(t_color, t_start, t_end, width)

    def draw_lines(self, color, points, float width=1.0):
        cdef vec4 t_color
        utils.convert_color(color, t_color)

        cdef size_t i
        cdef vec2 t_start
        point = points[0]
        cdef vec2 t_end = [point[0], point[1]]
        for i in range(1, len(points)):
            point = points[i]
            t_start = t_end
            t_end = [point[0], point[1]]
            self._draw_line(t_color, t_start, t_end, width)

    cdef void _draw_line(self, vec4 color, vec2 start, vec2 end, float width):
        if self.index_count >= self.MAX_INDICES:
            self._end_batch()
            self._begin_batch()

        cdef float corner_angle = (
            math.atan2(end[1] - start[1], end[0] - start[0]) + math.pi / 2
        )

        cdef vec2 corner_offset
        glm_vec2_rotate([width / 2, 0], corner_angle, corner_offset)
        cdef vec3[4] positions = [
            [start[0] + corner_offset[0], start[1] + corner_offset[1], 0.0],
            [start[0] - corner_offset[0], start[1] - corner_offset[1], 0.0],
            [end[0] - corner_offset[0], end[1] - corner_offset[1], 0.0],
            [end[0] + corner_offset[0], end[1] + corner_offset[1], 0.0],
        ]

        cdef size_t i
        for i in range(4):
            self.vertices_ptr.render_type = 3.0
            self.vertices_ptr.position = positions[i]
            self.vertices_ptr.color = color
            self.vertices_ptr += 1

        self._set_quad_indices()
        self.vertex_count += 4
        self.index_count += 6

    def draw_lines_miter(self, color, points, float width=1.0):
        pass

    cdef void _set_quad_indices(self):
        self.indices_ptr[0] = self.vertex_count + 0
        self.indices_ptr[1] = self.vertex_count + 1
        self.indices_ptr[2] = self.vertex_count + 2
        self.indices_ptr[3] = self.vertex_count + 2
        self.indices_ptr[4] = self.vertex_count + 3
        self.indices_ptr[5] = self.vertex_count + 0
        self.indices_ptr += 6

    def draw_polygon(self, color, points, float width=0.0):
        cdef vec4 t_color
        utils.convert_color(color, t_color)
        cdef size_t length = len(points)
        if length < 3:
            raise RuntimeError("Polygon must have at least 3 points")
        cdef vec2 *t_points = <vec2 *>malloc(length * sizeof(vec2))
        cdef size_t i
        for i in range(length):
            t_points[i][0] = points[i][0]
            t_points[i][1] = points[i][1]

        if width == 0.0:
            self._draw_filled_polygon(t_color, t_points, length)
        else:
            self._draw_polygon(t_color, t_points, length, width)

        free(t_points)

    cdef void _draw_filled_polygon(self, vec4 color, vec2 *points, size_t length):
        if self.index_count >= self.MAX_INDICES:
            self._end_batch()
            self._begin_batch()

        cdef size_t i
        for i in range(length):
            self.vertices_ptr.render_type = 3.0
            self.vertices_ptr.position = [points[i][0], points[i][1], 0.0]
            self.vertices_ptr.color = color
            self.vertices_ptr += 1

        cdef size_t num_indices
        cdef size_t[3] *indices
        if length == 3:
            self.indices_ptr[0] = self.vertex_count + 0
            self.indices_ptr[1] = self.vertex_count + 1
            self.indices_ptr[2] = self.vertex_count + 2
            self.indices_ptr += 3
            self.vertex_count += 3
            self.index_count += 3
        else:
            indices = triangulation.triangulate(points, length, &num_indices)
            for i in range(num_indices):
                self.indices_ptr[0] = self.vertex_count + indices[i][0]
                self.indices_ptr[1] = self.vertex_count + indices[i][1]
                self.indices_ptr[2] = self.vertex_count + indices[i][2]
                self.indices_ptr += 3
            free(indices)
            self.vertex_count += length
            self.index_count += num_indices * 3

    cdef void _draw_polygon(self, vec4 color, vec2 *points, size_t length, float width):
        pass

