cdef extern from "freetype.h":

    ctypedef signed short FT_Int16

    ctypedef unsigned short FT_UInt16

    ctypedef signed int FT_Int32

    ctypedef unsigned int FT_UInt32

    ctypedef int FT_Fast

    ctypedef unsigned int FT_UFast

    ctypedef long FT_Int64

    ctypedef unsigned long FT_UInt64

    ctypedef FT_MemoryRec_* FT_Memory

    ctypedef void* (*FT_Alloc_Func)(FT_Memory memory, long size)

    ctypedef void (*FT_Free_Func)(FT_Memory memory, void* block)

    ctypedef void* (*FT_Realloc_Func)(FT_Memory memory, long cur_size, long new_size, void* block)

    cdef struct FT_MemoryRec_:
        void* user
        FT_Alloc_Func alloc
        FT_Free_Func free
        FT_Realloc_Func realloc

    ctypedef FT_StreamRec_* FT_Stream

    cdef union FT_StreamDesc_:
        long value
        void* pointer

    ctypedef FT_StreamDesc_ FT_StreamDesc

    ctypedef unsigned long (*FT_Stream_IoFunc)(FT_Stream stream, unsigned long offset, unsigned char* buffer, unsigned long count)

    ctypedef void (*FT_Stream_CloseFunc)(FT_Stream stream)

    cdef struct FT_StreamRec_:
        unsigned char* base
        unsigned long size
        unsigned long pos
        FT_StreamDesc descriptor
        FT_StreamDesc pathname
        FT_Stream_IoFunc read
        FT_Stream_CloseFunc close
        FT_Memory memory
        unsigned char* cursor
        unsigned char* limit

    ctypedef FT_StreamRec_ FT_StreamRec

    ctypedef signed long FT_Pos

    cdef struct FT_Vector_:
        FT_Pos x
        FT_Pos y

    ctypedef FT_Vector_ FT_Vector

    cdef struct FT_BBox_:
        FT_Pos xMin
        FT_Pos yMin
        FT_Pos xMax
        FT_Pos yMax

    ctypedef FT_BBox_ FT_BBox

    cpdef enum FT_Pixel_Mode_:
        FT_PIXEL_MODE_NONE
        FT_PIXEL_MODE_MONO
        FT_PIXEL_MODE_GRAY
        FT_PIXEL_MODE_GRAY2
        FT_PIXEL_MODE_GRAY4
        FT_PIXEL_MODE_LCD
        FT_PIXEL_MODE_LCD_V
        FT_PIXEL_MODE_BGRA
        FT_PIXEL_MODE_MAX

    ctypedef FT_Pixel_Mode_ FT_Pixel_Mode

    cdef struct FT_Bitmap_:
        unsigned int rows
        unsigned int width
        int pitch
        unsigned char* buffer
        unsigned short num_grays
        unsigned char pixel_mode
        unsigned char palette_mode
        void* palette

    ctypedef FT_Bitmap_ FT_Bitmap

    cdef struct FT_Outline_:
        short n_contours
        short n_points
        FT_Vector* points
        char* tags
        short* contours
        int flags

    ctypedef FT_Outline_ FT_Outline

    ctypedef int (*FT_Outline_MoveToFunc)(const FT_Vector* to, void* user)

    ctypedef int (*FT_Outline_LineToFunc)(const FT_Vector* to, void* user)

    ctypedef int (*FT_Outline_ConicToFunc)(const FT_Vector* control, const FT_Vector* to, void* user)

    ctypedef int (*FT_Outline_CubicToFunc)(const FT_Vector* control1, const FT_Vector* control2, const FT_Vector* to, void* user)

    cdef struct FT_Outline_Funcs_:
        FT_Outline_MoveToFunc move_to
        FT_Outline_LineToFunc line_to
        FT_Outline_ConicToFunc conic_to
        FT_Outline_CubicToFunc cubic_to
        int shift
        FT_Pos delta

    ctypedef FT_Outline_Funcs_ FT_Outline_Funcs

    cpdef enum FT_Glyph_Format_:
        FT_GLYPH_FORMAT_NONE
        FT_GLYPH_FORMAT_COMPOSITE
        FT_GLYPH_FORMAT_BITMAP
        FT_GLYPH_FORMAT_OUTLINE
        FT_GLYPH_FORMAT_PLOTTER
        FT_GLYPH_FORMAT_SVG

    ctypedef FT_Glyph_Format_ FT_Glyph_Format

    cdef struct FT_Span_:
        short x
        unsigned short len
        unsigned char coverage

    ctypedef FT_Span_ FT_Span

    ctypedef void (*FT_SpanFunc)(int y, int count, const FT_Span* spans, void* user)

    ctypedef int (*FT_Raster_BitTest_Func)(int y, int x, void* user)

    ctypedef void (*FT_Raster_BitSet_Func)(int y, int x, void* user)

    cdef struct FT_Raster_Params_:
        const FT_Bitmap* target
        const void* source
        int flags
        FT_SpanFunc gray_spans
        FT_SpanFunc black_spans
        FT_Raster_BitTest_Func bit_test
        FT_Raster_BitSet_Func bit_set
        void* user
        FT_BBox clip_box

    ctypedef FT_Raster_Params_ FT_Raster_Params

    cdef struct FT_RasterRec_:
        pass

    ctypedef FT_RasterRec_* FT_Raster

    ctypedef int (*FT_Raster_NewFunc)(void* memory, FT_Raster* raster)

    ctypedef void (*FT_Raster_DoneFunc)(FT_Raster raster)

    ctypedef void (*FT_Raster_ResetFunc)(FT_Raster raster, unsigned char* pool_base, unsigned long pool_size)

    ctypedef int (*FT_Raster_SetModeFunc)(FT_Raster raster, unsigned long mode, void* args)

    ctypedef int (*FT_Raster_RenderFunc)(FT_Raster raster, const FT_Raster_Params* params)

    cdef struct FT_Raster_Funcs_:
        FT_Glyph_Format glyph_format
        FT_Raster_NewFunc raster_new
        FT_Raster_ResetFunc raster_reset
        FT_Raster_SetModeFunc raster_set_mode
        FT_Raster_RenderFunc raster_render
        FT_Raster_DoneFunc raster_done

    ctypedef FT_Raster_Funcs_ FT_Raster_Funcs

    ctypedef unsigned char FT_Bool

    ctypedef signed short FT_FWord

    ctypedef unsigned short FT_UFWord

    ctypedef signed char FT_Char

    ctypedef unsigned char FT_Byte

    ctypedef const FT_Byte* FT_Bytes

    ctypedef FT_UInt32 FT_Tag

    ctypedef char FT_String

    ctypedef signed short FT_Short

    ctypedef unsigned short FT_UShort

    ctypedef signed int FT_Int

    ctypedef unsigned int FT_UInt

    ctypedef signed long FT_Long

    ctypedef unsigned long FT_ULong

    ctypedef signed short FT_F2Dot14

    ctypedef signed long FT_F26Dot6

    ctypedef signed long FT_Fixed

    ctypedef int FT_Error

    ctypedef void* FT_Pointer

    ctypedef size_t FT_Offset

    ctypedef ptrdiff_t FT_PtrDist

    cdef struct FT_UnitVector_:
        FT_F2Dot14 x
        FT_F2Dot14 y

    ctypedef FT_UnitVector_ FT_UnitVector

    cdef struct FT_Matrix_:
        FT_Fixed xx
        FT_Fixed xy
        FT_Fixed yx
        FT_Fixed yy

    ctypedef FT_Matrix_ FT_Matrix

    cdef struct FT_Data_:
        const FT_Byte* pointer
        FT_UInt length

    ctypedef FT_Data_ FT_Data

    ctypedef void (*FT_Generic_Finalizer)(void* object)

    cdef struct FT_Generic_:
        void* data
        FT_Generic_Finalizer finalizer

    ctypedef FT_Generic_ FT_Generic

    ctypedef FT_ListNodeRec_* FT_ListNode

    ctypedef FT_ListRec_* FT_List

    cdef struct FT_ListNodeRec_:
        FT_ListNode prev
        FT_ListNode next
        void* data

    ctypedef FT_ListNodeRec_ FT_ListNodeRec

    cdef struct FT_ListRec_:
        FT_ListNode head
        FT_ListNode tail

    ctypedef FT_ListRec_ FT_ListRec

    cpdef enum:
        FT_Mod_Err_Base
        FT_Mod_Err_Autofit
        FT_Mod_Err_BDF
        FT_Mod_Err_Bzip2
        FT_Mod_Err_Cache
        FT_Mod_Err_CFF
        FT_Mod_Err_CID
        FT_Mod_Err_Gzip
        FT_Mod_Err_LZW
        FT_Mod_Err_OTvalid
        FT_Mod_Err_PCF
        FT_Mod_Err_PFR
        FT_Mod_Err_PSaux
        FT_Mod_Err_PShinter
        FT_Mod_Err_PSnames
        FT_Mod_Err_Raster
        FT_Mod_Err_SFNT
        FT_Mod_Err_Smooth
        FT_Mod_Err_TrueType
        FT_Mod_Err_Type1
        FT_Mod_Err_Type42
        FT_Mod_Err_Winfonts
        FT_Mod_Err_GXvalid
        FT_Mod_Err_Sdf
        FT_Mod_Err_Max

    cpdef enum:
        FT_Err_Ok
        FT_Err_Cannot_Open_Resource
        FT_Err_Unknown_File_Format
        FT_Err_Invalid_File_Format
        FT_Err_Invalid_Version
        FT_Err_Lower_Module_Version
        FT_Err_Invalid_Argument
        FT_Err_Unimplemented_Feature
        FT_Err_Invalid_Table
        FT_Err_Invalid_Offset
        FT_Err_Array_Too_Large
        FT_Err_Missing_Module
        FT_Err_Missing_Property
        FT_Err_Invalid_Glyph_Index
        FT_Err_Invalid_Character_Code
        FT_Err_Invalid_Glyph_Format
        FT_Err_Cannot_Render_Glyph
        FT_Err_Invalid_Outline
        FT_Err_Invalid_Composite
        FT_Err_Too_Many_Hints
        FT_Err_Invalid_Pixel_Size
        FT_Err_Invalid_SVG_Document
        FT_Err_Invalid_Handle
        FT_Err_Invalid_Library_Handle
        FT_Err_Invalid_Driver_Handle
        FT_Err_Invalid_Face_Handle
        FT_Err_Invalid_Size_Handle
        FT_Err_Invalid_Slot_Handle
        FT_Err_Invalid_CharMap_Handle
        FT_Err_Invalid_Cache_Handle
        FT_Err_Invalid_Stream_Handle
        FT_Err_Too_Many_Drivers
        FT_Err_Too_Many_Extensions
        FT_Err_Out_Of_Memory
        FT_Err_Unlisted_Object
        FT_Err_Cannot_Open_Stream
        FT_Err_Invalid_Stream_Seek
        FT_Err_Invalid_Stream_Skip
        FT_Err_Invalid_Stream_Read
        FT_Err_Invalid_Stream_Operation
        FT_Err_Invalid_Frame_Operation
        FT_Err_Nested_Frame_Access
        FT_Err_Invalid_Frame_Read
        FT_Err_Raster_Uninitialized
        FT_Err_Raster_Corrupted
        FT_Err_Raster_Overflow
        FT_Err_Raster_Negative_Height
        FT_Err_Too_Many_Caches
        FT_Err_Invalid_Opcode
        FT_Err_Too_Few_Arguments
        FT_Err_Stack_Overflow
        FT_Err_Code_Overflow
        FT_Err_Bad_Argument
        FT_Err_Divide_By_Zero
        FT_Err_Invalid_Reference
        FT_Err_Debug_OpCode
        FT_Err_ENDF_In_Exec_Stream
        FT_Err_Nested_DEFS
        FT_Err_Invalid_CodeRange
        FT_Err_Execution_Too_Long
        FT_Err_Too_Many_Function_Defs
        FT_Err_Too_Many_Instruction_Defs
        FT_Err_Table_Missing
        FT_Err_Horiz_Header_Missing
        FT_Err_Locations_Missing
        FT_Err_Name_Table_Missing
        FT_Err_CMap_Table_Missing
        FT_Err_Hmtx_Table_Missing
        FT_Err_Post_Table_Missing
        FT_Err_Invalid_Horiz_Metrics
        FT_Err_Invalid_CharMap_Format
        FT_Err_Invalid_PPem
        FT_Err_Invalid_Vert_Metrics
        FT_Err_Could_Not_Find_Context
        FT_Err_Invalid_Post_Table_Format
        FT_Err_Invalid_Post_Table
        FT_Err_DEF_In_Glyf_Bytecode
        FT_Err_Missing_Bitmap
        FT_Err_Missing_SVG_Hooks
        FT_Err_Syntax_Error
        FT_Err_Stack_Underflow
        FT_Err_Ignore
        FT_Err_No_Unicode_Glyph_Name
        FT_Err_Glyph_Too_Big
        FT_Err_Missing_Startfont_Field
        FT_Err_Missing_Font_Field
        FT_Err_Missing_Size_Field
        FT_Err_Missing_Fontboundingbox_Field
        FT_Err_Missing_Chars_Field
        FT_Err_Missing_Startchar_Field
        FT_Err_Missing_Encoding_Field
        FT_Err_Missing_Bbx_Field
        FT_Err_Bbx_Too_Big
        FT_Err_Corrupted_Font_Header
        FT_Err_Corrupted_Font_Glyphs
        FT_Err_Max

    const char* FT_Error_String(FT_Error error_code)

    cdef struct FT_Glyph_Metrics_:
        FT_Pos width
        FT_Pos height
        FT_Pos horiBearingX
        FT_Pos horiBearingY
        FT_Pos horiAdvance
        FT_Pos vertBearingX
        FT_Pos vertBearingY
        FT_Pos vertAdvance

    ctypedef FT_Glyph_Metrics_ FT_Glyph_Metrics

    cdef struct FT_Bitmap_Size_:
        FT_Short height
        FT_Short width
        FT_Pos size
        FT_Pos x_ppem
        FT_Pos y_ppem

    ctypedef FT_Bitmap_Size_ FT_Bitmap_Size

    cdef struct FT_LibraryRec_:
        pass

    ctypedef FT_LibraryRec_* FT_Library

    cdef struct FT_ModuleRec_:
        pass

    ctypedef FT_ModuleRec_* FT_Module

    cdef struct FT_DriverRec_:
        pass

    ctypedef FT_DriverRec_* FT_Driver

    cdef struct FT_RendererRec_:
        pass

    ctypedef FT_RendererRec_* FT_Renderer

    ctypedef FT_FaceRec_* FT_Face

    ctypedef FT_SizeRec_* FT_Size

    ctypedef FT_GlyphSlotRec_* FT_GlyphSlot

    ctypedef FT_CharMapRec_* FT_CharMap

    cpdef enum FT_Encoding_:
        FT_ENCODING_NONE
        FT_ENCODING_MS_SYMBOL
        FT_ENCODING_UNICODE
        FT_ENCODING_SJIS
        FT_ENCODING_PRC
        FT_ENCODING_BIG5
        FT_ENCODING_WANSUNG
        FT_ENCODING_JOHAB
        FT_ENCODING_GB2312
        FT_ENCODING_MS_SJIS
        FT_ENCODING_MS_GB2312
        FT_ENCODING_MS_BIG5
        FT_ENCODING_MS_WANSUNG
        FT_ENCODING_MS_JOHAB
        FT_ENCODING_ADOBE_STANDARD
        FT_ENCODING_ADOBE_EXPERT
        FT_ENCODING_ADOBE_CUSTOM
        FT_ENCODING_ADOBE_LATIN_1
        FT_ENCODING_OLD_LATIN_2
        FT_ENCODING_APPLE_ROMAN

    ctypedef FT_Encoding_ FT_Encoding

    cdef struct FT_CharMapRec_:
        FT_Face face
        FT_Encoding encoding
        FT_UShort platform_id
        FT_UShort encoding_id

    ctypedef FT_CharMapRec_ FT_CharMapRec

    cdef struct FT_Face_InternalRec_:
        pass

    ctypedef FT_Face_InternalRec_* FT_Face_Internal

    cdef struct FT_FaceRec_:
        FT_Long num_faces
        FT_Long face_index
        FT_Long face_flags
        FT_Long style_flags
        FT_Long num_glyphs
        FT_String* family_name
        FT_String* style_name
        FT_Int num_fixed_sizes
        FT_Bitmap_Size* available_sizes
        FT_Int num_charmaps
        FT_CharMap* charmaps
        FT_Generic generic
        FT_BBox bbox
        FT_UShort units_per_EM
        FT_Short ascender
        FT_Short descender
        FT_Short height
        FT_Short max_advance_width
        FT_Short max_advance_height
        FT_Short underline_position
        FT_Short underline_thickness
        FT_GlyphSlot glyph
        FT_Size size
        FT_CharMap charmap
        FT_Driver driver
        FT_Memory memory
        FT_Stream stream
        FT_ListRec sizes_list
        FT_Generic autohint
        void* extensions
        FT_Face_Internal internal

    ctypedef FT_FaceRec_ FT_FaceRec

    cdef struct FT_Size_InternalRec_:
        pass

    ctypedef FT_Size_InternalRec_* FT_Size_Internal

    cdef struct FT_Size_Metrics_:
        FT_UShort x_ppem
        FT_UShort y_ppem
        FT_Fixed x_scale
        FT_Fixed y_scale
        FT_Pos ascender
        FT_Pos descender
        FT_Pos height
        FT_Pos max_advance

    ctypedef FT_Size_Metrics_ FT_Size_Metrics

    cdef struct FT_SizeRec_:
        FT_Face face
        FT_Generic generic
        FT_Size_Metrics metrics
        FT_Size_Internal internal

    ctypedef FT_SizeRec_ FT_SizeRec

    cdef struct FT_SubGlyphRec_:
        pass

    ctypedef FT_SubGlyphRec_* FT_SubGlyph

    cdef struct FT_Slot_InternalRec_:
        pass

    ctypedef FT_Slot_InternalRec_* FT_Slot_Internal

    cdef struct FT_GlyphSlotRec_:
        FT_Library library
        FT_Face face
        FT_GlyphSlot next
        FT_UInt glyph_index
        FT_Generic generic
        FT_Glyph_Metrics metrics
        FT_Fixed linearHoriAdvance
        FT_Fixed linearVertAdvance
        FT_Vector advance
        FT_Glyph_Format format
        FT_Bitmap bitmap
        FT_Int bitmap_left
        FT_Int bitmap_top
        FT_Outline outline
        FT_UInt num_subglyphs
        FT_SubGlyph subglyphs
        void* control_data
        long control_len
        FT_Pos lsb_delta
        FT_Pos rsb_delta
        void* other
        FT_Slot_Internal internal

    ctypedef FT_GlyphSlotRec_ FT_GlyphSlotRec

    FT_Error FT_Init_FreeType(FT_Library* alibrary)

    FT_Error FT_Done_FreeType(FT_Library library)

    cdef struct FT_Parameter_:
        FT_ULong tag
        FT_Pointer data

    ctypedef FT_Parameter_ FT_Parameter

    cdef struct FT_Open_Args_:
        FT_UInt flags
        const FT_Byte* memory_base
        FT_Long memory_size
        FT_String* pathname
        FT_Stream stream
        FT_Module driver
        FT_Int num_params
        FT_Parameter* params

    ctypedef FT_Open_Args_ FT_Open_Args

    FT_Error FT_New_Face(FT_Library library, const char* filepathname, FT_Long face_index, FT_Face* aface)

    FT_Error FT_New_Memory_Face(FT_Library library, const FT_Byte* file_base, FT_Long file_size, FT_Long face_index, FT_Face* aface)

    FT_Error FT_Open_Face(FT_Library library, const FT_Open_Args* args, FT_Long face_index, FT_Face* aface)

    FT_Error FT_Attach_File(FT_Face face, const char* filepathname)

    FT_Error FT_Attach_Stream(FT_Face face, const FT_Open_Args* parameters)

    FT_Error FT_Reference_Face(FT_Face face)

    FT_Error FT_Done_Face(FT_Face face)

    FT_Error FT_Select_Size(FT_Face face, FT_Int strike_index)

    cpdef enum FT_Size_Request_Type_:
        FT_SIZE_REQUEST_TYPE_NOMINAL
        FT_SIZE_REQUEST_TYPE_REAL_DIM
        FT_SIZE_REQUEST_TYPE_BBOX
        FT_SIZE_REQUEST_TYPE_CELL
        FT_SIZE_REQUEST_TYPE_SCALES
        FT_SIZE_REQUEST_TYPE_MAX

    ctypedef FT_Size_Request_Type_ FT_Size_Request_Type

    cdef struct FT_Size_RequestRec_:
        FT_Size_Request_Type type
        FT_Long width
        FT_Long height
        FT_UInt horiResolution
        FT_UInt vertResolution

    ctypedef FT_Size_RequestRec_ FT_Size_RequestRec

    ctypedef FT_Size_RequestRec_* FT_Size_Request

    FT_Error FT_Request_Size(FT_Face face, FT_Size_Request req)

    FT_Error FT_Set_Char_Size(FT_Face face, FT_F26Dot6 char_width, FT_F26Dot6 char_height, FT_UInt horz_resolution, FT_UInt vert_resolution)

    FT_Error FT_Set_Pixel_Sizes(FT_Face face, FT_UInt pixel_width, FT_UInt pixel_height)

    FT_Error FT_Load_Glyph(FT_Face face, FT_UInt glyph_index, FT_Int32 load_flags)

    FT_Error FT_Load_Char(FT_Face face, FT_ULong char_code, FT_Int32 load_flags)

    void FT_Set_Transform(FT_Face face, FT_Matrix* matrix, FT_Vector* delta)

    void FT_Get_Transform(FT_Face face, FT_Matrix* matrix, FT_Vector* delta)

    cpdef enum FT_Render_Mode_:
        FT_RENDER_MODE_NORMAL
        FT_RENDER_MODE_LIGHT
        FT_RENDER_MODE_MONO
        FT_RENDER_MODE_LCD
        FT_RENDER_MODE_LCD_V
        FT_RENDER_MODE_SDF
        FT_RENDER_MODE_MAX

    ctypedef FT_Render_Mode_ FT_Render_Mode

    FT_Error FT_Render_Glyph(FT_GlyphSlot slot, FT_Render_Mode render_mode)

    cpdef enum FT_Kerning_Mode_:
        FT_KERNING_DEFAULT
        FT_KERNING_UNFITTED
        FT_KERNING_UNSCALED

    ctypedef FT_Kerning_Mode_ FT_Kerning_Mode

    FT_Error FT_Get_Kerning(FT_Face face, FT_UInt left_glyph, FT_UInt right_glyph, FT_UInt kern_mode, FT_Vector* akerning)

    FT_Error FT_Get_Track_Kerning(FT_Face face, FT_Fixed point_size, FT_Int degree, FT_Fixed* akerning)

    FT_Error FT_Select_Charmap(FT_Face face, FT_Encoding encoding)

    FT_Error FT_Set_Charmap(FT_Face face, FT_CharMap charmap)

    FT_Int FT_Get_Charmap_Index(FT_CharMap charmap)

    FT_UInt FT_Get_Char_Index(FT_Face face, FT_ULong charcode)

    FT_ULong FT_Get_First_Char(FT_Face face, FT_UInt* agindex)

    FT_ULong FT_Get_Next_Char(FT_Face face, FT_ULong char_code, FT_UInt* agindex)

    FT_Error FT_Face_Properties(FT_Face face, FT_UInt num_properties, FT_Parameter* properties)

    FT_UInt FT_Get_Name_Index(FT_Face face, const FT_String* glyph_name)

    FT_Error FT_Get_Glyph_Name(FT_Face face, FT_UInt glyph_index, FT_Pointer buffer, FT_UInt buffer_max)

    const char* FT_Get_Postscript_Name(FT_Face face)

    FT_Error FT_Get_SubGlyph_Info(FT_GlyphSlot glyph, FT_UInt sub_index, FT_Int* p_index, FT_UInt* p_flags, FT_Int* p_arg1, FT_Int* p_arg2, FT_Matrix* p_transform)

    FT_UShort FT_Get_FSType_Flags(FT_Face face)

    FT_UInt FT_Face_GetCharVariantIndex(FT_Face face, FT_ULong charcode, FT_ULong variantSelector)

    FT_Int FT_Face_GetCharVariantIsDefault(FT_Face face, FT_ULong charcode, FT_ULong variantSelector)

    FT_UInt32* FT_Face_GetVariantSelectors(FT_Face face)

    FT_UInt32* FT_Face_GetVariantsOfChar(FT_Face face, FT_ULong charcode)

    FT_UInt32* FT_Face_GetCharsOfVariant(FT_Face face, FT_ULong variantSelector)

    FT_Long FT_MulDiv(FT_Long a, FT_Long b, FT_Long c)

    FT_Long FT_MulFix(FT_Long a, FT_Long b)

    FT_Long FT_DivFix(FT_Long a, FT_Long b)

    FT_Fixed FT_RoundFix(FT_Fixed a)

    FT_Fixed FT_CeilFix(FT_Fixed a)

    FT_Fixed FT_FloorFix(FT_Fixed a)

    void FT_Vector_Transform(FT_Vector* vector, const FT_Matrix* matrix)

    void FT_Library_Version(FT_Library library, FT_Int* amajor, FT_Int* aminor, FT_Int* apatch)

    FT_Bool FT_Face_CheckTrueTypePatents(FT_Face face)

    FT_Bool FT_Face_SetUnpatentedHinting(FT_Face face, FT_Bool value)

    enum:
        FT_LOAD_RENDER
