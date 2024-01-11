from matplotlib import font_manager


cdef FT_Library library
if FT_Init_FreeType(&library):
    raise RuntimeError("Failed to initalize Freetype")

# cdef FT_UInt hinting_engine = FT_HINTING_ADOBE
# FT_Property_Set(library, "cff", "hinting-engine", &hinting_engine)

cdef FT_Bool no_stem_darkening = False
FT_Property_Set(library, "cff", "no-stem-darkening", &no_stem_darkening)

cdef FT_Int[8] darken_params = [500, 300,
                                1000, 300,
                                1500, 300,
                                2000, 500]

FT_Property_Set(library, "cff", "darkening-parameters", darken_params)

cdef class Face:
    cdef FT_Face face

    @staticmethod
    cdef Face init(FT_Face face):
        cdef Face self = Face.__new__(Face)
        self.face = face
        return self


cdef dict faces = {}


cdef class Font:

    def __init__(self, str file_path, unsigned int size):
        self.size = size

        cdef int width = (size + 2) * 16
        cdef int height = (size + 2) * 8

        cdef Window window = cyclone.current_window
        cdef int fb_width = width * window.framebuffer_width // window.width
        cdef int fb_height = height * window.framebuffer_height // window.height
        cdef int ratio = window.framebuffer_width // window.width

        cdef unsigned char *data = <unsigned char *>malloc(
            sizeof(unsigned char) * fb_width * fb_height * 4
        )
        memset(data, 0, fb_width * fb_height * 4)

        cdef FT_Face face
        cdef Face _face = faces.get(file_path)
        if _face is None:
            if FT_New_Face(library, file_path.encode(), 0, &face):
                raise RuntimeError("Failed to load font")
            faces[file_path] = Face.init(face)
        else:
            face = _face.face

        cdef int i, x, y, xx, yy
        cdef FT_Bitmap bitmap
        cdef unsigned char c
        cdef int index
        FT_Set_Pixel_Sizes(face, 0, size * ratio)
        # FT_Set_Char_Size(face, 0, size * 64, 144, 144)

        for i in range(128):
            FT_Load_Char(face, i, FT_LOAD_RENDER)

            x = ((i % 16) * (size + 2) + 1) * ratio
            y = ((i // 16) * (size + 2) + 1) * ratio

            bitmap = face.glyph.bitmap
            for yy in range(bitmap.rows):
                for xx in range(bitmap.width):
                    c = bitmap.buffer[xx + yy * bitmap.width]
                    index = (y + yy) * fb_width * 4 + (x + xx) * 4
                    data[index + 0] = 255
                    data[index + 1] = 255
                    data[index + 2] = 255
                    data[index + 3] = c

            self.char_datas[i].size = [
                face.glyph.bitmap.width / ratio, face.glyph.bitmap.rows / ratio
            ]
            self.char_datas[i].bearing = [
                face.glyph.bitmap_left / ratio, face.glyph.bitmap_top / ratio
            ]
            self.char_datas[i].advance = face.glyph.advance.x / 64 / ratio

        self.texture = Texture.__new__(Texture)
        try:
            self.texture._init(
                [width, height], data, False, GL_CLAMP_TO_EDGE, [fb_width, fb_height]
            )
        except Exception:
            raise RuntimeError("Font size too large")

        free(data)


def SysFont(family, size, style=None, weight=None):
    file_path = font_manager.findfont(
        font_manager.FontProperties(family, style, None, weight),
    )
    return Font(file_path, size)
