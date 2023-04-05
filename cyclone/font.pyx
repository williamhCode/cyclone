cdef FT_Library library
if FT_Init_FreeType(&library):
    raise RuntimeError("Failed to initalize Freetype")


cdef class Font:

    def __init__(self, str path, unsigned int size=12):
        cdef FT_Face face
        if FT_New_Face(library, path.encode(), 0, &face):
            raise RuntimeError("Failed to load font")

        FT_Set_Pixel_Sizes(face, 0, size)

        cdef int width = (size + 2) * 16
        cdef int height = (size + 2) * 8

        cdef unsigned char *buffer = <unsigned char *>malloc(
            sizeof(unsigned char) * width * height * 4
        )
        memset(buffer, 0, width * height * 4)

        cdef int[128] widths
