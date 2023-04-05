cdef FT_Library library
if FT_Init_FreeType(&library):
    raise RuntimeError("Failed to initalize Freetype")


cdef class Font:

    def __init__(self, str path, unsigned int size=12):
        cdef FT_Face face
        if FT_New_Face(library, path.encode(), 0, face):
            raise RuntimeError("Failed to load font")

        FT_Set_Pixel_Sizes(face, 0, size)
