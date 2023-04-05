cdef extern from "ft2build.h":
    cdef extern from "freetype/freetype.h":
        ctypedef struct FT_Library:
            pass

        ctypedef struct FT_Face:
            pass

        ctypedef signed long FT_Long

        ctypedef unsigned int FT_UInt

        int FT_Init_FreeType(FT_Library *)

        int FT_New_Face(FT_Library, const char*, FT_Long, FT_Face *)

        int FT_Set_Pixel_Sizes(
            FT_Face face, FT_UInt pixel_width, FT_UInt pixel_height
        )
