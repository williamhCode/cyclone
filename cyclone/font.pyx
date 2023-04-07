cdef FT_Library library
if FT_Init_FreeType(&library):
    raise RuntimeError("Failed to initalize Freetype")


cdef class Font:

    def __init__(self, str path, unsigned int size=12):
        self.size = size

        cdef int width = (size + 2) * 16
        cdef int height = (size + 2) * 8

        cdef Window window = cyclone.current_window
        cdef int fb_width = width * window.framebuffer_width // window.width
        cdef int fb_height = height * window.framebuffer_height // window.height
        cdef bint retina = fb_width > width
        cdef int ratio = window.framebuffer_width // window.width

        cdef unsigned char *data = <unsigned char *>malloc(
            sizeof(unsigned char) * fb_width * fb_height * 4
        )
        memset(data, 0, fb_width * fb_height * 4)

        cdef FT_Face face
        if FT_New_Face(library, path.encode(), 0, &face):
            raise RuntimeError("Failed to load font")

        FT_Set_Pixel_Sizes(face, 0, size)

        cdef int i, x, y, xx, yy
        cdef FT_Bitmap bitmap
        cdef unsigned char c
        cdef int index
        for i in range(128):
            FT_Load_Char(face, i, FT_LOAD_RENDER)

            if not retina:
                x = (i % 16) * (size + 2) + 1
                y = (i // 16) * (size + 2) + 1

                bitmap = face.glyph.bitmap
                for xx in range(bitmap.width):
                    for yy in range(bitmap.rows):
                        c = bitmap.buffer[xx + yy * bitmap.width]
                        index = (y + yy) * width * 4 + (x + xx) * 4
                        data[index + 0] = 255
                        data[index + 1] = 255
                        data[index + 2] = 255
                        data[index + 3] = c

            self.char_datas[i].bearing = [face.glyph.bitmap_left, face.glyph.bitmap_top]
            self.char_datas[i].advance = face.glyph.advance.x // 64

        if retina:
            FT_Set_Pixel_Sizes(face, 0, size * ratio)

            for i in range(128):
                FT_Load_Char(face, i, FT_LOAD_RENDER)

                x = ((i % 16) * (size + 2) + 1) * ratio
                y = ((i // 16) * (size + 2) + 1) * ratio

                bitmap = face.glyph.bitmap
                for xx in range(bitmap.width):
                    for yy in range(bitmap.rows):
                        c = bitmap.buffer[xx + yy * bitmap.width]
                        index = (y + yy) * fb_width * 4 + (x + xx) * 4
                        data[index + 0] = 255
                        data[index + 1] = 255
                        data[index + 2] = 255
                        data[index + 3] = c

        self.texture = Texture.__new__(Texture)
        self.texture._init([width, height], data, False, [fb_width, fb_height])

        free(data)
