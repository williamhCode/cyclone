cdef FT_Library library
if FT_Init_FreeType(&library):
    raise RuntimeError("Failed to initalize Freetype")


cdef class Font:

    def __init__(self, str path, unsigned int size=12):
        self.size = size

        cdef FT_Face face
        if FT_New_Face(library, path.encode(), 0, &face):
            raise RuntimeError("Failed to load font")

        FT_Set_Pixel_Sizes(face, 0, size)

        cdef int width = size * 16
        cdef int height = size * 8

        cdef unsigned char *data = <unsigned char *>malloc(
            sizeof(unsigned char) * width * height * 4
        )
        memset(data, 0, width * height * 4)

        cdef int i, x, y, xx, yy
        cdef FT_Bitmap bitmap
        cdef unsigned char c
        cdef int index
        for i in range(128):
            FT_Load_Char(face, i, FT_LOAD_RENDER)

            x = (i % 16) * size
            y = (i // 16) * size

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

        self.texture = Texture.__new__(Texture)
        self.texture._init(width, height, data, False)
