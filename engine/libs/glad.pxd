from libc.stdint cimport int32_t, uint32_t, int64_t, uint64_t

cdef extern from "glad/glad.h":
    ctypedef struct __GLsync:
        pass

    cdef struct gladGLversionStruct:
        int major
        int minor

    ctypedef void* (*GLADloadproc)(char* name)

    gladGLversionStruct GLVersion

    int gladLoadGL()

    int gladLoadGLLoader(GLADloadproc)

    ctypedef int32_t khronos_int32_t

    ctypedef uint32_t khronos_uint32_t

    ctypedef int64_t khronos_int64_t

    ctypedef uint64_t khronos_uint64_t

    ctypedef signed char khronos_int8_t

    ctypedef unsigned char khronos_uint8_t

    ctypedef signed short int khronos_int16_t

    ctypedef unsigned short int khronos_uint16_t

    ctypedef signed long int khronos_intptr_t

    ctypedef unsigned long int khronos_uintptr_t

    ctypedef signed long int khronos_ssize_t

    ctypedef unsigned long int khronos_usize_t

    ctypedef float khronos_float_t

    ctypedef khronos_uint64_t khronos_utime_nanoseconds_t

    ctypedef khronos_int64_t khronos_stime_nanoseconds_t

    ctypedef enum khronos_boolean_enum_t:
        KHRONOS_FALSE
        KHRONOS_TRUE
        KHRONOS_BOOLEAN_ENUM_FORCE_SIZE

    ctypedef unsigned int GLenum

    ctypedef unsigned char GLboolean

    ctypedef unsigned int GLbitfield

    ctypedef void GLvoid

    ctypedef khronos_int8_t GLbyte

    ctypedef khronos_uint8_t GLubyte

    ctypedef khronos_int16_t GLshort

    ctypedef khronos_uint16_t GLushort

    ctypedef int GLint

    ctypedef unsigned int GLuint

    ctypedef khronos_int32_t GLclampx

    ctypedef int GLsizei

    ctypedef khronos_float_t GLfloat

    ctypedef khronos_float_t GLclampf

    ctypedef double GLdouble

    ctypedef double GLclampd

    ctypedef void* GLeglClientBufferEXT

    ctypedef void* GLeglImageOES

    ctypedef char GLchar

    ctypedef char GLcharARB

    ctypedef void* GLhandleARB

    ctypedef khronos_uint16_t GLhalf

    ctypedef khronos_uint16_t GLhalfARB

    ctypedef khronos_int32_t GLfixed

    ctypedef khronos_intptr_t GLintptr

    ctypedef khronos_intptr_t GLintptrARB

    ctypedef khronos_ssize_t GLsizeiptr

    ctypedef khronos_ssize_t GLsizeiptrARB

    ctypedef khronos_int64_t GLint64

    ctypedef khronos_int64_t GLint64EXT

    ctypedef khronos_uint64_t GLuint64

    ctypedef khronos_uint64_t GLuint64EXT

    ctypedef __GLsync* GLsync

    cdef struct _cl_context

    cdef struct _cl_event

    ctypedef void (*GLDEBUGPROC)(GLenum source, GLenum type, GLuint id, GLenum severity, GLsizei length, GLchar* message, void* userParam)

    ctypedef void (*GLDEBUGPROCARB)(GLenum source, GLenum type, GLuint id, GLenum severity, GLsizei length, GLchar* message, void* userParam)

    ctypedef void (*GLDEBUGPROCKHR)(GLenum source, GLenum type, GLuint id, GLenum severity, GLsizei length, GLchar* message, void* userParam)

    ctypedef void (*GLDEBUGPROCAMD)(GLuint id, GLenum category, GLenum severity, GLsizei length, GLchar* message, void* userParam)

    ctypedef unsigned short GLhalfNV

    ctypedef GLintptr GLvdpauSurfaceNV

    ctypedef void (*GLVULKANPROCNV)()

    int GL_VERSION_1_0

    ctypedef void (*PFNGLCULLFACEPROC)(GLenum mode)

    PFNGLCULLFACEPROC glCullFace

    ctypedef void (*PFNGLFRONTFACEPROC)(GLenum mode)

    PFNGLFRONTFACEPROC glFrontFace

    ctypedef void (*PFNGLHINTPROC)(GLenum target, GLenum mode)

    PFNGLHINTPROC glHint

    ctypedef void (*PFNGLLINEWIDTHPROC)(GLfloat width)

    PFNGLLINEWIDTHPROC glLineWidth

    ctypedef void (*PFNGLPOINTSIZEPROC)(GLfloat size)

    PFNGLPOINTSIZEPROC glPointSize

    ctypedef void (*PFNGLPOLYGONMODEPROC)(GLenum face, GLenum mode)

    PFNGLPOLYGONMODEPROC glPolygonMode

    ctypedef void (*PFNGLSCISSORPROC)(GLint x, GLint y, GLsizei width, GLsizei height)

    PFNGLSCISSORPROC glScissor

    ctypedef void (*PFNGLTEXPARAMETERFPROC)(GLenum target, GLenum pname, GLfloat param)

    PFNGLTEXPARAMETERFPROC glTexParameterf

    ctypedef void (*PFNGLTEXPARAMETERFVPROC)(GLenum target, GLenum pname, GLfloat* params)

    PFNGLTEXPARAMETERFVPROC glTexParameterfv

    ctypedef void (*PFNGLTEXPARAMETERIPROC)(GLenum target, GLenum pname, GLint param)

    PFNGLTEXPARAMETERIPROC glTexParameteri

    ctypedef void (*PFNGLTEXPARAMETERIVPROC)(GLenum target, GLenum pname, GLint* params)

    PFNGLTEXPARAMETERIVPROC glTexParameteriv

    ctypedef void (*PFNGLTEXIMAGE1DPROC)(GLenum target, GLint level, GLint internalformat, GLsizei width, GLint border, GLenum format, GLenum type, void* pixels)

    PFNGLTEXIMAGE1DPROC glTexImage1D

    ctypedef void (*PFNGLTEXIMAGE2DPROC)(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, void* pixels)

    PFNGLTEXIMAGE2DPROC glTexImage2D

    ctypedef void (*PFNGLDRAWBUFFERPROC)(GLenum buf)

    PFNGLDRAWBUFFERPROC glDrawBuffer

    ctypedef void (*PFNGLCLEARPROC)(GLbitfield mask)

    PFNGLCLEARPROC glClear

    ctypedef void (*PFNGLCLEARCOLORPROC)(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)

    PFNGLCLEARCOLORPROC glClearColor

    ctypedef void (*PFNGLCLEARSTENCILPROC)(GLint s)

    PFNGLCLEARSTENCILPROC glClearStencil

    ctypedef void (*PFNGLCLEARDEPTHPROC)(GLdouble depth)

    PFNGLCLEARDEPTHPROC glClearDepth

    ctypedef void (*PFNGLSTENCILMASKPROC)(GLuint mask)

    PFNGLSTENCILMASKPROC glStencilMask

    ctypedef void (*PFNGLCOLORMASKPROC)(GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha)

    PFNGLCOLORMASKPROC glColorMask

    ctypedef void (*PFNGLDEPTHMASKPROC)(GLboolean flag)

    PFNGLDEPTHMASKPROC glDepthMask

    ctypedef void (*PFNGLDISABLEPROC)(GLenum cap)

    PFNGLDISABLEPROC glDisable

    ctypedef void (*PFNGLENABLEPROC)(GLenum cap)

    PFNGLENABLEPROC glad_glEnable

    PFNGLENABLEPROC glEnable "glad_glEnable"

    ctypedef void (*PFNGLFINISHPROC)()

    PFNGLFINISHPROC glFinish

    ctypedef void (*PFNGLFLUSHPROC)()

    PFNGLFLUSHPROC glFlush

    ctypedef void (*PFNGLBLENDFUNCPROC)(GLenum sfactor, GLenum dfactor)

    PFNGLBLENDFUNCPROC glBlendFunc

    ctypedef void (*PFNGLLOGICOPPROC)(GLenum opcode)

    PFNGLLOGICOPPROC glLogicOp

    ctypedef void (*PFNGLSTENCILFUNCPROC)(GLenum func, GLint ref, GLuint mask)

    PFNGLSTENCILFUNCPROC glStencilFunc

    ctypedef void (*PFNGLSTENCILOPPROC)(GLenum fail, GLenum zfail, GLenum zpass)

    PFNGLSTENCILOPPROC glStencilOp

    ctypedef void (*PFNGLDEPTHFUNCPROC)(GLenum func)

    PFNGLDEPTHFUNCPROC glDepthFunc

    ctypedef void (*PFNGLPIXELSTOREFPROC)(GLenum pname, GLfloat param)

    PFNGLPIXELSTOREFPROC glPixelStoref

    ctypedef void (*PFNGLPIXELSTOREIPROC)(GLenum pname, GLint param)

    PFNGLPIXELSTOREIPROC glPixelStorei

    ctypedef void (*PFNGLREADBUFFERPROC)(GLenum src)

    PFNGLREADBUFFERPROC glReadBuffer

    ctypedef void (*PFNGLREADPIXELSPROC)(GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, void* pixels)

    PFNGLREADPIXELSPROC glReadPixels

    ctypedef void (*PFNGLGETBOOLEANVPROC)(GLenum pname, GLboolean* data)

    PFNGLGETBOOLEANVPROC glGetBooleanv

    ctypedef void (*PFNGLGETDOUBLEVPROC)(GLenum pname, GLdouble* data)

    PFNGLGETDOUBLEVPROC glGetDoublev

    ctypedef GLenum (*PFNGLGETERRORPROC)()

    PFNGLGETERRORPROC glGetError

    ctypedef void (*PFNGLGETFLOATVPROC)(GLenum pname, GLfloat* data)

    PFNGLGETFLOATVPROC glGetFloatv

    ctypedef void (*PFNGLGETINTEGERVPROC)(GLenum pname, GLint* data)

    PFNGLGETINTEGERVPROC glGetIntegerv

    ctypedef GLubyte* (*PFNGLGETSTRINGPROC)(GLenum name)

    PFNGLGETSTRINGPROC glGetString

    ctypedef void (*PFNGLGETTEXIMAGEPROC)(GLenum target, GLint level, GLenum format, GLenum type, void* pixels)

    PFNGLGETTEXIMAGEPROC glGetTexImage

    ctypedef void (*PFNGLGETTEXPARAMETERFVPROC)(GLenum target, GLenum pname, GLfloat* params)

    PFNGLGETTEXPARAMETERFVPROC glGetTexParameterfv

    ctypedef void (*PFNGLGETTEXPARAMETERIVPROC)(GLenum target, GLenum pname, GLint* params)

    PFNGLGETTEXPARAMETERIVPROC glGetTexParameteriv

    ctypedef void (*PFNGLGETTEXLEVELPARAMETERFVPROC)(GLenum target, GLint level, GLenum pname, GLfloat* params)

    PFNGLGETTEXLEVELPARAMETERFVPROC glGetTexLevelParameterfv

    ctypedef void (*PFNGLGETTEXLEVELPARAMETERIVPROC)(GLenum target, GLint level, GLenum pname, GLint* params)

    PFNGLGETTEXLEVELPARAMETERIVPROC glGetTexLevelParameteriv

    ctypedef GLboolean (*PFNGLISENABLEDPROC)(GLenum cap)

    PFNGLISENABLEDPROC glIsEnabled

    ctypedef void (*PFNGLDEPTHRANGEPROC)(GLdouble n, GLdouble f)

    PFNGLDEPTHRANGEPROC glDepthRange

    ctypedef void (*PFNGLVIEWPORTPROC)(GLint x, GLint y, GLsizei width, GLsizei height)

    PFNGLVIEWPORTPROC glViewport

    int GL_VERSION_1_1

    ctypedef void (*PFNGLDRAWARRAYSPROC)(GLenum mode, GLint first, GLsizei count)

    PFNGLDRAWARRAYSPROC glDrawArrays

    ctypedef void (*PFNGLDRAWELEMENTSPROC)(GLenum mode, GLsizei count, GLenum type, void* indices)

    PFNGLDRAWELEMENTSPROC glDrawElements

    ctypedef void (*PFNGLPOLYGONOFFSETPROC)(GLfloat factor, GLfloat units)

    PFNGLPOLYGONOFFSETPROC glPolygonOffset

    ctypedef void (*PFNGLCOPYTEXIMAGE1DPROC)(GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLint border)

    PFNGLCOPYTEXIMAGE1DPROC glCopyTexImage1D

    ctypedef void (*PFNGLCOPYTEXIMAGE2DPROC)(GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border)

    PFNGLCOPYTEXIMAGE2DPROC glCopyTexImage2D

    ctypedef void (*PFNGLCOPYTEXSUBIMAGE1DPROC)(GLenum target, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width)

    PFNGLCOPYTEXSUBIMAGE1DPROC glCopyTexSubImage1D

    ctypedef void (*PFNGLCOPYTEXSUBIMAGE2DPROC)(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height)

    PFNGLCOPYTEXSUBIMAGE2DPROC glCopyTexSubImage2D

    ctypedef void (*PFNGLTEXSUBIMAGE1DPROC)(GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLenum type, void* pixels)

    PFNGLTEXSUBIMAGE1DPROC glTexSubImage1D

    ctypedef void (*PFNGLTEXSUBIMAGE2DPROC)(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, void* pixels)

    PFNGLTEXSUBIMAGE2DPROC glTexSubImage2D

    ctypedef void (*PFNGLBINDTEXTUREPROC)(GLenum target, GLuint texture)

    PFNGLBINDTEXTUREPROC glBindTexture

    ctypedef void (*PFNGLDELETETEXTURESPROC)(GLsizei n, GLuint* textures)

    PFNGLDELETETEXTURESPROC glDeleteTextures

    ctypedef void (*PFNGLGENTEXTURESPROC)(GLsizei n, GLuint* textures)

    PFNGLGENTEXTURESPROC glGenTextures

    ctypedef GLboolean (*PFNGLISTEXTUREPROC)(GLuint texture)

    PFNGLISTEXTUREPROC glIsTexture

    int GL_VERSION_1_2

    ctypedef void (*PFNGLDRAWRANGEELEMENTSPROC)(GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, void* indices)

    PFNGLDRAWRANGEELEMENTSPROC glDrawRangeElements

    ctypedef void (*PFNGLTEXIMAGE3DPROC)(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, void* pixels)

    PFNGLTEXIMAGE3DPROC glTexImage3D

    ctypedef void (*PFNGLTEXSUBIMAGE3DPROC)(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, void* pixels)

    PFNGLTEXSUBIMAGE3DPROC glTexSubImage3D

    ctypedef void (*PFNGLCOPYTEXSUBIMAGE3DPROC)(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height)

    PFNGLCOPYTEXSUBIMAGE3DPROC glCopyTexSubImage3D

    int GL_VERSION_1_3

    ctypedef void (*PFNGLACTIVETEXTUREPROC)(GLenum texture)

    PFNGLACTIVETEXTUREPROC glActiveTexture

    ctypedef void (*PFNGLSAMPLECOVERAGEPROC)(GLfloat value, GLboolean invert)

    PFNGLSAMPLECOVERAGEPROC glSampleCoverage

    ctypedef void (*PFNGLCOMPRESSEDTEXIMAGE3DPROC)(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, void* data)

    PFNGLCOMPRESSEDTEXIMAGE3DPROC glCompressedTexImage3D

    ctypedef void (*PFNGLCOMPRESSEDTEXIMAGE2DPROC)(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, void* data)

    PFNGLCOMPRESSEDTEXIMAGE2DPROC glCompressedTexImage2D

    ctypedef void (*PFNGLCOMPRESSEDTEXIMAGE1DPROC)(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize, void* data)

    PFNGLCOMPRESSEDTEXIMAGE1DPROC glCompressedTexImage1D

    ctypedef void (*PFNGLCOMPRESSEDTEXSUBIMAGE3DPROC)(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, void* data)

    PFNGLCOMPRESSEDTEXSUBIMAGE3DPROC glCompressedTexSubImage3D

    ctypedef void (*PFNGLCOMPRESSEDTEXSUBIMAGE2DPROC)(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, void* data)

    PFNGLCOMPRESSEDTEXSUBIMAGE2DPROC glCompressedTexSubImage2D

    ctypedef void (*PFNGLCOMPRESSEDTEXSUBIMAGE1DPROC)(GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, void* data)

    PFNGLCOMPRESSEDTEXSUBIMAGE1DPROC glCompressedTexSubImage1D

    ctypedef void (*PFNGLGETCOMPRESSEDTEXIMAGEPROC)(GLenum target, GLint level, void* img)

    PFNGLGETCOMPRESSEDTEXIMAGEPROC glGetCompressedTexImage

    int GL_VERSION_1_4

    ctypedef void (*PFNGLBLENDFUNCSEPARATEPROC)(GLenum sfactorRGB, GLenum dfactorRGB, GLenum sfactorAlpha, GLenum dfactorAlpha)

    PFNGLBLENDFUNCSEPARATEPROC glBlendFuncSeparate

    ctypedef void (*PFNGLMULTIDRAWARRAYSPROC)(GLenum mode, GLint* first, GLsizei* count, GLsizei drawcount)

    PFNGLMULTIDRAWARRAYSPROC glMultiDrawArrays

    ctypedef void (*PFNGLMULTIDRAWELEMENTSPROC)(GLenum mode, GLsizei* count, GLenum type, void** indices, GLsizei drawcount)

    PFNGLMULTIDRAWELEMENTSPROC glMultiDrawElements

    ctypedef void (*PFNGLPOINTPARAMETERFPROC)(GLenum pname, GLfloat param)

    PFNGLPOINTPARAMETERFPROC glPointParameterf

    ctypedef void (*PFNGLPOINTPARAMETERFVPROC)(GLenum pname, GLfloat* params)

    PFNGLPOINTPARAMETERFVPROC glPointParameterfv

    ctypedef void (*PFNGLPOINTPARAMETERIPROC)(GLenum pname, GLint param)

    PFNGLPOINTPARAMETERIPROC glPointParameteri

    ctypedef void (*PFNGLPOINTPARAMETERIVPROC)(GLenum pname, GLint* params)

    PFNGLPOINTPARAMETERIVPROC glPointParameteriv

    ctypedef void (*PFNGLBLENDCOLORPROC)(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)

    PFNGLBLENDCOLORPROC glBlendColor

    ctypedef void (*PFNGLBLENDEQUATIONPROC)(GLenum mode)

    PFNGLBLENDEQUATIONPROC glBlendEquation

    int GL_VERSION_1_5

    ctypedef void (*PFNGLGENQUERIESPROC)(GLsizei n, GLuint* ids)

    PFNGLGENQUERIESPROC glGenQueries

    ctypedef void (*PFNGLDELETEQUERIESPROC)(GLsizei n, GLuint* ids)

    PFNGLDELETEQUERIESPROC glDeleteQueries

    ctypedef GLboolean (*PFNGLISQUERYPROC)(GLuint id)

    PFNGLISQUERYPROC glIsQuery

    ctypedef void (*PFNGLBEGINQUERYPROC)(GLenum target, GLuint id)

    PFNGLBEGINQUERYPROC glBeginQuery

    ctypedef void (*PFNGLENDQUERYPROC)(GLenum target)

    PFNGLENDQUERYPROC glEndQuery

    ctypedef void (*PFNGLGETQUERYIVPROC)(GLenum target, GLenum pname, GLint* params)

    PFNGLGETQUERYIVPROC glGetQueryiv

    ctypedef void (*PFNGLGETQUERYOBJECTIVPROC)(GLuint id, GLenum pname, GLint* params)

    PFNGLGETQUERYOBJECTIVPROC glGetQueryObjectiv

    ctypedef void (*PFNGLGETQUERYOBJECTUIVPROC)(GLuint id, GLenum pname, GLuint* params)

    PFNGLGETQUERYOBJECTUIVPROC glGetQueryObjectuiv

    ctypedef void (*PFNGLBINDBUFFERPROC)(GLenum target, GLuint buffer)

    PFNGLBINDBUFFERPROC glBindBuffer

    ctypedef void (*PFNGLDELETEBUFFERSPROC)(GLsizei n, GLuint* buffers)

    PFNGLDELETEBUFFERSPROC glDeleteBuffers

    ctypedef void (*PFNGLGENBUFFERSPROC)(GLsizei n, GLuint* buffers)

    PFNGLGENBUFFERSPROC glGenBuffers

    ctypedef GLboolean (*PFNGLISBUFFERPROC)(GLuint buffer)

    PFNGLISBUFFERPROC glIsBuffer

    ctypedef void (*PFNGLBUFFERDATAPROC)(GLenum target, GLsizeiptr size, void* data, GLenum usage)

    PFNGLBUFFERDATAPROC glBufferData

    ctypedef void (*PFNGLBUFFERSUBDATAPROC)(GLenum target, GLintptr offset, GLsizeiptr size, void* data)

    PFNGLBUFFERSUBDATAPROC glBufferSubData

    ctypedef void (*PFNGLGETBUFFERSUBDATAPROC)(GLenum target, GLintptr offset, GLsizeiptr size, void* data)

    PFNGLGETBUFFERSUBDATAPROC glGetBufferSubData

    ctypedef void* (*PFNGLMAPBUFFERPROC)(GLenum target, GLenum access)

    PFNGLMAPBUFFERPROC glMapBuffer

    ctypedef GLboolean (*PFNGLUNMAPBUFFERPROC)(GLenum target)

    PFNGLUNMAPBUFFERPROC glUnmapBuffer

    ctypedef void (*PFNGLGETBUFFERPARAMETERIVPROC)(GLenum target, GLenum pname, GLint* params)

    PFNGLGETBUFFERPARAMETERIVPROC glGetBufferParameteriv

    ctypedef void (*PFNGLGETBUFFERPOINTERVPROC)(GLenum target, GLenum pname, void** params)

    PFNGLGETBUFFERPOINTERVPROC glGetBufferPointerv

    int GL_VERSION_2_0

    ctypedef void (*PFNGLBLENDEQUATIONSEPARATEPROC)(GLenum modeRGB, GLenum modeAlpha)

    PFNGLBLENDEQUATIONSEPARATEPROC glBlendEquationSeparate

    ctypedef void (*PFNGLDRAWBUFFERSPROC)(GLsizei n, GLenum* bufs)

    PFNGLDRAWBUFFERSPROC glDrawBuffers

    ctypedef void (*PFNGLSTENCILOPSEPARATEPROC)(GLenum face, GLenum sfail, GLenum dpfail, GLenum dppass)

    PFNGLSTENCILOPSEPARATEPROC glStencilOpSeparate

    ctypedef void (*PFNGLSTENCILFUNCSEPARATEPROC)(GLenum face, GLenum func, GLint ref, GLuint mask)

    PFNGLSTENCILFUNCSEPARATEPROC glStencilFuncSeparate

    ctypedef void (*PFNGLSTENCILMASKSEPARATEPROC)(GLenum face, GLuint mask)

    PFNGLSTENCILMASKSEPARATEPROC glStencilMaskSeparate

    ctypedef void (*PFNGLATTACHSHADERPROC)(GLuint program, GLuint shader)

    PFNGLATTACHSHADERPROC glAttachShader

    ctypedef void (*PFNGLBINDATTRIBLOCATIONPROC)(GLuint program, GLuint index, GLchar* name)

    PFNGLBINDATTRIBLOCATIONPROC glBindAttribLocation

    ctypedef void (*PFNGLCOMPILESHADERPROC)(GLuint shader)

    PFNGLCOMPILESHADERPROC glCompileShader

    ctypedef GLuint (*PFNGLCREATEPROGRAMPROC)()

    PFNGLCREATEPROGRAMPROC glCreateProgram

    ctypedef GLuint (*PFNGLCREATESHADERPROC)(GLenum type)

    PFNGLCREATESHADERPROC glCreateShader

    ctypedef void (*PFNGLDELETEPROGRAMPROC)(GLuint program)

    PFNGLDELETEPROGRAMPROC glDeleteProgram

    ctypedef void (*PFNGLDELETESHADERPROC)(GLuint shader)

    PFNGLDELETESHADERPROC glDeleteShader

    ctypedef void (*PFNGLDETACHSHADERPROC)(GLuint program, GLuint shader)

    PFNGLDETACHSHADERPROC glDetachShader

    ctypedef void (*PFNGLDISABLEVERTEXATTRIBARRAYPROC)(GLuint index)

    PFNGLDISABLEVERTEXATTRIBARRAYPROC glDisableVertexAttribArray

    ctypedef void (*PFNGLENABLEVERTEXATTRIBARRAYPROC)(GLuint index)

    PFNGLENABLEVERTEXATTRIBARRAYPROC glEnableVertexAttribArray

    ctypedef void (*PFNGLGETACTIVEATTRIBPROC)(GLuint program, GLuint index, GLsizei bufSize, GLsizei* length, GLint* size, GLenum* type, GLchar* name)

    PFNGLGETACTIVEATTRIBPROC glGetActiveAttrib

    ctypedef void (*PFNGLGETACTIVEUNIFORMPROC)(GLuint program, GLuint index, GLsizei bufSize, GLsizei* length, GLint* size, GLenum* type, GLchar* name)

    PFNGLGETACTIVEUNIFORMPROC glGetActiveUniform

    ctypedef void (*PFNGLGETATTACHEDSHADERSPROC)(GLuint program, GLsizei maxCount, GLsizei* count, GLuint* shaders)

    PFNGLGETATTACHEDSHADERSPROC glGetAttachedShaders

    ctypedef GLint (*PFNGLGETATTRIBLOCATIONPROC)(GLuint program, GLchar* name)

    PFNGLGETATTRIBLOCATIONPROC glGetAttribLocation

    ctypedef void (*PFNGLGETPROGRAMIVPROC)(GLuint program, GLenum pname, GLint* params)

    PFNGLGETPROGRAMIVPROC glGetProgramiv

    ctypedef void (*PFNGLGETPROGRAMINFOLOGPROC)(GLuint program, GLsizei bufSize, GLsizei* length, GLchar* infoLog)

    PFNGLGETPROGRAMINFOLOGPROC glGetProgramInfoLog

    ctypedef void (*PFNGLGETSHADERIVPROC)(GLuint shader, GLenum pname, GLint* params)

    PFNGLGETSHADERIVPROC glGetShaderiv

    ctypedef void (*PFNGLGETSHADERINFOLOGPROC)(GLuint shader, GLsizei bufSize, GLsizei* length, GLchar* infoLog)

    PFNGLGETSHADERINFOLOGPROC glGetShaderInfoLog

    ctypedef void (*PFNGLGETSHADERSOURCEPROC)(GLuint shader, GLsizei bufSize, GLsizei* length, GLchar* source)

    PFNGLGETSHADERSOURCEPROC glGetShaderSource

    ctypedef GLint (*PFNGLGETUNIFORMLOCATIONPROC)(GLuint program, GLchar* name)

    PFNGLGETUNIFORMLOCATIONPROC glGetUniformLocation

    ctypedef void (*PFNGLGETUNIFORMFVPROC)(GLuint program, GLint location, GLfloat* params)

    PFNGLGETUNIFORMFVPROC glGetUniformfv

    ctypedef void (*PFNGLGETUNIFORMIVPROC)(GLuint program, GLint location, GLint* params)

    PFNGLGETUNIFORMIVPROC glGetUniformiv

    ctypedef void (*PFNGLGETVERTEXATTRIBDVPROC)(GLuint index, GLenum pname, GLdouble* params)

    PFNGLGETVERTEXATTRIBDVPROC glGetVertexAttribdv

    ctypedef void (*PFNGLGETVERTEXATTRIBFVPROC)(GLuint index, GLenum pname, GLfloat* params)

    PFNGLGETVERTEXATTRIBFVPROC glGetVertexAttribfv

    ctypedef void (*PFNGLGETVERTEXATTRIBIVPROC)(GLuint index, GLenum pname, GLint* params)

    PFNGLGETVERTEXATTRIBIVPROC glGetVertexAttribiv

    ctypedef void (*PFNGLGETVERTEXATTRIBPOINTERVPROC)(GLuint index, GLenum pname, void** pointer)

    PFNGLGETVERTEXATTRIBPOINTERVPROC glGetVertexAttribPointerv

    ctypedef GLboolean (*PFNGLISPROGRAMPROC)(GLuint program)

    PFNGLISPROGRAMPROC glIsProgram

    ctypedef GLboolean (*PFNGLISSHADERPROC)(GLuint shader)

    PFNGLISSHADERPROC glIsShader

    ctypedef void (*PFNGLLINKPROGRAMPROC)(GLuint program)

    PFNGLLINKPROGRAMPROC glLinkProgram

    ctypedef void (*PFNGLSHADERSOURCEPROC)(GLuint shader, GLsizei count, GLchar** string, GLint* length)

    PFNGLSHADERSOURCEPROC glShaderSource

    ctypedef void (*PFNGLUSEPROGRAMPROC)(GLuint program)

    PFNGLUSEPROGRAMPROC glUseProgram

    ctypedef void (*PFNGLUNIFORM1FPROC)(GLint location, GLfloat v0)

    PFNGLUNIFORM1FPROC glUniform1f

    ctypedef void (*PFNGLUNIFORM2FPROC)(GLint location, GLfloat v0, GLfloat v1)

    PFNGLUNIFORM2FPROC glUniform2f

    ctypedef void (*PFNGLUNIFORM3FPROC)(GLint location, GLfloat v0, GLfloat v1, GLfloat v2)

    PFNGLUNIFORM3FPROC glUniform3f

    ctypedef void (*PFNGLUNIFORM4FPROC)(GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3)

    PFNGLUNIFORM4FPROC glUniform4f

    ctypedef void (*PFNGLUNIFORM1IPROC)(GLint location, GLint v0)

    PFNGLUNIFORM1IPROC glUniform1i

    ctypedef void (*PFNGLUNIFORM2IPROC)(GLint location, GLint v0, GLint v1)

    PFNGLUNIFORM2IPROC glUniform2i

    ctypedef void (*PFNGLUNIFORM3IPROC)(GLint location, GLint v0, GLint v1, GLint v2)

    PFNGLUNIFORM3IPROC glUniform3i

    ctypedef void (*PFNGLUNIFORM4IPROC)(GLint location, GLint v0, GLint v1, GLint v2, GLint v3)

    PFNGLUNIFORM4IPROC glUniform4i

    ctypedef void (*PFNGLUNIFORM1FVPROC)(GLint location, GLsizei count, GLfloat* value)

    PFNGLUNIFORM1FVPROC glUniform1fv

    ctypedef void (*PFNGLUNIFORM2FVPROC)(GLint location, GLsizei count, GLfloat* value)

    PFNGLUNIFORM2FVPROC glUniform2fv

    ctypedef void (*PFNGLUNIFORM3FVPROC)(GLint location, GLsizei count, GLfloat* value)

    PFNGLUNIFORM3FVPROC glUniform3fv

    ctypedef void (*PFNGLUNIFORM4FVPROC)(GLint location, GLsizei count, GLfloat* value)

    PFNGLUNIFORM4FVPROC glUniform4fv

    ctypedef void (*PFNGLUNIFORM1IVPROC)(GLint location, GLsizei count, GLint* value)

    PFNGLUNIFORM1IVPROC glUniform1iv

    ctypedef void (*PFNGLUNIFORM2IVPROC)(GLint location, GLsizei count, GLint* value)

    PFNGLUNIFORM2IVPROC glUniform2iv

    ctypedef void (*PFNGLUNIFORM3IVPROC)(GLint location, GLsizei count, GLint* value)

    PFNGLUNIFORM3IVPROC glUniform3iv

    ctypedef void (*PFNGLUNIFORM4IVPROC)(GLint location, GLsizei count, GLint* value)

    PFNGLUNIFORM4IVPROC glUniform4iv

    ctypedef void (*PFNGLUNIFORMMATRIX2FVPROC)(GLint location, GLsizei count, GLboolean transpose, GLfloat* value)

    PFNGLUNIFORMMATRIX2FVPROC glUniformMatrix2fv

    ctypedef void (*PFNGLUNIFORMMATRIX3FVPROC)(GLint location, GLsizei count, GLboolean transpose, GLfloat* value)

    PFNGLUNIFORMMATRIX3FVPROC glUniformMatrix3fv

    ctypedef void (*PFNGLUNIFORMMATRIX4FVPROC)(GLint location, GLsizei count, GLboolean transpose, GLfloat* value)

    PFNGLUNIFORMMATRIX4FVPROC glUniformMatrix4fv

    ctypedef void (*PFNGLVALIDATEPROGRAMPROC)(GLuint program)

    PFNGLVALIDATEPROGRAMPROC glValidateProgram

    ctypedef void (*PFNGLVERTEXATTRIB1DPROC)(GLuint index, GLdouble x)

    PFNGLVERTEXATTRIB1DPROC glVertexAttrib1d

    ctypedef void (*PFNGLVERTEXATTRIB1DVPROC)(GLuint index, GLdouble* v)

    PFNGLVERTEXATTRIB1DVPROC glVertexAttrib1dv

    ctypedef void (*PFNGLVERTEXATTRIB1FPROC)(GLuint index, GLfloat x)

    PFNGLVERTEXATTRIB1FPROC glVertexAttrib1f

    ctypedef void (*PFNGLVERTEXATTRIB1FVPROC)(GLuint index, GLfloat* v)

    PFNGLVERTEXATTRIB1FVPROC glVertexAttrib1fv

    ctypedef void (*PFNGLVERTEXATTRIB1SPROC)(GLuint index, GLshort x)

    PFNGLVERTEXATTRIB1SPROC glVertexAttrib1s

    ctypedef void (*PFNGLVERTEXATTRIB1SVPROC)(GLuint index, GLshort* v)

    PFNGLVERTEXATTRIB1SVPROC glVertexAttrib1sv

    ctypedef void (*PFNGLVERTEXATTRIB2DPROC)(GLuint index, GLdouble x, GLdouble y)

    PFNGLVERTEXATTRIB2DPROC glVertexAttrib2d

    ctypedef void (*PFNGLVERTEXATTRIB2DVPROC)(GLuint index, GLdouble* v)

    PFNGLVERTEXATTRIB2DVPROC glVertexAttrib2dv

    ctypedef void (*PFNGLVERTEXATTRIB2FPROC)(GLuint index, GLfloat x, GLfloat y)

    PFNGLVERTEXATTRIB2FPROC glVertexAttrib2f

    ctypedef void (*PFNGLVERTEXATTRIB2FVPROC)(GLuint index, GLfloat* v)

    PFNGLVERTEXATTRIB2FVPROC glVertexAttrib2fv

    ctypedef void (*PFNGLVERTEXATTRIB2SPROC)(GLuint index, GLshort x, GLshort y)

    PFNGLVERTEXATTRIB2SPROC glVertexAttrib2s

    ctypedef void (*PFNGLVERTEXATTRIB2SVPROC)(GLuint index, GLshort* v)

    PFNGLVERTEXATTRIB2SVPROC glVertexAttrib2sv

    ctypedef void (*PFNGLVERTEXATTRIB3DPROC)(GLuint index, GLdouble x, GLdouble y, GLdouble z)

    PFNGLVERTEXATTRIB3DPROC glVertexAttrib3d

    ctypedef void (*PFNGLVERTEXATTRIB3DVPROC)(GLuint index, GLdouble* v)

    PFNGLVERTEXATTRIB3DVPROC glVertexAttrib3dv

    ctypedef void (*PFNGLVERTEXATTRIB3FPROC)(GLuint index, GLfloat x, GLfloat y, GLfloat z)

    PFNGLVERTEXATTRIB3FPROC glVertexAttrib3f

    ctypedef void (*PFNGLVERTEXATTRIB3FVPROC)(GLuint index, GLfloat* v)

    PFNGLVERTEXATTRIB3FVPROC glVertexAttrib3fv

    ctypedef void (*PFNGLVERTEXATTRIB3SPROC)(GLuint index, GLshort x, GLshort y, GLshort z)

    PFNGLVERTEXATTRIB3SPROC glVertexAttrib3s

    ctypedef void (*PFNGLVERTEXATTRIB3SVPROC)(GLuint index, GLshort* v)

    PFNGLVERTEXATTRIB3SVPROC glVertexAttrib3sv

    ctypedef void (*PFNGLVERTEXATTRIB4NBVPROC)(GLuint index, GLbyte* v)

    PFNGLVERTEXATTRIB4NBVPROC glVertexAttrib4Nbv

    ctypedef void (*PFNGLVERTEXATTRIB4NIVPROC)(GLuint index, GLint* v)

    PFNGLVERTEXATTRIB4NIVPROC glVertexAttrib4Niv

    ctypedef void (*PFNGLVERTEXATTRIB4NSVPROC)(GLuint index, GLshort* v)

    PFNGLVERTEXATTRIB4NSVPROC glVertexAttrib4Nsv

    ctypedef void (*PFNGLVERTEXATTRIB4NUBPROC)(GLuint index, GLubyte x, GLubyte y, GLubyte z, GLubyte w)

    PFNGLVERTEXATTRIB4NUBPROC glVertexAttrib4Nub

    ctypedef void (*PFNGLVERTEXATTRIB4NUBVPROC)(GLuint index, GLubyte* v)

    PFNGLVERTEXATTRIB4NUBVPROC glVertexAttrib4Nubv

    ctypedef void (*PFNGLVERTEXATTRIB4NUIVPROC)(GLuint index, GLuint* v)

    PFNGLVERTEXATTRIB4NUIVPROC glVertexAttrib4Nuiv

    ctypedef void (*PFNGLVERTEXATTRIB4NUSVPROC)(GLuint index, GLushort* v)

    PFNGLVERTEXATTRIB4NUSVPROC glVertexAttrib4Nusv

    ctypedef void (*PFNGLVERTEXATTRIB4BVPROC)(GLuint index, GLbyte* v)

    PFNGLVERTEXATTRIB4BVPROC glVertexAttrib4bv

    ctypedef void (*PFNGLVERTEXATTRIB4DPROC)(GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w)

    PFNGLVERTEXATTRIB4DPROC glVertexAttrib4d

    ctypedef void (*PFNGLVERTEXATTRIB4DVPROC)(GLuint index, GLdouble* v)

    PFNGLVERTEXATTRIB4DVPROC glVertexAttrib4dv

    ctypedef void (*PFNGLVERTEXATTRIB4FPROC)(GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w)

    PFNGLVERTEXATTRIB4FPROC glVertexAttrib4f

    ctypedef void (*PFNGLVERTEXATTRIB4FVPROC)(GLuint index, GLfloat* v)

    PFNGLVERTEXATTRIB4FVPROC glVertexAttrib4fv

    ctypedef void (*PFNGLVERTEXATTRIB4IVPROC)(GLuint index, GLint* v)

    PFNGLVERTEXATTRIB4IVPROC glVertexAttrib4iv

    ctypedef void (*PFNGLVERTEXATTRIB4SPROC)(GLuint index, GLshort x, GLshort y, GLshort z, GLshort w)

    PFNGLVERTEXATTRIB4SPROC glVertexAttrib4s

    ctypedef void (*PFNGLVERTEXATTRIB4SVPROC)(GLuint index, GLshort* v)

    PFNGLVERTEXATTRIB4SVPROC glVertexAttrib4sv

    ctypedef void (*PFNGLVERTEXATTRIB4UBVPROC)(GLuint index, GLubyte* v)

    PFNGLVERTEXATTRIB4UBVPROC glVertexAttrib4ubv

    ctypedef void (*PFNGLVERTEXATTRIB4UIVPROC)(GLuint index, GLuint* v)

    PFNGLVERTEXATTRIB4UIVPROC glVertexAttrib4uiv

    ctypedef void (*PFNGLVERTEXATTRIB4USVPROC)(GLuint index, GLushort* v)

    PFNGLVERTEXATTRIB4USVPROC glVertexAttrib4usv

    ctypedef void (*PFNGLVERTEXATTRIBPOINTERPROC)(GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, void* pointer)

    PFNGLVERTEXATTRIBPOINTERPROC glVertexAttribPointer

    int GL_VERSION_2_1

    ctypedef void (*PFNGLUNIFORMMATRIX2X3FVPROC)(GLint location, GLsizei count, GLboolean transpose, GLfloat* value)

    PFNGLUNIFORMMATRIX2X3FVPROC glUniformMatrix2x3fv

    ctypedef void (*PFNGLUNIFORMMATRIX3X2FVPROC)(GLint location, GLsizei count, GLboolean transpose, GLfloat* value)

    PFNGLUNIFORMMATRIX3X2FVPROC glUniformMatrix3x2fv

    ctypedef void (*PFNGLUNIFORMMATRIX2X4FVPROC)(GLint location, GLsizei count, GLboolean transpose, GLfloat* value)

    PFNGLUNIFORMMATRIX2X4FVPROC glUniformMatrix2x4fv

    ctypedef void (*PFNGLUNIFORMMATRIX4X2FVPROC)(GLint location, GLsizei count, GLboolean transpose, GLfloat* value)

    PFNGLUNIFORMMATRIX4X2FVPROC glUniformMatrix4x2fv

    ctypedef void (*PFNGLUNIFORMMATRIX3X4FVPROC)(GLint location, GLsizei count, GLboolean transpose, GLfloat* value)

    PFNGLUNIFORMMATRIX3X4FVPROC glUniformMatrix3x4fv

    ctypedef void (*PFNGLUNIFORMMATRIX4X3FVPROC)(GLint location, GLsizei count, GLboolean transpose, GLfloat* value)

    PFNGLUNIFORMMATRIX4X3FVPROC glUniformMatrix4x3fv

    int GL_VERSION_3_0

    ctypedef void (*PFNGLCOLORMASKIPROC)(GLuint index, GLboolean r, GLboolean g, GLboolean b, GLboolean a)

    PFNGLCOLORMASKIPROC glColorMaski

    ctypedef void (*PFNGLGETBOOLEANI_VPROC)(GLenum target, GLuint index, GLboolean* data)

    PFNGLGETBOOLEANI_VPROC glGetBooleani_v

    ctypedef void (*PFNGLGETINTEGERI_VPROC)(GLenum target, GLuint index, GLint* data)

    PFNGLGETINTEGERI_VPROC glGetIntegeri_v

    ctypedef void (*PFNGLENABLEIPROC)(GLenum target, GLuint index)

    PFNGLENABLEIPROC glEnablei

    ctypedef void (*PFNGLDISABLEIPROC)(GLenum target, GLuint index)

    PFNGLDISABLEIPROC glDisablei

    ctypedef GLboolean (*PFNGLISENABLEDIPROC)(GLenum target, GLuint index)

    PFNGLISENABLEDIPROC glIsEnabledi

    ctypedef void (*PFNGLBEGINTRANSFORMFEEDBACKPROC)(GLenum primitiveMode)

    PFNGLBEGINTRANSFORMFEEDBACKPROC glBeginTransformFeedback

    ctypedef void (*PFNGLENDTRANSFORMFEEDBACKPROC)()

    PFNGLENDTRANSFORMFEEDBACKPROC glEndTransformFeedback

    ctypedef void (*PFNGLBINDBUFFERRANGEPROC)(GLenum target, GLuint index, GLuint buffer, GLintptr offset, GLsizeiptr size)

    PFNGLBINDBUFFERRANGEPROC glBindBufferRange

    ctypedef void (*PFNGLBINDBUFFERBASEPROC)(GLenum target, GLuint index, GLuint buffer)

    PFNGLBINDBUFFERBASEPROC glBindBufferBase

    ctypedef void (*PFNGLTRANSFORMFEEDBACKVARYINGSPROC)(GLuint program, GLsizei count, GLchar** varyings, GLenum bufferMode)

    PFNGLTRANSFORMFEEDBACKVARYINGSPROC glTransformFeedbackVaryings

    ctypedef void (*PFNGLGETTRANSFORMFEEDBACKVARYINGPROC)(GLuint program, GLuint index, GLsizei bufSize, GLsizei* length, GLsizei* size, GLenum* type, GLchar* name)

    PFNGLGETTRANSFORMFEEDBACKVARYINGPROC glGetTransformFeedbackVarying

    ctypedef void (*PFNGLCLAMPCOLORPROC)(GLenum target, GLenum clamp)

    PFNGLCLAMPCOLORPROC glClampColor

    ctypedef void (*PFNGLBEGINCONDITIONALRENDERPROC)(GLuint id, GLenum mode)

    PFNGLBEGINCONDITIONALRENDERPROC glBeginConditionalRender

    ctypedef void (*PFNGLENDCONDITIONALRENDERPROC)()

    PFNGLENDCONDITIONALRENDERPROC glEndConditionalRender

    ctypedef void (*PFNGLVERTEXATTRIBIPOINTERPROC)(GLuint index, GLint size, GLenum type, GLsizei stride, void* pointer)

    PFNGLVERTEXATTRIBIPOINTERPROC glVertexAttribIPointer

    ctypedef void (*PFNGLGETVERTEXATTRIBIIVPROC)(GLuint index, GLenum pname, GLint* params)

    PFNGLGETVERTEXATTRIBIIVPROC glGetVertexAttribIiv

    ctypedef void (*PFNGLGETVERTEXATTRIBIUIVPROC)(GLuint index, GLenum pname, GLuint* params)

    PFNGLGETVERTEXATTRIBIUIVPROC glGetVertexAttribIuiv

    ctypedef void (*PFNGLVERTEXATTRIBI1IPROC)(GLuint index, GLint x)

    PFNGLVERTEXATTRIBI1IPROC glVertexAttribI1i

    ctypedef void (*PFNGLVERTEXATTRIBI2IPROC)(GLuint index, GLint x, GLint y)

    PFNGLVERTEXATTRIBI2IPROC glVertexAttribI2i

    ctypedef void (*PFNGLVERTEXATTRIBI3IPROC)(GLuint index, GLint x, GLint y, GLint z)

    PFNGLVERTEXATTRIBI3IPROC glVertexAttribI3i

    ctypedef void (*PFNGLVERTEXATTRIBI4IPROC)(GLuint index, GLint x, GLint y, GLint z, GLint w)

    PFNGLVERTEXATTRIBI4IPROC glVertexAttribI4i

    ctypedef void (*PFNGLVERTEXATTRIBI1UIPROC)(GLuint index, GLuint x)

    PFNGLVERTEXATTRIBI1UIPROC glVertexAttribI1ui

    ctypedef void (*PFNGLVERTEXATTRIBI2UIPROC)(GLuint index, GLuint x, GLuint y)

    PFNGLVERTEXATTRIBI2UIPROC glVertexAttribI2ui

    ctypedef void (*PFNGLVERTEXATTRIBI3UIPROC)(GLuint index, GLuint x, GLuint y, GLuint z)

    PFNGLVERTEXATTRIBI3UIPROC glVertexAttribI3ui

    ctypedef void (*PFNGLVERTEXATTRIBI4UIPROC)(GLuint index, GLuint x, GLuint y, GLuint z, GLuint w)

    PFNGLVERTEXATTRIBI4UIPROC glVertexAttribI4ui

    ctypedef void (*PFNGLVERTEXATTRIBI1IVPROC)(GLuint index, GLint* v)

    PFNGLVERTEXATTRIBI1IVPROC glVertexAttribI1iv

    ctypedef void (*PFNGLVERTEXATTRIBI2IVPROC)(GLuint index, GLint* v)

    PFNGLVERTEXATTRIBI2IVPROC glVertexAttribI2iv

    ctypedef void (*PFNGLVERTEXATTRIBI3IVPROC)(GLuint index, GLint* v)

    PFNGLVERTEXATTRIBI3IVPROC glVertexAttribI3iv

    ctypedef void (*PFNGLVERTEXATTRIBI4IVPROC)(GLuint index, GLint* v)

    PFNGLVERTEXATTRIBI4IVPROC glVertexAttribI4iv

    ctypedef void (*PFNGLVERTEXATTRIBI1UIVPROC)(GLuint index, GLuint* v)

    PFNGLVERTEXATTRIBI1UIVPROC glVertexAttribI1uiv

    ctypedef void (*PFNGLVERTEXATTRIBI2UIVPROC)(GLuint index, GLuint* v)

    PFNGLVERTEXATTRIBI2UIVPROC glVertexAttribI2uiv

    ctypedef void (*PFNGLVERTEXATTRIBI3UIVPROC)(GLuint index, GLuint* v)

    PFNGLVERTEXATTRIBI3UIVPROC glVertexAttribI3uiv

    ctypedef void (*PFNGLVERTEXATTRIBI4UIVPROC)(GLuint index, GLuint* v)

    PFNGLVERTEXATTRIBI4UIVPROC glVertexAttribI4uiv

    ctypedef void (*PFNGLVERTEXATTRIBI4BVPROC)(GLuint index, GLbyte* v)

    PFNGLVERTEXATTRIBI4BVPROC glVertexAttribI4bv

    ctypedef void (*PFNGLVERTEXATTRIBI4SVPROC)(GLuint index, GLshort* v)

    PFNGLVERTEXATTRIBI4SVPROC glVertexAttribI4sv

    ctypedef void (*PFNGLVERTEXATTRIBI4UBVPROC)(GLuint index, GLubyte* v)

    PFNGLVERTEXATTRIBI4UBVPROC glVertexAttribI4ubv

    ctypedef void (*PFNGLVERTEXATTRIBI4USVPROC)(GLuint index, GLushort* v)

    PFNGLVERTEXATTRIBI4USVPROC glVertexAttribI4usv

    ctypedef void (*PFNGLGETUNIFORMUIVPROC)(GLuint program, GLint location, GLuint* params)

    PFNGLGETUNIFORMUIVPROC glGetUniformuiv

    ctypedef void (*PFNGLBINDFRAGDATALOCATIONPROC)(GLuint program, GLuint color, GLchar* name)

    PFNGLBINDFRAGDATALOCATIONPROC glBindFragDataLocation

    ctypedef GLint (*PFNGLGETFRAGDATALOCATIONPROC)(GLuint program, GLchar* name)

    PFNGLGETFRAGDATALOCATIONPROC glGetFragDataLocation

    ctypedef void (*PFNGLUNIFORM1UIPROC)(GLint location, GLuint v0)

    PFNGLUNIFORM1UIPROC glUniform1ui

    ctypedef void (*PFNGLUNIFORM2UIPROC)(GLint location, GLuint v0, GLuint v1)

    PFNGLUNIFORM2UIPROC glUniform2ui

    ctypedef void (*PFNGLUNIFORM3UIPROC)(GLint location, GLuint v0, GLuint v1, GLuint v2)

    PFNGLUNIFORM3UIPROC glUniform3ui

    ctypedef void (*PFNGLUNIFORM4UIPROC)(GLint location, GLuint v0, GLuint v1, GLuint v2, GLuint v3)

    PFNGLUNIFORM4UIPROC glUniform4ui

    ctypedef void (*PFNGLUNIFORM1UIVPROC)(GLint location, GLsizei count, GLuint* value)

    PFNGLUNIFORM1UIVPROC glUniform1uiv

    ctypedef void (*PFNGLUNIFORM2UIVPROC)(GLint location, GLsizei count, GLuint* value)

    PFNGLUNIFORM2UIVPROC glUniform2uiv

    ctypedef void (*PFNGLUNIFORM3UIVPROC)(GLint location, GLsizei count, GLuint* value)

    PFNGLUNIFORM3UIVPROC glUniform3uiv

    ctypedef void (*PFNGLUNIFORM4UIVPROC)(GLint location, GLsizei count, GLuint* value)

    PFNGLUNIFORM4UIVPROC glUniform4uiv

    ctypedef void (*PFNGLTEXPARAMETERIIVPROC)(GLenum target, GLenum pname, GLint* params)

    PFNGLTEXPARAMETERIIVPROC glTexParameterIiv

    ctypedef void (*PFNGLTEXPARAMETERIUIVPROC)(GLenum target, GLenum pname, GLuint* params)

    PFNGLTEXPARAMETERIUIVPROC glTexParameterIuiv

    ctypedef void (*PFNGLGETTEXPARAMETERIIVPROC)(GLenum target, GLenum pname, GLint* params)

    PFNGLGETTEXPARAMETERIIVPROC glGetTexParameterIiv

    ctypedef void (*PFNGLGETTEXPARAMETERIUIVPROC)(GLenum target, GLenum pname, GLuint* params)

    PFNGLGETTEXPARAMETERIUIVPROC glGetTexParameterIuiv

    ctypedef void (*PFNGLCLEARBUFFERIVPROC)(GLenum buffer, GLint drawbuffer, GLint* value)

    PFNGLCLEARBUFFERIVPROC glClearBufferiv

    ctypedef void (*PFNGLCLEARBUFFERUIVPROC)(GLenum buffer, GLint drawbuffer, GLuint* value)

    PFNGLCLEARBUFFERUIVPROC glClearBufferuiv

    ctypedef void (*PFNGLCLEARBUFFERFVPROC)(GLenum buffer, GLint drawbuffer, GLfloat* value)

    PFNGLCLEARBUFFERFVPROC glClearBufferfv

    ctypedef void (*PFNGLCLEARBUFFERFIPROC)(GLenum buffer, GLint drawbuffer, GLfloat depth, GLint stencil)

    PFNGLCLEARBUFFERFIPROC glClearBufferfi

    ctypedef GLubyte* (*PFNGLGETSTRINGIPROC)(GLenum name, GLuint index)

    PFNGLGETSTRINGIPROC glGetStringi

    ctypedef GLboolean (*PFNGLISRENDERBUFFERPROC)(GLuint renderbuffer)

    PFNGLISRENDERBUFFERPROC glIsRenderbuffer

    ctypedef void (*PFNGLBINDRENDERBUFFERPROC)(GLenum target, GLuint renderbuffer)

    PFNGLBINDRENDERBUFFERPROC glBindRenderbuffer

    ctypedef void (*PFNGLDELETERENDERBUFFERSPROC)(GLsizei n, GLuint* renderbuffers)

    PFNGLDELETERENDERBUFFERSPROC glDeleteRenderbuffers

    ctypedef void (*PFNGLGENRENDERBUFFERSPROC)(GLsizei n, GLuint* renderbuffers)

    PFNGLGENRENDERBUFFERSPROC glGenRenderbuffers

    ctypedef void (*PFNGLRENDERBUFFERSTORAGEPROC)(GLenum target, GLenum internalformat, GLsizei width, GLsizei height)

    PFNGLRENDERBUFFERSTORAGEPROC glRenderbufferStorage

    ctypedef void (*PFNGLGETRENDERBUFFERPARAMETERIVPROC)(GLenum target, GLenum pname, GLint* params)

    PFNGLGETRENDERBUFFERPARAMETERIVPROC glGetRenderbufferParameteriv

    ctypedef GLboolean (*PFNGLISFRAMEBUFFERPROC)(GLuint framebuffer)

    PFNGLISFRAMEBUFFERPROC glIsFramebuffer

    ctypedef void (*PFNGLBINDFRAMEBUFFERPROC)(GLenum target, GLuint framebuffer)

    PFNGLBINDFRAMEBUFFERPROC glBindFramebuffer

    ctypedef void (*PFNGLDELETEFRAMEBUFFERSPROC)(GLsizei n, GLuint* framebuffers)

    PFNGLDELETEFRAMEBUFFERSPROC glDeleteFramebuffers

    ctypedef void (*PFNGLGENFRAMEBUFFERSPROC)(GLsizei n, GLuint* framebuffers)

    PFNGLGENFRAMEBUFFERSPROC glGenFramebuffers

    ctypedef GLenum (*PFNGLCHECKFRAMEBUFFERSTATUSPROC)(GLenum target)

    PFNGLCHECKFRAMEBUFFERSTATUSPROC glCheckFramebufferStatus

    ctypedef void (*PFNGLFRAMEBUFFERTEXTURE1DPROC)(GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level)

    PFNGLFRAMEBUFFERTEXTURE1DPROC glFramebufferTexture1D

    ctypedef void (*PFNGLFRAMEBUFFERTEXTURE2DPROC)(GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level)

    PFNGLFRAMEBUFFERTEXTURE2DPROC glFramebufferTexture2D

    ctypedef void (*PFNGLFRAMEBUFFERTEXTURE3DPROC)(GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLint zoffset)

    PFNGLFRAMEBUFFERTEXTURE3DPROC glFramebufferTexture3D

    ctypedef void (*PFNGLFRAMEBUFFERRENDERBUFFERPROC)(GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer)

    PFNGLFRAMEBUFFERRENDERBUFFERPROC glFramebufferRenderbuffer

    ctypedef void (*PFNGLGETFRAMEBUFFERATTACHMENTPARAMETERIVPROC)(GLenum target, GLenum attachment, GLenum pname, GLint* params)

    PFNGLGETFRAMEBUFFERATTACHMENTPARAMETERIVPROC glGetFramebufferAttachmentParameteriv

    ctypedef void (*PFNGLGENERATEMIPMAPPROC)(GLenum target)

    PFNGLGENERATEMIPMAPPROC glGenerateMipmap

    ctypedef void (*PFNGLBLITFRAMEBUFFERPROC)(GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter)

    PFNGLBLITFRAMEBUFFERPROC glBlitFramebuffer

    ctypedef void (*PFNGLRENDERBUFFERSTORAGEMULTISAMPLEPROC)(GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height)

    PFNGLRENDERBUFFERSTORAGEMULTISAMPLEPROC glRenderbufferStorageMultisample

    ctypedef void (*PFNGLFRAMEBUFFERTEXTURELAYERPROC)(GLenum target, GLenum attachment, GLuint texture, GLint level, GLint layer)

    PFNGLFRAMEBUFFERTEXTURELAYERPROC glFramebufferTextureLayer

    ctypedef void* (*PFNGLMAPBUFFERRANGEPROC)(GLenum target, GLintptr offset, GLsizeiptr length, GLbitfield access)

    PFNGLMAPBUFFERRANGEPROC glMapBufferRange

    ctypedef void (*PFNGLFLUSHMAPPEDBUFFERRANGEPROC)(GLenum target, GLintptr offset, GLsizeiptr length)

    PFNGLFLUSHMAPPEDBUFFERRANGEPROC glFlushMappedBufferRange

    ctypedef void (*PFNGLBINDVERTEXARRAYPROC)(GLuint array)

    PFNGLBINDVERTEXARRAYPROC glBindVertexArray

    ctypedef void (*PFNGLDELETEVERTEXARRAYSPROC)(GLsizei n, GLuint* arrays)

    PFNGLDELETEVERTEXARRAYSPROC glDeleteVertexArrays

    ctypedef void (*PFNGLGENVERTEXARRAYSPROC)(GLsizei n, GLuint* arrays)

    PFNGLGENVERTEXARRAYSPROC glGenVertexArrays

    ctypedef GLboolean (*PFNGLISVERTEXARRAYPROC)(GLuint array)

    PFNGLISVERTEXARRAYPROC glIsVertexArray

    int GL_VERSION_3_1

    ctypedef void (*PFNGLDRAWARRAYSINSTANCEDPROC)(GLenum mode, GLint first, GLsizei count, GLsizei instancecount)

    PFNGLDRAWARRAYSINSTANCEDPROC glDrawArraysInstanced

    ctypedef void (*PFNGLDRAWELEMENTSINSTANCEDPROC)(GLenum mode, GLsizei count, GLenum type, void* indices, GLsizei instancecount)

    PFNGLDRAWELEMENTSINSTANCEDPROC glDrawElementsInstanced

    ctypedef void (*PFNGLTEXBUFFERPROC)(GLenum target, GLenum internalformat, GLuint buffer)

    PFNGLTEXBUFFERPROC glTexBuffer

    ctypedef void (*PFNGLPRIMITIVERESTARTINDEXPROC)(GLuint index)

    PFNGLPRIMITIVERESTARTINDEXPROC glPrimitiveRestartIndex

    ctypedef void (*PFNGLCOPYBUFFERSUBDATAPROC)(GLenum readTarget, GLenum writeTarget, GLintptr readOffset, GLintptr writeOffset, GLsizeiptr size)

    PFNGLCOPYBUFFERSUBDATAPROC glCopyBufferSubData

    ctypedef void (*PFNGLGETUNIFORMINDICESPROC)(GLuint program, GLsizei uniformCount, GLchar** uniformNames, GLuint* uniformIndices)

    PFNGLGETUNIFORMINDICESPROC glGetUniformIndices

    ctypedef void (*PFNGLGETACTIVEUNIFORMSIVPROC)(GLuint program, GLsizei uniformCount, GLuint* uniformIndices, GLenum pname, GLint* params)

    PFNGLGETACTIVEUNIFORMSIVPROC glGetActiveUniformsiv

    ctypedef void (*PFNGLGETACTIVEUNIFORMNAMEPROC)(GLuint program, GLuint uniformIndex, GLsizei bufSize, GLsizei* length, GLchar* uniformName)

    PFNGLGETACTIVEUNIFORMNAMEPROC glGetActiveUniformName

    ctypedef GLuint (*PFNGLGETUNIFORMBLOCKINDEXPROC)(GLuint program, GLchar* uniformBlockName)

    PFNGLGETUNIFORMBLOCKINDEXPROC glGetUniformBlockIndex

    ctypedef void (*PFNGLGETACTIVEUNIFORMBLOCKIVPROC)(GLuint program, GLuint uniformBlockIndex, GLenum pname, GLint* params)

    PFNGLGETACTIVEUNIFORMBLOCKIVPROC glGetActiveUniformBlockiv

    ctypedef void (*PFNGLGETACTIVEUNIFORMBLOCKNAMEPROC)(GLuint program, GLuint uniformBlockIndex, GLsizei bufSize, GLsizei* length, GLchar* uniformBlockName)

    PFNGLGETACTIVEUNIFORMBLOCKNAMEPROC glGetActiveUniformBlockName

    ctypedef void (*PFNGLUNIFORMBLOCKBINDINGPROC)(GLuint program, GLuint uniformBlockIndex, GLuint uniformBlockBinding)

    PFNGLUNIFORMBLOCKBINDINGPROC glUniformBlockBinding

    int GL_VERSION_3_2

    ctypedef void (*PFNGLDRAWELEMENTSBASEVERTEXPROC)(GLenum mode, GLsizei count, GLenum type, void* indices, GLint basevertex)

    PFNGLDRAWELEMENTSBASEVERTEXPROC glDrawElementsBaseVertex

    ctypedef void (*PFNGLDRAWRANGEELEMENTSBASEVERTEXPROC)(GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, void* indices, GLint basevertex)

    PFNGLDRAWRANGEELEMENTSBASEVERTEXPROC glDrawRangeElementsBaseVertex

    ctypedef void (*PFNGLDRAWELEMENTSINSTANCEDBASEVERTEXPROC)(GLenum mode, GLsizei count, GLenum type, void* indices, GLsizei instancecount, GLint basevertex)

    PFNGLDRAWELEMENTSINSTANCEDBASEVERTEXPROC glDrawElementsInstancedBaseVertex

    ctypedef void (*PFNGLMULTIDRAWELEMENTSBASEVERTEXPROC)(GLenum mode, GLsizei* count, GLenum type, void** indices, GLsizei drawcount, GLint* basevertex)

    PFNGLMULTIDRAWELEMENTSBASEVERTEXPROC glMultiDrawElementsBaseVertex

    ctypedef void (*PFNGLPROVOKINGVERTEXPROC)(GLenum mode)

    PFNGLPROVOKINGVERTEXPROC glProvokingVertex

    ctypedef GLsync (*PFNGLFENCESYNCPROC)(GLenum condition, GLbitfield flags)

    PFNGLFENCESYNCPROC glFenceSync

    ctypedef GLboolean (*PFNGLISSYNCPROC)(GLsync sync)

    PFNGLISSYNCPROC glIsSync

    ctypedef void (*PFNGLDELETESYNCPROC)(GLsync sync)

    PFNGLDELETESYNCPROC glDeleteSync

    ctypedef GLenum (*PFNGLCLIENTWAITSYNCPROC)(GLsync sync, GLbitfield flags, GLuint64 timeout)

    PFNGLCLIENTWAITSYNCPROC glClientWaitSync

    ctypedef void (*PFNGLWAITSYNCPROC)(GLsync sync, GLbitfield flags, GLuint64 timeout)

    PFNGLWAITSYNCPROC glWaitSync

    ctypedef void (*PFNGLGETINTEGER64VPROC)(GLenum pname, GLint64* data)

    PFNGLGETINTEGER64VPROC glGetInteger64v

    ctypedef void (*PFNGLGETSYNCIVPROC)(GLsync sync, GLenum pname, GLsizei count, GLsizei* length, GLint* values)

    PFNGLGETSYNCIVPROC glGetSynciv

    ctypedef void (*PFNGLGETINTEGER64I_VPROC)(GLenum target, GLuint index, GLint64* data)

    PFNGLGETINTEGER64I_VPROC glGetInteger64i_v

    ctypedef void (*PFNGLGETBUFFERPARAMETERI64VPROC)(GLenum target, GLenum pname, GLint64* params)

    PFNGLGETBUFFERPARAMETERI64VPROC glGetBufferParameteri64v

    ctypedef void (*PFNGLFRAMEBUFFERTEXTUREPROC)(GLenum target, GLenum attachment, GLuint texture, GLint level)

    PFNGLFRAMEBUFFERTEXTUREPROC glFramebufferTexture

    ctypedef void (*PFNGLTEXIMAGE2DMULTISAMPLEPROC)(GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLboolean fixedsamplelocations)

    PFNGLTEXIMAGE2DMULTISAMPLEPROC glTexImage2DMultisample

    ctypedef void (*PFNGLTEXIMAGE3DMULTISAMPLEPROC)(GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedsamplelocations)

    PFNGLTEXIMAGE3DMULTISAMPLEPROC glTexImage3DMultisample

    ctypedef void (*PFNGLGETMULTISAMPLEFVPROC)(GLenum pname, GLuint index, GLfloat* val)

    PFNGLGETMULTISAMPLEFVPROC glGetMultisamplefv

    ctypedef void (*PFNGLSAMPLEMASKIPROC)(GLuint maskNumber, GLbitfield mask)

    PFNGLSAMPLEMASKIPROC glSampleMaski

    int GL_VERSION_3_3

    ctypedef void (*PFNGLBINDFRAGDATALOCATIONINDEXEDPROC)(GLuint program, GLuint colorNumber, GLuint index, GLchar* name)

    PFNGLBINDFRAGDATALOCATIONINDEXEDPROC glBindFragDataLocationIndexed

    ctypedef GLint (*PFNGLGETFRAGDATAINDEXPROC)(GLuint program, GLchar* name)

    PFNGLGETFRAGDATAINDEXPROC glGetFragDataIndex

    ctypedef void (*PFNGLGENSAMPLERSPROC)(GLsizei count, GLuint* samplers)

    PFNGLGENSAMPLERSPROC glGenSamplers

    ctypedef void (*PFNGLDELETESAMPLERSPROC)(GLsizei count, GLuint* samplers)

    PFNGLDELETESAMPLERSPROC glDeleteSamplers

    ctypedef GLboolean (*PFNGLISSAMPLERPROC)(GLuint sampler)

    PFNGLISSAMPLERPROC glIsSampler

    ctypedef void (*PFNGLBINDSAMPLERPROC)(GLuint unit, GLuint sampler)

    PFNGLBINDSAMPLERPROC glBindSampler

    ctypedef void (*PFNGLSAMPLERPARAMETERIPROC)(GLuint sampler, GLenum pname, GLint param)

    PFNGLSAMPLERPARAMETERIPROC glSamplerParameteri

    ctypedef void (*PFNGLSAMPLERPARAMETERIVPROC)(GLuint sampler, GLenum pname, GLint* param)

    PFNGLSAMPLERPARAMETERIVPROC glSamplerParameteriv

    ctypedef void (*PFNGLSAMPLERPARAMETERFPROC)(GLuint sampler, GLenum pname, GLfloat param)

    PFNGLSAMPLERPARAMETERFPROC glSamplerParameterf

    ctypedef void (*PFNGLSAMPLERPARAMETERFVPROC)(GLuint sampler, GLenum pname, GLfloat* param)

    PFNGLSAMPLERPARAMETERFVPROC glSamplerParameterfv

    ctypedef void (*PFNGLSAMPLERPARAMETERIIVPROC)(GLuint sampler, GLenum pname, GLint* param)

    PFNGLSAMPLERPARAMETERIIVPROC glSamplerParameterIiv

    ctypedef void (*PFNGLSAMPLERPARAMETERIUIVPROC)(GLuint sampler, GLenum pname, GLuint* param)

    PFNGLSAMPLERPARAMETERIUIVPROC glSamplerParameterIuiv

    ctypedef void (*PFNGLGETSAMPLERPARAMETERIVPROC)(GLuint sampler, GLenum pname, GLint* params)

    PFNGLGETSAMPLERPARAMETERIVPROC glGetSamplerParameteriv

    ctypedef void (*PFNGLGETSAMPLERPARAMETERIIVPROC)(GLuint sampler, GLenum pname, GLint* params)

    PFNGLGETSAMPLERPARAMETERIIVPROC glGetSamplerParameterIiv

    ctypedef void (*PFNGLGETSAMPLERPARAMETERFVPROC)(GLuint sampler, GLenum pname, GLfloat* params)

    PFNGLGETSAMPLERPARAMETERFVPROC glGetSamplerParameterfv

    ctypedef void (*PFNGLGETSAMPLERPARAMETERIUIVPROC)(GLuint sampler, GLenum pname, GLuint* params)

    PFNGLGETSAMPLERPARAMETERIUIVPROC glGetSamplerParameterIuiv

    ctypedef void (*PFNGLQUERYCOUNTERPROC)(GLuint id, GLenum target)

    PFNGLQUERYCOUNTERPROC glQueryCounter

    ctypedef void (*PFNGLGETQUERYOBJECTI64VPROC)(GLuint id, GLenum pname, GLint64* params)

    PFNGLGETQUERYOBJECTI64VPROC glGetQueryObjecti64v

    ctypedef void (*PFNGLGETQUERYOBJECTUI64VPROC)(GLuint id, GLenum pname, GLuint64* params)

    PFNGLGETQUERYOBJECTUI64VPROC glGetQueryObjectui64v

    ctypedef void (*PFNGLVERTEXATTRIBDIVISORPROC)(GLuint index, GLuint divisor)

    PFNGLVERTEXATTRIBDIVISORPROC glVertexAttribDivisor

    ctypedef void (*PFNGLVERTEXATTRIBP1UIPROC)(GLuint index, GLenum type, GLboolean normalized, GLuint value)

    PFNGLVERTEXATTRIBP1UIPROC glVertexAttribP1ui

    ctypedef void (*PFNGLVERTEXATTRIBP1UIVPROC)(GLuint index, GLenum type, GLboolean normalized, GLuint* value)

    PFNGLVERTEXATTRIBP1UIVPROC glVertexAttribP1uiv

    ctypedef void (*PFNGLVERTEXATTRIBP2UIPROC)(GLuint index, GLenum type, GLboolean normalized, GLuint value)

    PFNGLVERTEXATTRIBP2UIPROC glVertexAttribP2ui

    ctypedef void (*PFNGLVERTEXATTRIBP2UIVPROC)(GLuint index, GLenum type, GLboolean normalized, GLuint* value)

    PFNGLVERTEXATTRIBP2UIVPROC glVertexAttribP2uiv

    ctypedef void (*PFNGLVERTEXATTRIBP3UIPROC)(GLuint index, GLenum type, GLboolean normalized, GLuint value)

    PFNGLVERTEXATTRIBP3UIPROC glVertexAttribP3ui

    ctypedef void (*PFNGLVERTEXATTRIBP3UIVPROC)(GLuint index, GLenum type, GLboolean normalized, GLuint* value)

    PFNGLVERTEXATTRIBP3UIVPROC glVertexAttribP3uiv

    ctypedef void (*PFNGLVERTEXATTRIBP4UIPROC)(GLuint index, GLenum type, GLboolean normalized, GLuint value)

    PFNGLVERTEXATTRIBP4UIPROC glVertexAttribP4ui

    ctypedef void (*PFNGLVERTEXATTRIBP4UIVPROC)(GLuint index, GLenum type, GLboolean normalized, GLuint* value)

    PFNGLVERTEXATTRIBP4UIVPROC glVertexAttribP4uiv

    ctypedef void (*PFNGLVERTEXP2UIPROC)(GLenum type, GLuint value)

    PFNGLVERTEXP2UIPROC glVertexP2ui

    ctypedef void (*PFNGLVERTEXP2UIVPROC)(GLenum type, GLuint* value)

    PFNGLVERTEXP2UIVPROC glVertexP2uiv

    ctypedef void (*PFNGLVERTEXP3UIPROC)(GLenum type, GLuint value)

    PFNGLVERTEXP3UIPROC glVertexP3ui

    ctypedef void (*PFNGLVERTEXP3UIVPROC)(GLenum type, GLuint* value)

    PFNGLVERTEXP3UIVPROC glVertexP3uiv

    ctypedef void (*PFNGLVERTEXP4UIPROC)(GLenum type, GLuint value)

    PFNGLVERTEXP4UIPROC glVertexP4ui

    ctypedef void (*PFNGLVERTEXP4UIVPROC)(GLenum type, GLuint* value)

    PFNGLVERTEXP4UIVPROC glVertexP4uiv

    ctypedef void (*PFNGLTEXCOORDP1UIPROC)(GLenum type, GLuint coords)

    PFNGLTEXCOORDP1UIPROC glTexCoordP1ui

    ctypedef void (*PFNGLTEXCOORDP1UIVPROC)(GLenum type, GLuint* coords)

    PFNGLTEXCOORDP1UIVPROC glTexCoordP1uiv

    ctypedef void (*PFNGLTEXCOORDP2UIPROC)(GLenum type, GLuint coords)

    PFNGLTEXCOORDP2UIPROC glTexCoordP2ui

    ctypedef void (*PFNGLTEXCOORDP2UIVPROC)(GLenum type, GLuint* coords)

    PFNGLTEXCOORDP2UIVPROC glTexCoordP2uiv

    ctypedef void (*PFNGLTEXCOORDP3UIPROC)(GLenum type, GLuint coords)

    PFNGLTEXCOORDP3UIPROC glTexCoordP3ui

    ctypedef void (*PFNGLTEXCOORDP3UIVPROC)(GLenum type, GLuint* coords)

    PFNGLTEXCOORDP3UIVPROC glTexCoordP3uiv

    ctypedef void (*PFNGLTEXCOORDP4UIPROC)(GLenum type, GLuint coords)

    PFNGLTEXCOORDP4UIPROC glTexCoordP4ui

    ctypedef void (*PFNGLTEXCOORDP4UIVPROC)(GLenum type, GLuint* coords)

    PFNGLTEXCOORDP4UIVPROC glTexCoordP4uiv

    ctypedef void (*PFNGLMULTITEXCOORDP1UIPROC)(GLenum texture, GLenum type, GLuint coords)

    PFNGLMULTITEXCOORDP1UIPROC glMultiTexCoordP1ui

    ctypedef void (*PFNGLMULTITEXCOORDP1UIVPROC)(GLenum texture, GLenum type, GLuint* coords)

    PFNGLMULTITEXCOORDP1UIVPROC glMultiTexCoordP1uiv

    ctypedef void (*PFNGLMULTITEXCOORDP2UIPROC)(GLenum texture, GLenum type, GLuint coords)

    PFNGLMULTITEXCOORDP2UIPROC glMultiTexCoordP2ui

    ctypedef void (*PFNGLMULTITEXCOORDP2UIVPROC)(GLenum texture, GLenum type, GLuint* coords)

    PFNGLMULTITEXCOORDP2UIVPROC glMultiTexCoordP2uiv

    ctypedef void (*PFNGLMULTITEXCOORDP3UIPROC)(GLenum texture, GLenum type, GLuint coords)

    PFNGLMULTITEXCOORDP3UIPROC glMultiTexCoordP3ui

    ctypedef void (*PFNGLMULTITEXCOORDP3UIVPROC)(GLenum texture, GLenum type, GLuint* coords)

    PFNGLMULTITEXCOORDP3UIVPROC glMultiTexCoordP3uiv

    ctypedef void (*PFNGLMULTITEXCOORDP4UIPROC)(GLenum texture, GLenum type, GLuint coords)

    PFNGLMULTITEXCOORDP4UIPROC glMultiTexCoordP4ui

    ctypedef void (*PFNGLMULTITEXCOORDP4UIVPROC)(GLenum texture, GLenum type, GLuint* coords)

    PFNGLMULTITEXCOORDP4UIVPROC glMultiTexCoordP4uiv

    ctypedef void (*PFNGLNORMALP3UIPROC)(GLenum type, GLuint coords)

    PFNGLNORMALP3UIPROC glNormalP3ui

    ctypedef void (*PFNGLNORMALP3UIVPROC)(GLenum type, GLuint* coords)

    PFNGLNORMALP3UIVPROC glNormalP3uiv

    ctypedef void (*PFNGLCOLORP3UIPROC)(GLenum type, GLuint color)

    PFNGLCOLORP3UIPROC glColorP3ui

    ctypedef void (*PFNGLCOLORP3UIVPROC)(GLenum type, GLuint* color)

    PFNGLCOLORP3UIVPROC glColorP3uiv

    ctypedef void (*PFNGLCOLORP4UIPROC)(GLenum type, GLuint color)

    PFNGLCOLORP4UIPROC glColorP4ui

    ctypedef void (*PFNGLCOLORP4UIVPROC)(GLenum type, GLuint* color)

    PFNGLCOLORP4UIVPROC glColorP4uiv

    ctypedef void (*PFNGLSECONDARYCOLORP3UIPROC)(GLenum type, GLuint color)

    PFNGLSECONDARYCOLORP3UIPROC glSecondaryColorP3ui

    ctypedef void (*PFNGLSECONDARYCOLORP3UIVPROC)(GLenum type, GLuint* color)

    PFNGLSECONDARYCOLORP3UIVPROC glSecondaryColorP3uiv

    int GL_VERSION_4_0

    ctypedef void (*PFNGLMINSAMPLESHADINGPROC)(GLfloat value)

    PFNGLMINSAMPLESHADINGPROC glMinSampleShading

    ctypedef void (*PFNGLBLENDEQUATIONIPROC)(GLuint buf, GLenum mode)

    PFNGLBLENDEQUATIONIPROC glBlendEquationi

    ctypedef void (*PFNGLBLENDEQUATIONSEPARATEIPROC)(GLuint buf, GLenum modeRGB, GLenum modeAlpha)

    PFNGLBLENDEQUATIONSEPARATEIPROC glBlendEquationSeparatei

    ctypedef void (*PFNGLBLENDFUNCIPROC)(GLuint buf, GLenum src, GLenum dst)

    PFNGLBLENDFUNCIPROC glBlendFunci

    ctypedef void (*PFNGLBLENDFUNCSEPARATEIPROC)(GLuint buf, GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha)

    PFNGLBLENDFUNCSEPARATEIPROC glBlendFuncSeparatei

    ctypedef void (*PFNGLDRAWARRAYSINDIRECTPROC)(GLenum mode, void* indirect)

    PFNGLDRAWARRAYSINDIRECTPROC glDrawArraysIndirect

    ctypedef void (*PFNGLDRAWELEMENTSINDIRECTPROC)(GLenum mode, GLenum type, void* indirect)

    PFNGLDRAWELEMENTSINDIRECTPROC glDrawElementsIndirect

    ctypedef void (*PFNGLUNIFORM1DPROC)(GLint location, GLdouble x)

    PFNGLUNIFORM1DPROC glUniform1d

    ctypedef void (*PFNGLUNIFORM2DPROC)(GLint location, GLdouble x, GLdouble y)

    PFNGLUNIFORM2DPROC glUniform2d

    ctypedef void (*PFNGLUNIFORM3DPROC)(GLint location, GLdouble x, GLdouble y, GLdouble z)

    PFNGLUNIFORM3DPROC glUniform3d

    ctypedef void (*PFNGLUNIFORM4DPROC)(GLint location, GLdouble x, GLdouble y, GLdouble z, GLdouble w)

    PFNGLUNIFORM4DPROC glUniform4d

    ctypedef void (*PFNGLUNIFORM1DVPROC)(GLint location, GLsizei count, GLdouble* value)

    PFNGLUNIFORM1DVPROC glUniform1dv

    ctypedef void (*PFNGLUNIFORM2DVPROC)(GLint location, GLsizei count, GLdouble* value)

    PFNGLUNIFORM2DVPROC glUniform2dv

    ctypedef void (*PFNGLUNIFORM3DVPROC)(GLint location, GLsizei count, GLdouble* value)

    PFNGLUNIFORM3DVPROC glUniform3dv

    ctypedef void (*PFNGLUNIFORM4DVPROC)(GLint location, GLsizei count, GLdouble* value)

    PFNGLUNIFORM4DVPROC glUniform4dv

    ctypedef void (*PFNGLUNIFORMMATRIX2DVPROC)(GLint location, GLsizei count, GLboolean transpose, GLdouble* value)

    PFNGLUNIFORMMATRIX2DVPROC glUniformMatrix2dv

    ctypedef void (*PFNGLUNIFORMMATRIX3DVPROC)(GLint location, GLsizei count, GLboolean transpose, GLdouble* value)

    PFNGLUNIFORMMATRIX3DVPROC glUniformMatrix3dv

    ctypedef void (*PFNGLUNIFORMMATRIX4DVPROC)(GLint location, GLsizei count, GLboolean transpose, GLdouble* value)

    PFNGLUNIFORMMATRIX4DVPROC glUniformMatrix4dv

    ctypedef void (*PFNGLUNIFORMMATRIX2X3DVPROC)(GLint location, GLsizei count, GLboolean transpose, GLdouble* value)

    PFNGLUNIFORMMATRIX2X3DVPROC glUniformMatrix2x3dv

    ctypedef void (*PFNGLUNIFORMMATRIX2X4DVPROC)(GLint location, GLsizei count, GLboolean transpose, GLdouble* value)

    PFNGLUNIFORMMATRIX2X4DVPROC glUniformMatrix2x4dv

    ctypedef void (*PFNGLUNIFORMMATRIX3X2DVPROC)(GLint location, GLsizei count, GLboolean transpose, GLdouble* value)

    PFNGLUNIFORMMATRIX3X2DVPROC glUniformMatrix3x2dv

    ctypedef void (*PFNGLUNIFORMMATRIX3X4DVPROC)(GLint location, GLsizei count, GLboolean transpose, GLdouble* value)

    PFNGLUNIFORMMATRIX3X4DVPROC glUniformMatrix3x4dv

    ctypedef void (*PFNGLUNIFORMMATRIX4X2DVPROC)(GLint location, GLsizei count, GLboolean transpose, GLdouble* value)

    PFNGLUNIFORMMATRIX4X2DVPROC glUniformMatrix4x2dv

    ctypedef void (*PFNGLUNIFORMMATRIX4X3DVPROC)(GLint location, GLsizei count, GLboolean transpose, GLdouble* value)

    PFNGLUNIFORMMATRIX4X3DVPROC glUniformMatrix4x3dv

    ctypedef void (*PFNGLGETUNIFORMDVPROC)(GLuint program, GLint location, GLdouble* params)

    PFNGLGETUNIFORMDVPROC glGetUniformdv

    ctypedef GLint (*PFNGLGETSUBROUTINEUNIFORMLOCATIONPROC)(GLuint program, GLenum shadertype, GLchar* name)

    PFNGLGETSUBROUTINEUNIFORMLOCATIONPROC glGetSubroutineUniformLocation

    ctypedef GLuint (*PFNGLGETSUBROUTINEINDEXPROC)(GLuint program, GLenum shadertype, GLchar* name)

    PFNGLGETSUBROUTINEINDEXPROC glGetSubroutineIndex

    ctypedef void (*PFNGLGETACTIVESUBROUTINEUNIFORMIVPROC)(GLuint program, GLenum shadertype, GLuint index, GLenum pname, GLint* values)

    PFNGLGETACTIVESUBROUTINEUNIFORMIVPROC glGetActiveSubroutineUniformiv

    ctypedef void (*PFNGLGETACTIVESUBROUTINEUNIFORMNAMEPROC)(GLuint program, GLenum shadertype, GLuint index, GLsizei bufSize, GLsizei* length, GLchar* name)

    PFNGLGETACTIVESUBROUTINEUNIFORMNAMEPROC glGetActiveSubroutineUniformName

    ctypedef void (*PFNGLGETACTIVESUBROUTINENAMEPROC)(GLuint program, GLenum shadertype, GLuint index, GLsizei bufSize, GLsizei* length, GLchar* name)

    PFNGLGETACTIVESUBROUTINENAMEPROC glGetActiveSubroutineName

    ctypedef void (*PFNGLUNIFORMSUBROUTINESUIVPROC)(GLenum shadertype, GLsizei count, GLuint* indices)

    PFNGLUNIFORMSUBROUTINESUIVPROC glUniformSubroutinesuiv

    ctypedef void (*PFNGLGETUNIFORMSUBROUTINEUIVPROC)(GLenum shadertype, GLint location, GLuint* params)

    PFNGLGETUNIFORMSUBROUTINEUIVPROC glGetUniformSubroutineuiv

    ctypedef void (*PFNGLGETPROGRAMSTAGEIVPROC)(GLuint program, GLenum shadertype, GLenum pname, GLint* values)

    PFNGLGETPROGRAMSTAGEIVPROC glGetProgramStageiv

    ctypedef void (*PFNGLPATCHPARAMETERIPROC)(GLenum pname, GLint value)

    PFNGLPATCHPARAMETERIPROC glPatchParameteri

    ctypedef void (*PFNGLPATCHPARAMETERFVPROC)(GLenum pname, GLfloat* values)

    PFNGLPATCHPARAMETERFVPROC glPatchParameterfv

    ctypedef void (*PFNGLBINDTRANSFORMFEEDBACKPROC)(GLenum target, GLuint id)

    PFNGLBINDTRANSFORMFEEDBACKPROC glBindTransformFeedback

    ctypedef void (*PFNGLDELETETRANSFORMFEEDBACKSPROC)(GLsizei n, GLuint* ids)

    PFNGLDELETETRANSFORMFEEDBACKSPROC glDeleteTransformFeedbacks

    ctypedef void (*PFNGLGENTRANSFORMFEEDBACKSPROC)(GLsizei n, GLuint* ids)

    PFNGLGENTRANSFORMFEEDBACKSPROC glGenTransformFeedbacks

    ctypedef GLboolean (*PFNGLISTRANSFORMFEEDBACKPROC)(GLuint id)

    PFNGLISTRANSFORMFEEDBACKPROC glIsTransformFeedback

    ctypedef void (*PFNGLPAUSETRANSFORMFEEDBACKPROC)()

    PFNGLPAUSETRANSFORMFEEDBACKPROC glPauseTransformFeedback

    ctypedef void (*PFNGLRESUMETRANSFORMFEEDBACKPROC)()

    PFNGLRESUMETRANSFORMFEEDBACKPROC glResumeTransformFeedback

    ctypedef void (*PFNGLDRAWTRANSFORMFEEDBACKPROC)(GLenum mode, GLuint id)

    PFNGLDRAWTRANSFORMFEEDBACKPROC glDrawTransformFeedback

    ctypedef void (*PFNGLDRAWTRANSFORMFEEDBACKSTREAMPROC)(GLenum mode, GLuint id, GLuint stream)

    PFNGLDRAWTRANSFORMFEEDBACKSTREAMPROC glDrawTransformFeedbackStream

    ctypedef void (*PFNGLBEGINQUERYINDEXEDPROC)(GLenum target, GLuint index, GLuint id)

    PFNGLBEGINQUERYINDEXEDPROC glBeginQueryIndexed

    ctypedef void (*PFNGLENDQUERYINDEXEDPROC)(GLenum target, GLuint index)

    PFNGLENDQUERYINDEXEDPROC glEndQueryIndexed

    ctypedef void (*PFNGLGETQUERYINDEXEDIVPROC)(GLenum target, GLuint index, GLenum pname, GLint* params)

    PFNGLGETQUERYINDEXEDIVPROC glGetQueryIndexediv

    int GL_VERSION_4_1

    ctypedef void (*PFNGLRELEASESHADERCOMPILERPROC)()

    PFNGLRELEASESHADERCOMPILERPROC glReleaseShaderCompiler

    ctypedef void (*PFNGLSHADERBINARYPROC)(GLsizei count, GLuint* shaders, GLenum binaryFormat, void* binary, GLsizei length)

    PFNGLSHADERBINARYPROC glShaderBinary

    ctypedef void (*PFNGLGETSHADERPRECISIONFORMATPROC)(GLenum shadertype, GLenum precisiontype, GLint* range, GLint* precision)

    PFNGLGETSHADERPRECISIONFORMATPROC glGetShaderPrecisionFormat

    ctypedef void (*PFNGLDEPTHRANGEFPROC)(GLfloat n, GLfloat f)

    PFNGLDEPTHRANGEFPROC glDepthRangef

    ctypedef void (*PFNGLCLEARDEPTHFPROC)(GLfloat d)

    PFNGLCLEARDEPTHFPROC glClearDepthf

    ctypedef void (*PFNGLGETPROGRAMBINARYPROC)(GLuint program, GLsizei bufSize, GLsizei* length, GLenum* binaryFormat, void* binary)

    PFNGLGETPROGRAMBINARYPROC glGetProgramBinary

    ctypedef void (*PFNGLPROGRAMBINARYPROC)(GLuint program, GLenum binaryFormat, void* binary, GLsizei length)

    PFNGLPROGRAMBINARYPROC glProgramBinary

    ctypedef void (*PFNGLPROGRAMPARAMETERIPROC)(GLuint program, GLenum pname, GLint value)

    PFNGLPROGRAMPARAMETERIPROC glProgramParameteri

    ctypedef void (*PFNGLUSEPROGRAMSTAGESPROC)(GLuint pipeline, GLbitfield stages, GLuint program)

    PFNGLUSEPROGRAMSTAGESPROC glUseProgramStages

    ctypedef void (*PFNGLACTIVESHADERPROGRAMPROC)(GLuint pipeline, GLuint program)

    PFNGLACTIVESHADERPROGRAMPROC glActiveShaderProgram

    ctypedef GLuint (*PFNGLCREATESHADERPROGRAMVPROC)(GLenum type, GLsizei count, GLchar** strings)

    PFNGLCREATESHADERPROGRAMVPROC glCreateShaderProgramv

    ctypedef void (*PFNGLBINDPROGRAMPIPELINEPROC)(GLuint pipeline)

    PFNGLBINDPROGRAMPIPELINEPROC glBindProgramPipeline

    ctypedef void (*PFNGLDELETEPROGRAMPIPELINESPROC)(GLsizei n, GLuint* pipelines)

    PFNGLDELETEPROGRAMPIPELINESPROC glDeleteProgramPipelines

    ctypedef void (*PFNGLGENPROGRAMPIPELINESPROC)(GLsizei n, GLuint* pipelines)

    PFNGLGENPROGRAMPIPELINESPROC glGenProgramPipelines

    ctypedef GLboolean (*PFNGLISPROGRAMPIPELINEPROC)(GLuint pipeline)

    PFNGLISPROGRAMPIPELINEPROC glIsProgramPipeline

    ctypedef void (*PFNGLGETPROGRAMPIPELINEIVPROC)(GLuint pipeline, GLenum pname, GLint* params)

    PFNGLGETPROGRAMPIPELINEIVPROC glGetProgramPipelineiv

    ctypedef void (*PFNGLPROGRAMUNIFORM1IPROC)(GLuint program, GLint location, GLint v0)

    PFNGLPROGRAMUNIFORM1IPROC glProgramUniform1i

    ctypedef void (*PFNGLPROGRAMUNIFORM1IVPROC)(GLuint program, GLint location, GLsizei count, GLint* value)

    PFNGLPROGRAMUNIFORM1IVPROC glProgramUniform1iv

    ctypedef void (*PFNGLPROGRAMUNIFORM1FPROC)(GLuint program, GLint location, GLfloat v0)

    PFNGLPROGRAMUNIFORM1FPROC glProgramUniform1f

    ctypedef void (*PFNGLPROGRAMUNIFORM1FVPROC)(GLuint program, GLint location, GLsizei count, GLfloat* value)

    PFNGLPROGRAMUNIFORM1FVPROC glProgramUniform1fv

    ctypedef void (*PFNGLPROGRAMUNIFORM1DPROC)(GLuint program, GLint location, GLdouble v0)

    PFNGLPROGRAMUNIFORM1DPROC glProgramUniform1d

    ctypedef void (*PFNGLPROGRAMUNIFORM1DVPROC)(GLuint program, GLint location, GLsizei count, GLdouble* value)

    PFNGLPROGRAMUNIFORM1DVPROC glProgramUniform1dv

    ctypedef void (*PFNGLPROGRAMUNIFORM1UIPROC)(GLuint program, GLint location, GLuint v0)

    PFNGLPROGRAMUNIFORM1UIPROC glProgramUniform1ui

    ctypedef void (*PFNGLPROGRAMUNIFORM1UIVPROC)(GLuint program, GLint location, GLsizei count, GLuint* value)

    PFNGLPROGRAMUNIFORM1UIVPROC glProgramUniform1uiv

    ctypedef void (*PFNGLPROGRAMUNIFORM2IPROC)(GLuint program, GLint location, GLint v0, GLint v1)

    PFNGLPROGRAMUNIFORM2IPROC glProgramUniform2i

    ctypedef void (*PFNGLPROGRAMUNIFORM2IVPROC)(GLuint program, GLint location, GLsizei count, GLint* value)

    PFNGLPROGRAMUNIFORM2IVPROC glProgramUniform2iv

    ctypedef void (*PFNGLPROGRAMUNIFORM2FPROC)(GLuint program, GLint location, GLfloat v0, GLfloat v1)

    PFNGLPROGRAMUNIFORM2FPROC glProgramUniform2f

    ctypedef void (*PFNGLPROGRAMUNIFORM2FVPROC)(GLuint program, GLint location, GLsizei count, GLfloat* value)

    PFNGLPROGRAMUNIFORM2FVPROC glProgramUniform2fv

    ctypedef void (*PFNGLPROGRAMUNIFORM2DPROC)(GLuint program, GLint location, GLdouble v0, GLdouble v1)

    PFNGLPROGRAMUNIFORM2DPROC glProgramUniform2d

    ctypedef void (*PFNGLPROGRAMUNIFORM2DVPROC)(GLuint program, GLint location, GLsizei count, GLdouble* value)

    PFNGLPROGRAMUNIFORM2DVPROC glProgramUniform2dv

    ctypedef void (*PFNGLPROGRAMUNIFORM2UIPROC)(GLuint program, GLint location, GLuint v0, GLuint v1)

    PFNGLPROGRAMUNIFORM2UIPROC glProgramUniform2ui

    ctypedef void (*PFNGLPROGRAMUNIFORM2UIVPROC)(GLuint program, GLint location, GLsizei count, GLuint* value)

    PFNGLPROGRAMUNIFORM2UIVPROC glProgramUniform2uiv

    ctypedef void (*PFNGLPROGRAMUNIFORM3IPROC)(GLuint program, GLint location, GLint v0, GLint v1, GLint v2)

    PFNGLPROGRAMUNIFORM3IPROC glProgramUniform3i

    ctypedef void (*PFNGLPROGRAMUNIFORM3IVPROC)(GLuint program, GLint location, GLsizei count, GLint* value)

    PFNGLPROGRAMUNIFORM3IVPROC glProgramUniform3iv

    ctypedef void (*PFNGLPROGRAMUNIFORM3FPROC)(GLuint program, GLint location, GLfloat v0, GLfloat v1, GLfloat v2)

    PFNGLPROGRAMUNIFORM3FPROC glProgramUniform3f

    ctypedef void (*PFNGLPROGRAMUNIFORM3FVPROC)(GLuint program, GLint location, GLsizei count, GLfloat* value)

    PFNGLPROGRAMUNIFORM3FVPROC glProgramUniform3fv

    ctypedef void (*PFNGLPROGRAMUNIFORM3DPROC)(GLuint program, GLint location, GLdouble v0, GLdouble v1, GLdouble v2)

    PFNGLPROGRAMUNIFORM3DPROC glProgramUniform3d

    ctypedef void (*PFNGLPROGRAMUNIFORM3DVPROC)(GLuint program, GLint location, GLsizei count, GLdouble* value)

    PFNGLPROGRAMUNIFORM3DVPROC glProgramUniform3dv

    ctypedef void (*PFNGLPROGRAMUNIFORM3UIPROC)(GLuint program, GLint location, GLuint v0, GLuint v1, GLuint v2)

    PFNGLPROGRAMUNIFORM3UIPROC glProgramUniform3ui

    ctypedef void (*PFNGLPROGRAMUNIFORM3UIVPROC)(GLuint program, GLint location, GLsizei count, GLuint* value)

    PFNGLPROGRAMUNIFORM3UIVPROC glProgramUniform3uiv

    ctypedef void (*PFNGLPROGRAMUNIFORM4IPROC)(GLuint program, GLint location, GLint v0, GLint v1, GLint v2, GLint v3)

    PFNGLPROGRAMUNIFORM4IPROC glProgramUniform4i

    ctypedef void (*PFNGLPROGRAMUNIFORM4IVPROC)(GLuint program, GLint location, GLsizei count, GLint* value)

    PFNGLPROGRAMUNIFORM4IVPROC glProgramUniform4iv

    ctypedef void (*PFNGLPROGRAMUNIFORM4FPROC)(GLuint program, GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3)

    PFNGLPROGRAMUNIFORM4FPROC glProgramUniform4f

    ctypedef void (*PFNGLPROGRAMUNIFORM4FVPROC)(GLuint program, GLint location, GLsizei count, GLfloat* value)

    PFNGLPROGRAMUNIFORM4FVPROC glProgramUniform4fv

    ctypedef void (*PFNGLPROGRAMUNIFORM4DPROC)(GLuint program, GLint location, GLdouble v0, GLdouble v1, GLdouble v2, GLdouble v3)

    PFNGLPROGRAMUNIFORM4DPROC glProgramUniform4d

    ctypedef void (*PFNGLPROGRAMUNIFORM4DVPROC)(GLuint program, GLint location, GLsizei count, GLdouble* value)

    PFNGLPROGRAMUNIFORM4DVPROC glProgramUniform4dv

    ctypedef void (*PFNGLPROGRAMUNIFORM4UIPROC)(GLuint program, GLint location, GLuint v0, GLuint v1, GLuint v2, GLuint v3)

    PFNGLPROGRAMUNIFORM4UIPROC glProgramUniform4ui

    ctypedef void (*PFNGLPROGRAMUNIFORM4UIVPROC)(GLuint program, GLint location, GLsizei count, GLuint* value)

    PFNGLPROGRAMUNIFORM4UIVPROC glProgramUniform4uiv

    ctypedef void (*PFNGLPROGRAMUNIFORMMATRIX2FVPROC)(GLuint program, GLint location, GLsizei count, GLboolean transpose, GLfloat* value)

    PFNGLPROGRAMUNIFORMMATRIX2FVPROC glProgramUniformMatrix2fv

    ctypedef void (*PFNGLPROGRAMUNIFORMMATRIX3FVPROC)(GLuint program, GLint location, GLsizei count, GLboolean transpose, GLfloat* value)

    PFNGLPROGRAMUNIFORMMATRIX3FVPROC glProgramUniformMatrix3fv

    ctypedef void (*PFNGLPROGRAMUNIFORMMATRIX4FVPROC)(GLuint program, GLint location, GLsizei count, GLboolean transpose, GLfloat* value)

    PFNGLPROGRAMUNIFORMMATRIX4FVPROC glProgramUniformMatrix4fv

    ctypedef void (*PFNGLPROGRAMUNIFORMMATRIX2DVPROC)(GLuint program, GLint location, GLsizei count, GLboolean transpose, GLdouble* value)

    PFNGLPROGRAMUNIFORMMATRIX2DVPROC glProgramUniformMatrix2dv

    ctypedef void (*PFNGLPROGRAMUNIFORMMATRIX3DVPROC)(GLuint program, GLint location, GLsizei count, GLboolean transpose, GLdouble* value)

    PFNGLPROGRAMUNIFORMMATRIX3DVPROC glProgramUniformMatrix3dv

    ctypedef void (*PFNGLPROGRAMUNIFORMMATRIX4DVPROC)(GLuint program, GLint location, GLsizei count, GLboolean transpose, GLdouble* value)

    PFNGLPROGRAMUNIFORMMATRIX4DVPROC glProgramUniformMatrix4dv

    ctypedef void (*PFNGLPROGRAMUNIFORMMATRIX2X3FVPROC)(GLuint program, GLint location, GLsizei count, GLboolean transpose, GLfloat* value)

    PFNGLPROGRAMUNIFORMMATRIX2X3FVPROC glProgramUniformMatrix2x3fv

    ctypedef void (*PFNGLPROGRAMUNIFORMMATRIX3X2FVPROC)(GLuint program, GLint location, GLsizei count, GLboolean transpose, GLfloat* value)

    PFNGLPROGRAMUNIFORMMATRIX3X2FVPROC glProgramUniformMatrix3x2fv

    ctypedef void (*PFNGLPROGRAMUNIFORMMATRIX2X4FVPROC)(GLuint program, GLint location, GLsizei count, GLboolean transpose, GLfloat* value)

    PFNGLPROGRAMUNIFORMMATRIX2X4FVPROC glProgramUniformMatrix2x4fv

    ctypedef void (*PFNGLPROGRAMUNIFORMMATRIX4X2FVPROC)(GLuint program, GLint location, GLsizei count, GLboolean transpose, GLfloat* value)

    PFNGLPROGRAMUNIFORMMATRIX4X2FVPROC glProgramUniformMatrix4x2fv

    ctypedef void (*PFNGLPROGRAMUNIFORMMATRIX3X4FVPROC)(GLuint program, GLint location, GLsizei count, GLboolean transpose, GLfloat* value)

    PFNGLPROGRAMUNIFORMMATRIX3X4FVPROC glProgramUniformMatrix3x4fv

    ctypedef void (*PFNGLPROGRAMUNIFORMMATRIX4X3FVPROC)(GLuint program, GLint location, GLsizei count, GLboolean transpose, GLfloat* value)

    PFNGLPROGRAMUNIFORMMATRIX4X3FVPROC glProgramUniformMatrix4x3fv

    ctypedef void (*PFNGLPROGRAMUNIFORMMATRIX2X3DVPROC)(GLuint program, GLint location, GLsizei count, GLboolean transpose, GLdouble* value)

    PFNGLPROGRAMUNIFORMMATRIX2X3DVPROC glProgramUniformMatrix2x3dv

    ctypedef void (*PFNGLPROGRAMUNIFORMMATRIX3X2DVPROC)(GLuint program, GLint location, GLsizei count, GLboolean transpose, GLdouble* value)

    PFNGLPROGRAMUNIFORMMATRIX3X2DVPROC glProgramUniformMatrix3x2dv

    ctypedef void (*PFNGLPROGRAMUNIFORMMATRIX2X4DVPROC)(GLuint program, GLint location, GLsizei count, GLboolean transpose, GLdouble* value)

    PFNGLPROGRAMUNIFORMMATRIX2X4DVPROC glProgramUniformMatrix2x4dv

    ctypedef void (*PFNGLPROGRAMUNIFORMMATRIX4X2DVPROC)(GLuint program, GLint location, GLsizei count, GLboolean transpose, GLdouble* value)

    PFNGLPROGRAMUNIFORMMATRIX4X2DVPROC glProgramUniformMatrix4x2dv

    ctypedef void (*PFNGLPROGRAMUNIFORMMATRIX3X4DVPROC)(GLuint program, GLint location, GLsizei count, GLboolean transpose, GLdouble* value)

    PFNGLPROGRAMUNIFORMMATRIX3X4DVPROC glProgramUniformMatrix3x4dv

    ctypedef void (*PFNGLPROGRAMUNIFORMMATRIX4X3DVPROC)(GLuint program, GLint location, GLsizei count, GLboolean transpose, GLdouble* value)

    PFNGLPROGRAMUNIFORMMATRIX4X3DVPROC glProgramUniformMatrix4x3dv

    ctypedef void (*PFNGLVALIDATEPROGRAMPIPELINEPROC)(GLuint pipeline)

    PFNGLVALIDATEPROGRAMPIPELINEPROC glValidateProgramPipeline

    ctypedef void (*PFNGLGETPROGRAMPIPELINEINFOLOGPROC)(GLuint pipeline, GLsizei bufSize, GLsizei* length, GLchar* infoLog)

    PFNGLGETPROGRAMPIPELINEINFOLOGPROC glGetProgramPipelineInfoLog

    ctypedef void (*PFNGLVERTEXATTRIBL1DPROC)(GLuint index, GLdouble x)

    PFNGLVERTEXATTRIBL1DPROC glVertexAttribL1d

    ctypedef void (*PFNGLVERTEXATTRIBL2DPROC)(GLuint index, GLdouble x, GLdouble y)

    PFNGLVERTEXATTRIBL2DPROC glVertexAttribL2d

    ctypedef void (*PFNGLVERTEXATTRIBL3DPROC)(GLuint index, GLdouble x, GLdouble y, GLdouble z)

    PFNGLVERTEXATTRIBL3DPROC glVertexAttribL3d

    ctypedef void (*PFNGLVERTEXATTRIBL4DPROC)(GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w)

    PFNGLVERTEXATTRIBL4DPROC glVertexAttribL4d

    ctypedef void (*PFNGLVERTEXATTRIBL1DVPROC)(GLuint index, GLdouble* v)

    PFNGLVERTEXATTRIBL1DVPROC glVertexAttribL1dv

    ctypedef void (*PFNGLVERTEXATTRIBL2DVPROC)(GLuint index, GLdouble* v)

    PFNGLVERTEXATTRIBL2DVPROC glVertexAttribL2dv

    ctypedef void (*PFNGLVERTEXATTRIBL3DVPROC)(GLuint index, GLdouble* v)

    PFNGLVERTEXATTRIBL3DVPROC glVertexAttribL3dv

    ctypedef void (*PFNGLVERTEXATTRIBL4DVPROC)(GLuint index, GLdouble* v)

    PFNGLVERTEXATTRIBL4DVPROC glVertexAttribL4dv

    ctypedef void (*PFNGLVERTEXATTRIBLPOINTERPROC)(GLuint index, GLint size, GLenum type, GLsizei stride, void* pointer)

    PFNGLVERTEXATTRIBLPOINTERPROC glVertexAttribLPointer

    ctypedef void (*PFNGLGETVERTEXATTRIBLDVPROC)(GLuint index, GLenum pname, GLdouble* params)

    PFNGLGETVERTEXATTRIBLDVPROC glGetVertexAttribLdv

    ctypedef void (*PFNGLVIEWPORTARRAYVPROC)(GLuint first, GLsizei count, GLfloat* v)

    PFNGLVIEWPORTARRAYVPROC glViewportArrayv

    ctypedef void (*PFNGLVIEWPORTINDEXEDFPROC)(GLuint index, GLfloat x, GLfloat y, GLfloat w, GLfloat h)

    PFNGLVIEWPORTINDEXEDFPROC glViewportIndexedf

    ctypedef void (*PFNGLVIEWPORTINDEXEDFVPROC)(GLuint index, GLfloat* v)

    PFNGLVIEWPORTINDEXEDFVPROC glViewportIndexedfv

    ctypedef void (*PFNGLSCISSORARRAYVPROC)(GLuint first, GLsizei count, GLint* v)

    PFNGLSCISSORARRAYVPROC glScissorArrayv

    ctypedef void (*PFNGLSCISSORINDEXEDPROC)(GLuint index, GLint left, GLint bottom, GLsizei width, GLsizei height)

    PFNGLSCISSORINDEXEDPROC glScissorIndexed

    ctypedef void (*PFNGLSCISSORINDEXEDVPROC)(GLuint index, GLint* v)

    PFNGLSCISSORINDEXEDVPROC glScissorIndexedv

    ctypedef void (*PFNGLDEPTHRANGEARRAYVPROC)(GLuint first, GLsizei count, GLdouble* v)

    PFNGLDEPTHRANGEARRAYVPROC glDepthRangeArrayv

    ctypedef void (*PFNGLDEPTHRANGEINDEXEDPROC)(GLuint index, GLdouble n, GLdouble f)

    PFNGLDEPTHRANGEINDEXEDPROC glDepthRangeIndexed

    ctypedef void (*PFNGLGETFLOATI_VPROC)(GLenum target, GLuint index, GLfloat* data)

    PFNGLGETFLOATI_VPROC glGetFloati_v

    ctypedef void (*PFNGLGETDOUBLEI_VPROC)(GLenum target, GLuint index, GLdouble* data)

    PFNGLGETDOUBLEI_VPROC glGetDoublei_v

    enum:
        GL_DEPTH_BUFFER_BIT
        GL_STENCIL_BUFFER_BIT
        GL_COLOR_BUFFER_BIT
        GL_FALSE
        GL_TRUE
        GL_POINTS
        GL_LINES
        GL_LINE_LOOP
        GL_LINE_STRIP
        GL_TRIANGLES
        GL_TRIANGLE_STRIP
        GL_TRIANGLE_FAN
        GL_NEVER
        GL_LESS
        GL_EQUAL
        GL_LEQUAL
        GL_GREATER
        GL_NOTEQUAL
        GL_GEQUAL
        GL_ALWAYS
        GL_ZERO
        GL_ONE
        GL_SRC_COLOR
        GL_ONE_MINUS_SRC_COLOR
        GL_SRC_ALPHA
        GL_ONE_MINUS_SRC_ALPHA
        GL_DST_ALPHA
        GL_ONE_MINUS_DST_ALPHA
        GL_DST_COLOR
        GL_ONE_MINUS_DST_COLOR
        GL_SRC_ALPHA_SATURATE
        GL_NONE
        GL_FRONT_LEFT
        GL_FRONT_RIGHT
        GL_BACK_LEFT
        GL_BACK_RIGHT
        GL_FRONT
        GL_BACK
        GL_LEFT
        GL_RIGHT
        GL_FRONT_AND_BACK
        GL_NO_ERROR
        GL_INVALID_ENUM
        GL_INVALID_VALUE
        GL_INVALID_OPERATION
        GL_OUT_OF_MEMORY
        GL_CW
        GL_CCW
        GL_POINT_SIZE
        GL_POINT_SIZE_RANGE
        GL_POINT_SIZE_GRANULARITY
        GL_LINE_SMOOTH
        GL_LINE_WIDTH
        GL_LINE_WIDTH_RANGE
        GL_LINE_WIDTH_GRANULARITY
        GL_POLYGON_MODE
        GL_POLYGON_SMOOTH
        GL_CULL_FACE
        GL_CULL_FACE_MODE
        GL_FRONT_FACE
        GL_DEPTH_RANGE
        GL_DEPTH_TEST
        GL_DEPTH_WRITEMASK
        GL_DEPTH_CLEAR_VALUE
        GL_DEPTH_FUNC
        GL_STENCIL_TEST
        GL_STENCIL_CLEAR_VALUE
        GL_STENCIL_FUNC
        GL_STENCIL_VALUE_MASK
        GL_STENCIL_FAIL
        GL_STENCIL_PASS_DEPTH_FAIL
        GL_STENCIL_PASS_DEPTH_PASS
        GL_STENCIL_REF
        GL_STENCIL_WRITEMASK
        GL_VIEWPORT
        GL_DITHER
        GL_BLEND_DST
        GL_BLEND_SRC
        GL_BLEND
        GL_LOGIC_OP_MODE
        GL_DRAW_BUFFER
        GL_READ_BUFFER
        GL_SCISSOR_BOX
        GL_SCISSOR_TEST
        GL_COLOR_CLEAR_VALUE
        GL_COLOR_WRITEMASK
        GL_DOUBLEBUFFER
        GL_STEREO
        GL_LINE_SMOOTH_HINT
        GL_POLYGON_SMOOTH_HINT
        GL_UNPACK_SWAP_BYTES
        GL_UNPACK_LSB_FIRST
        GL_UNPACK_ROW_LENGTH
        GL_UNPACK_SKIP_ROWS
        GL_UNPACK_SKIP_PIXELS
        GL_UNPACK_ALIGNMENT
        GL_PACK_SWAP_BYTES
        GL_PACK_LSB_FIRST
        GL_PACK_ROW_LENGTH
        GL_PACK_SKIP_ROWS
        GL_PACK_SKIP_PIXELS
        GL_PACK_ALIGNMENT
        GL_MAX_TEXTURE_SIZE
        GL_MAX_VIEWPORT_DIMS
        GL_SUBPIXEL_BITS
        GL_TEXTURE_1D
        GL_TEXTURE_2D
        GL_TEXTURE_WIDTH
        GL_TEXTURE_HEIGHT
        GL_TEXTURE_BORDER_COLOR
        GL_DONT_CARE
        GL_FASTEST
        GL_NICEST
        GL_BYTE
        GL_UNSIGNED_BYTE
        GL_SHORT
        GL_UNSIGNED_SHORT
        GL_INT
        GL_UNSIGNED_INT
        GL_FLOAT
        GL_CLEAR
        GL_AND
        GL_AND_REVERSE
        GL_COPY
        GL_AND_INVERTED
        GL_NOOP
        GL_XOR
        GL_OR
        GL_NOR
        GL_EQUIV
        GL_INVERT
        GL_OR_REVERSE
        GL_COPY_INVERTED
        GL_OR_INVERTED
        GL_NAND
        GL_SET
        GL_TEXTURE
        GL_COLOR
        GL_DEPTH
        GL_STENCIL
        GL_STENCIL_INDEX
        GL_DEPTH_COMPONENT
        GL_RED
        GL_GREEN
        GL_BLUE
        GL_ALPHA
        GL_RGB
        GL_RGBA
        GL_POINT
        GL_LINE
        GL_FILL
        GL_KEEP
        GL_REPLACE
        GL_INCR
        GL_DECR
        GL_VENDOR
        GL_RENDERER
        GL_VERSION
        GL_EXTENSIONS
        GL_NEAREST
        GL_LINEAR
        GL_NEAREST_MIPMAP_NEAREST
        GL_LINEAR_MIPMAP_NEAREST
        GL_NEAREST_MIPMAP_LINEAR
        GL_LINEAR_MIPMAP_LINEAR
        GL_TEXTURE_MAG_FILTER
        GL_TEXTURE_MIN_FILTER
        GL_TEXTURE_WRAP_S
        GL_TEXTURE_WRAP_T
        GL_REPEAT
        GL_COLOR_LOGIC_OP
        GL_POLYGON_OFFSET_UNITS
        GL_POLYGON_OFFSET_POINT
        GL_POLYGON_OFFSET_LINE
        GL_POLYGON_OFFSET_FILL
        GL_POLYGON_OFFSET_FACTOR
        GL_TEXTURE_BINDING_1D
        GL_TEXTURE_BINDING_2D
        GL_TEXTURE_INTERNAL_FORMAT
        GL_TEXTURE_RED_SIZE
        GL_TEXTURE_GREEN_SIZE
        GL_TEXTURE_BLUE_SIZE
        GL_TEXTURE_ALPHA_SIZE
        GL_DOUBLE
        GL_PROXY_TEXTURE_1D
        GL_PROXY_TEXTURE_2D
        GL_R3_G3_B2
        GL_RGB4
        GL_RGB5
        GL_RGB8
        GL_RGB10
        GL_RGB12
        GL_RGB16
        GL_RGBA2
        GL_RGBA4
        GL_RGB5_A1
        GL_RGBA8
        GL_RGB10_A2
        GL_RGBA12
        GL_RGBA16
        GL_UNSIGNED_BYTE_3_3_2
        GL_UNSIGNED_SHORT_4_4_4_4
        GL_UNSIGNED_SHORT_5_5_5_1
        GL_UNSIGNED_INT_8_8_8_8
        GL_UNSIGNED_INT_10_10_10_2
        GL_TEXTURE_BINDING_3D
        GL_PACK_SKIP_IMAGES
        GL_PACK_IMAGE_HEIGHT
        GL_UNPACK_SKIP_IMAGES
        GL_UNPACK_IMAGE_HEIGHT
        GL_TEXTURE_3D
        GL_PROXY_TEXTURE_3D
        GL_TEXTURE_DEPTH
        GL_TEXTURE_WRAP_R
        GL_MAX_3D_TEXTURE_SIZE
        GL_UNSIGNED_BYTE_2_3_3_REV
        GL_UNSIGNED_SHORT_5_6_5
        GL_UNSIGNED_SHORT_5_6_5_REV
        GL_UNSIGNED_SHORT_4_4_4_4_REV
        GL_UNSIGNED_SHORT_1_5_5_5_REV
        GL_UNSIGNED_INT_8_8_8_8_REV
        GL_UNSIGNED_INT_2_10_10_10_REV
        GL_BGR
        GL_BGRA
        GL_MAX_ELEMENTS_VERTICES
        GL_MAX_ELEMENTS_INDICES
        GL_CLAMP_TO_EDGE
        GL_TEXTURE_MIN_LOD
        GL_TEXTURE_MAX_LOD
        GL_TEXTURE_BASE_LEVEL
        GL_TEXTURE_MAX_LEVEL
        GL_SMOOTH_POINT_SIZE_RANGE
        GL_SMOOTH_POINT_SIZE_GRANULARITY
        GL_SMOOTH_LINE_WIDTH_RANGE
        GL_SMOOTH_LINE_WIDTH_GRANULARITY
        GL_ALIASED_LINE_WIDTH_RANGE
        GL_TEXTURE0
        GL_TEXTURE1
        GL_TEXTURE2
        GL_TEXTURE3
        GL_TEXTURE4
        GL_TEXTURE5
        GL_TEXTURE6
        GL_TEXTURE7
        GL_TEXTURE8
        GL_TEXTURE9
        GL_TEXTURE10
        GL_TEXTURE11
        GL_TEXTURE12
        GL_TEXTURE13
        GL_TEXTURE14
        GL_TEXTURE15
        GL_TEXTURE16
        GL_TEXTURE17
        GL_TEXTURE18
        GL_TEXTURE19
        GL_TEXTURE20
        GL_TEXTURE21
        GL_TEXTURE22
        GL_TEXTURE23
        GL_TEXTURE24
        GL_TEXTURE25
        GL_TEXTURE26
        GL_TEXTURE27
        GL_TEXTURE28
        GL_TEXTURE29
        GL_TEXTURE30
        GL_TEXTURE31
        GL_ACTIVE_TEXTURE
        GL_MULTISAMPLE
        GL_SAMPLE_ALPHA_TO_COVERAGE
        GL_SAMPLE_ALPHA_TO_ONE
        GL_SAMPLE_COVERAGE
        GL_SAMPLE_BUFFERS
        GL_SAMPLES
        GL_SAMPLE_COVERAGE_VALUE
        GL_SAMPLE_COVERAGE_INVERT
        GL_TEXTURE_CUBE_MAP
        GL_TEXTURE_BINDING_CUBE_MAP
        GL_TEXTURE_CUBE_MAP_POSITIVE_X
        GL_TEXTURE_CUBE_MAP_NEGATIVE_X
        GL_TEXTURE_CUBE_MAP_POSITIVE_Y
        GL_TEXTURE_CUBE_MAP_NEGATIVE_Y
        GL_TEXTURE_CUBE_MAP_POSITIVE_Z
        GL_TEXTURE_CUBE_MAP_NEGATIVE_Z
        GL_PROXY_TEXTURE_CUBE_MAP
        GL_MAX_CUBE_MAP_TEXTURE_SIZE
        GL_COMPRESSED_RGB
        GL_COMPRESSED_RGBA
        GL_TEXTURE_COMPRESSION_HINT
        GL_TEXTURE_COMPRESSED_IMAGE_SIZE
        GL_TEXTURE_COMPRESSED
        GL_NUM_COMPRESSED_TEXTURE_FORMATS
        GL_COMPRESSED_TEXTURE_FORMATS
        GL_CLAMP_TO_BORDER
        GL_BLEND_DST_RGB
        GL_BLEND_SRC_RGB
        GL_BLEND_DST_ALPHA
        GL_BLEND_SRC_ALPHA
        GL_POINT_FADE_THRESHOLD_SIZE
        GL_DEPTH_COMPONENT16
        GL_DEPTH_COMPONENT24
        GL_DEPTH_COMPONENT32
        GL_MIRRORED_REPEAT
        GL_MAX_TEXTURE_LOD_BIAS
        GL_TEXTURE_LOD_BIAS
        GL_INCR_WRAP
        GL_DECR_WRAP
        GL_TEXTURE_DEPTH_SIZE
        GL_TEXTURE_COMPARE_MODE
        GL_TEXTURE_COMPARE_FUNC
        GL_BLEND_COLOR
        GL_BLEND_EQUATION
        GL_CONSTANT_COLOR
        GL_ONE_MINUS_CONSTANT_COLOR
        GL_CONSTANT_ALPHA
        GL_ONE_MINUS_CONSTANT_ALPHA
        GL_FUNC_ADD
        GL_FUNC_REVERSE_SUBTRACT
        GL_FUNC_SUBTRACT
        GL_MIN
        GL_MAX
        GL_BUFFER_SIZE
        GL_BUFFER_USAGE
        GL_QUERY_COUNTER_BITS
        GL_CURRENT_QUERY
        GL_QUERY_RESULT
        GL_QUERY_RESULT_AVAILABLE
        GL_ARRAY_BUFFER
        GL_ELEMENT_ARRAY_BUFFER
        GL_ARRAY_BUFFER_BINDING
        GL_ELEMENT_ARRAY_BUFFER_BINDING
        GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING
        GL_READ_ONLY
        GL_WRITE_ONLY
        GL_READ_WRITE
        GL_BUFFER_ACCESS
        GL_BUFFER_MAPPED
        GL_BUFFER_MAP_POINTER
        GL_STREAM_DRAW
        GL_STREAM_READ
        GL_STREAM_COPY
        GL_STATIC_DRAW
        GL_STATIC_READ
        GL_STATIC_COPY
        GL_DYNAMIC_DRAW
        GL_DYNAMIC_READ
        GL_DYNAMIC_COPY
        GL_SAMPLES_PASSED
        GL_SRC1_ALPHA
        GL_BLEND_EQUATION_RGB
        GL_VERTEX_ATTRIB_ARRAY_ENABLED
        GL_VERTEX_ATTRIB_ARRAY_SIZE
        GL_VERTEX_ATTRIB_ARRAY_STRIDE
        GL_VERTEX_ATTRIB_ARRAY_TYPE
        GL_CURRENT_VERTEX_ATTRIB
        GL_VERTEX_PROGRAM_POINT_SIZE
        GL_VERTEX_ATTRIB_ARRAY_POINTER
        GL_STENCIL_BACK_FUNC
        GL_STENCIL_BACK_FAIL
        GL_STENCIL_BACK_PASS_DEPTH_FAIL
        GL_STENCIL_BACK_PASS_DEPTH_PASS
        GL_MAX_DRAW_BUFFERS
        GL_DRAW_BUFFER0
        GL_DRAW_BUFFER1
        GL_DRAW_BUFFER2
        GL_DRAW_BUFFER3
        GL_DRAW_BUFFER4
        GL_DRAW_BUFFER5
        GL_DRAW_BUFFER6
        GL_DRAW_BUFFER7
        GL_DRAW_BUFFER8
        GL_DRAW_BUFFER9
        GL_DRAW_BUFFER10
        GL_DRAW_BUFFER11
        GL_DRAW_BUFFER12
        GL_DRAW_BUFFER13
        GL_DRAW_BUFFER14
        GL_DRAW_BUFFER15
        GL_BLEND_EQUATION_ALPHA
        GL_MAX_VERTEX_ATTRIBS
        GL_VERTEX_ATTRIB_ARRAY_NORMALIZED
        GL_MAX_TEXTURE_IMAGE_UNITS
        GL_FRAGMENT_SHADER
        GL_VERTEX_SHADER
        GL_MAX_FRAGMENT_UNIFORM_COMPONENTS
        GL_MAX_VERTEX_UNIFORM_COMPONENTS
        GL_MAX_VARYING_FLOATS
        GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS
        GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS
        GL_SHADER_TYPE
        GL_FLOAT_VEC2
        GL_FLOAT_VEC3
        GL_FLOAT_VEC4
        GL_INT_VEC2
        GL_INT_VEC3
        GL_INT_VEC4
        GL_BOOL
        GL_BOOL_VEC2
        GL_BOOL_VEC3
        GL_BOOL_VEC4
        GL_FLOAT_MAT2
        GL_FLOAT_MAT3
        GL_FLOAT_MAT4
        GL_SAMPLER_1D
        GL_SAMPLER_2D
        GL_SAMPLER_3D
        GL_SAMPLER_CUBE
        GL_SAMPLER_1D_SHADOW
        GL_SAMPLER_2D_SHADOW
        GL_DELETE_STATUS
        GL_COMPILE_STATUS
        GL_LINK_STATUS
        GL_VALIDATE_STATUS
        GL_INFO_LOG_LENGTH
        GL_ATTACHED_SHADERS
        GL_ACTIVE_UNIFORMS
        GL_ACTIVE_UNIFORM_MAX_LENGTH
        GL_SHADER_SOURCE_LENGTH
        GL_ACTIVE_ATTRIBUTES
        GL_ACTIVE_ATTRIBUTE_MAX_LENGTH
        GL_FRAGMENT_SHADER_DERIVATIVE_HINT
        GL_SHADING_LANGUAGE_VERSION
        GL_CURRENT_PROGRAM
        GL_POINT_SPRITE_COORD_ORIGIN
        GL_LOWER_LEFT
        GL_UPPER_LEFT
        GL_STENCIL_BACK_REF
        GL_STENCIL_BACK_VALUE_MASK
        GL_STENCIL_BACK_WRITEMASK
        GL_PIXEL_PACK_BUFFER
        GL_PIXEL_UNPACK_BUFFER
        GL_PIXEL_PACK_BUFFER_BINDING
        GL_PIXEL_UNPACK_BUFFER_BINDING
        GL_FLOAT_MAT2x3
        GL_FLOAT_MAT2x4
        GL_FLOAT_MAT3x2
        GL_FLOAT_MAT3x4
        GL_FLOAT_MAT4x2
        GL_FLOAT_MAT4x3
        GL_SRGB
        GL_SRGB8
        GL_SRGB_ALPHA
        GL_SRGB8_ALPHA8
        GL_COMPRESSED_SRGB
        GL_COMPRESSED_SRGB_ALPHA
        GL_COMPARE_REF_TO_TEXTURE
        GL_CLIP_DISTANCE0
        GL_CLIP_DISTANCE1
        GL_CLIP_DISTANCE2
        GL_CLIP_DISTANCE3
        GL_CLIP_DISTANCE4
        GL_CLIP_DISTANCE5
        GL_CLIP_DISTANCE6
        GL_CLIP_DISTANCE7
        GL_MAX_CLIP_DISTANCES
        GL_MAJOR_VERSION
        GL_MINOR_VERSION
        GL_NUM_EXTENSIONS
        GL_CONTEXT_FLAGS
        GL_COMPRESSED_RED
        GL_COMPRESSED_RG
        GL_CONTEXT_FLAG_FORWARD_COMPATIBLE_BIT
        GL_RGBA32F
        GL_RGB32F
        GL_RGBA16F
        GL_RGB16F
        GL_VERTEX_ATTRIB_ARRAY_INTEGER
        GL_MAX_ARRAY_TEXTURE_LAYERS
        GL_MIN_PROGRAM_TEXEL_OFFSET
        GL_MAX_PROGRAM_TEXEL_OFFSET
        GL_CLAMP_READ_COLOR
        GL_FIXED_ONLY
        GL_MAX_VARYING_COMPONENTS
        GL_TEXTURE_1D_ARRAY
        GL_PROXY_TEXTURE_1D_ARRAY
        GL_TEXTURE_2D_ARRAY
        GL_PROXY_TEXTURE_2D_ARRAY
        GL_TEXTURE_BINDING_1D_ARRAY
        GL_TEXTURE_BINDING_2D_ARRAY
        GL_R11F_G11F_B10F
        GL_UNSIGNED_INT_10F_11F_11F_REV
        GL_RGB9_E5
        GL_UNSIGNED_INT_5_9_9_9_REV
        GL_TEXTURE_SHARED_SIZE
        GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH
        GL_TRANSFORM_FEEDBACK_BUFFER_MODE
        GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS
        GL_TRANSFORM_FEEDBACK_VARYINGS
        GL_TRANSFORM_FEEDBACK_BUFFER_START
        GL_TRANSFORM_FEEDBACK_BUFFER_SIZE
        GL_PRIMITIVES_GENERATED
        GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN
        GL_RASTERIZER_DISCARD
        GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS
        GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS
        GL_INTERLEAVED_ATTRIBS
        GL_SEPARATE_ATTRIBS
        GL_TRANSFORM_FEEDBACK_BUFFER
        GL_TRANSFORM_FEEDBACK_BUFFER_BINDING
        GL_RGBA32UI
        GL_RGB32UI
        GL_RGBA16UI
        GL_RGB16UI
        GL_RGBA8UI
        GL_RGB8UI
        GL_RGBA32I
        GL_RGB32I
        GL_RGBA16I
        GL_RGB16I
        GL_RGBA8I
        GL_RGB8I
        GL_RED_INTEGER
        GL_GREEN_INTEGER
        GL_BLUE_INTEGER
        GL_RGB_INTEGER
        GL_RGBA_INTEGER
        GL_BGR_INTEGER
        GL_BGRA_INTEGER
        GL_SAMPLER_1D_ARRAY
        GL_SAMPLER_2D_ARRAY
        GL_SAMPLER_1D_ARRAY_SHADOW
        GL_SAMPLER_2D_ARRAY_SHADOW
        GL_SAMPLER_CUBE_SHADOW
        GL_UNSIGNED_INT_VEC2
        GL_UNSIGNED_INT_VEC3
        GL_UNSIGNED_INT_VEC4
        GL_INT_SAMPLER_1D
        GL_INT_SAMPLER_2D
        GL_INT_SAMPLER_3D
        GL_INT_SAMPLER_CUBE
        GL_INT_SAMPLER_1D_ARRAY
        GL_INT_SAMPLER_2D_ARRAY
        GL_UNSIGNED_INT_SAMPLER_1D
        GL_UNSIGNED_INT_SAMPLER_2D
        GL_UNSIGNED_INT_SAMPLER_3D
        GL_UNSIGNED_INT_SAMPLER_CUBE
        GL_UNSIGNED_INT_SAMPLER_1D_ARRAY
        GL_UNSIGNED_INT_SAMPLER_2D_ARRAY
        GL_QUERY_WAIT
        GL_QUERY_NO_WAIT
        GL_QUERY_BY_REGION_WAIT
        GL_QUERY_BY_REGION_NO_WAIT
        GL_BUFFER_ACCESS_FLAGS
        GL_BUFFER_MAP_LENGTH
        GL_BUFFER_MAP_OFFSET
        GL_DEPTH_COMPONENT32F
        GL_DEPTH32F_STENCIL8
        GL_FLOAT_32_UNSIGNED_INT_24_8_REV
        GL_INVALID_FRAMEBUFFER_OPERATION
        GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING
        GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE
        GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE
        GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE
        GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE
        GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE
        GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE
        GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE
        GL_FRAMEBUFFER_DEFAULT
        GL_FRAMEBUFFER_UNDEFINED
        GL_DEPTH_STENCIL_ATTACHMENT
        GL_MAX_RENDERBUFFER_SIZE
        GL_DEPTH_STENCIL
        GL_UNSIGNED_INT_24_8
        GL_DEPTH24_STENCIL8
        GL_TEXTURE_STENCIL_SIZE
        GL_TEXTURE_RED_TYPE
        GL_TEXTURE_GREEN_TYPE
        GL_TEXTURE_BLUE_TYPE
        GL_TEXTURE_ALPHA_TYPE
        GL_TEXTURE_DEPTH_TYPE
        GL_UNSIGNED_NORMALIZED
        GL_FRAMEBUFFER_BINDING
        GL_DRAW_FRAMEBUFFER_BINDING
        GL_RENDERBUFFER_BINDING
        GL_READ_FRAMEBUFFER
        GL_DRAW_FRAMEBUFFER
        GL_READ_FRAMEBUFFER_BINDING
        GL_RENDERBUFFER_SAMPLES
        GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE
        GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME
        GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL
        GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE
        GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER
        GL_FRAMEBUFFER_COMPLETE
        GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT
        GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT
        GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER
        GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER
        GL_FRAMEBUFFER_UNSUPPORTED
        GL_MAX_COLOR_ATTACHMENTS
        GL_COLOR_ATTACHMENT0
        GL_COLOR_ATTACHMENT1
        GL_COLOR_ATTACHMENT2
        GL_COLOR_ATTACHMENT3
        GL_COLOR_ATTACHMENT4
        GL_COLOR_ATTACHMENT5
        GL_COLOR_ATTACHMENT6
        GL_COLOR_ATTACHMENT7
        GL_COLOR_ATTACHMENT8
        GL_COLOR_ATTACHMENT9
        GL_COLOR_ATTACHMENT10
        GL_COLOR_ATTACHMENT11
        GL_COLOR_ATTACHMENT12
        GL_COLOR_ATTACHMENT13
        GL_COLOR_ATTACHMENT14
        GL_COLOR_ATTACHMENT15
        GL_COLOR_ATTACHMENT16
        GL_COLOR_ATTACHMENT17
        GL_COLOR_ATTACHMENT18
        GL_COLOR_ATTACHMENT19
        GL_COLOR_ATTACHMENT20
        GL_COLOR_ATTACHMENT21
        GL_COLOR_ATTACHMENT22
        GL_COLOR_ATTACHMENT23
        GL_COLOR_ATTACHMENT24
        GL_COLOR_ATTACHMENT25
        GL_COLOR_ATTACHMENT26
        GL_COLOR_ATTACHMENT27
        GL_COLOR_ATTACHMENT28
        GL_COLOR_ATTACHMENT29
        GL_COLOR_ATTACHMENT30
        GL_COLOR_ATTACHMENT31
        GL_DEPTH_ATTACHMENT
        GL_STENCIL_ATTACHMENT
        GL_FRAMEBUFFER
        GL_RENDERBUFFER
        GL_RENDERBUFFER_WIDTH
        GL_RENDERBUFFER_HEIGHT
        GL_RENDERBUFFER_INTERNAL_FORMAT
        GL_STENCIL_INDEX1
        GL_STENCIL_INDEX4
        GL_STENCIL_INDEX8
        GL_STENCIL_INDEX16
        GL_RENDERBUFFER_RED_SIZE
        GL_RENDERBUFFER_GREEN_SIZE
        GL_RENDERBUFFER_BLUE_SIZE
        GL_RENDERBUFFER_ALPHA_SIZE
        GL_RENDERBUFFER_DEPTH_SIZE
        GL_RENDERBUFFER_STENCIL_SIZE
        GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE
        GL_MAX_SAMPLES
        GL_FRAMEBUFFER_SRGB
        GL_HALF_FLOAT
        GL_MAP_READ_BIT
        GL_MAP_WRITE_BIT
        GL_MAP_INVALIDATE_RANGE_BIT
        GL_MAP_INVALIDATE_BUFFER_BIT
        GL_MAP_FLUSH_EXPLICIT_BIT
        GL_MAP_UNSYNCHRONIZED_BIT
        GL_COMPRESSED_RED_RGTC1
        GL_COMPRESSED_SIGNED_RED_RGTC1
        GL_COMPRESSED_RG_RGTC2
        GL_COMPRESSED_SIGNED_RG_RGTC2
        GL_RG
        GL_RG_INTEGER
        GL_R8
        GL_R16
        GL_RG8
        GL_RG16
        GL_R16F
        GL_R32F
        GL_RG16F
        GL_RG32F
        GL_R8I
        GL_R8UI
        GL_R16I
        GL_R16UI
        GL_R32I
        GL_R32UI
        GL_RG8I
        GL_RG8UI
        GL_RG16I
        GL_RG16UI
        GL_RG32I
        GL_RG32UI
        GL_VERTEX_ARRAY_BINDING
        GL_SAMPLER_2D_RECT
        GL_SAMPLER_2D_RECT_SHADOW
        GL_SAMPLER_BUFFER
        GL_INT_SAMPLER_2D_RECT
        GL_INT_SAMPLER_BUFFER
        GL_UNSIGNED_INT_SAMPLER_2D_RECT
        GL_UNSIGNED_INT_SAMPLER_BUFFER
        GL_TEXTURE_BUFFER
        GL_MAX_TEXTURE_BUFFER_SIZE
        GL_TEXTURE_BINDING_BUFFER
        GL_TEXTURE_BUFFER_DATA_STORE_BINDING
        GL_TEXTURE_RECTANGLE
        GL_TEXTURE_BINDING_RECTANGLE
        GL_PROXY_TEXTURE_RECTANGLE
        GL_MAX_RECTANGLE_TEXTURE_SIZE
        GL_R8_SNORM
        GL_RG8_SNORM
        GL_RGB8_SNORM
        GL_RGBA8_SNORM
        GL_R16_SNORM
        GL_RG16_SNORM
        GL_RGB16_SNORM
        GL_RGBA16_SNORM
        GL_SIGNED_NORMALIZED
        GL_PRIMITIVE_RESTART
        GL_PRIMITIVE_RESTART_INDEX
        GL_COPY_READ_BUFFER
        GL_COPY_WRITE_BUFFER
        GL_UNIFORM_BUFFER
        GL_UNIFORM_BUFFER_BINDING
        GL_UNIFORM_BUFFER_START
        GL_UNIFORM_BUFFER_SIZE
        GL_MAX_VERTEX_UNIFORM_BLOCKS
        GL_MAX_GEOMETRY_UNIFORM_BLOCKS
        GL_MAX_FRAGMENT_UNIFORM_BLOCKS
        GL_MAX_COMBINED_UNIFORM_BLOCKS
        GL_MAX_UNIFORM_BUFFER_BINDINGS
        GL_MAX_UNIFORM_BLOCK_SIZE
        GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS
        GL_MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS
        GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS
        GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT
        GL_ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH
        GL_ACTIVE_UNIFORM_BLOCKS
        GL_UNIFORM_TYPE
        GL_UNIFORM_SIZE
        GL_UNIFORM_NAME_LENGTH
        GL_UNIFORM_BLOCK_INDEX
        GL_UNIFORM_OFFSET
        GL_UNIFORM_ARRAY_STRIDE
        GL_UNIFORM_MATRIX_STRIDE
        GL_UNIFORM_IS_ROW_MAJOR
        GL_UNIFORM_BLOCK_BINDING
        GL_UNIFORM_BLOCK_DATA_SIZE
        GL_UNIFORM_BLOCK_NAME_LENGTH
        GL_UNIFORM_BLOCK_ACTIVE_UNIFORMS
        GL_UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES
        GL_UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER
        GL_UNIFORM_BLOCK_REFERENCED_BY_GEOMETRY_SHADER
        GL_UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER
        GL_INVALID_INDEX
        GL_CONTEXT_CORE_PROFILE_BIT
        GL_CONTEXT_COMPATIBILITY_PROFILE_BIT
        GL_LINES_ADJACENCY
        GL_LINE_STRIP_ADJACENCY
        GL_TRIANGLES_ADJACENCY
        GL_TRIANGLE_STRIP_ADJACENCY
        GL_PROGRAM_POINT_SIZE
        GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS
        GL_FRAMEBUFFER_ATTACHMENT_LAYERED
        GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS
        GL_GEOMETRY_SHADER
        GL_GEOMETRY_VERTICES_OUT
        GL_GEOMETRY_INPUT_TYPE
        GL_GEOMETRY_OUTPUT_TYPE
        GL_MAX_GEOMETRY_UNIFORM_COMPONENTS
        GL_MAX_GEOMETRY_OUTPUT_VERTICES
        GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS
        GL_MAX_VERTEX_OUTPUT_COMPONENTS
        GL_MAX_GEOMETRY_INPUT_COMPONENTS
        GL_MAX_GEOMETRY_OUTPUT_COMPONENTS
        GL_MAX_FRAGMENT_INPUT_COMPONENTS
        GL_CONTEXT_PROFILE_MASK
        GL_DEPTH_CLAMP
        GL_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION
        GL_FIRST_VERTEX_CONVENTION
        GL_LAST_VERTEX_CONVENTION
        GL_PROVOKING_VERTEX
        GL_TEXTURE_CUBE_MAP_SEAMLESS
        GL_MAX_SERVER_WAIT_TIMEOUT
        GL_OBJECT_TYPE
        GL_SYNC_CONDITION
        GL_SYNC_STATUS
        GL_SYNC_FLAGS
        GL_SYNC_FENCE
        GL_SYNC_GPU_COMMANDS_COMPLETE
        GL_UNSIGNALED
        GL_SIGNALED
        GL_ALREADY_SIGNALED
        GL_TIMEOUT_EXPIRED
        GL_CONDITION_SATISFIED
        GL_WAIT_FAILED
        GL_TIMEOUT_IGNORED
        GL_SYNC_FLUSH_COMMANDS_BIT
        GL_SAMPLE_POSITION
        GL_SAMPLE_MASK
        GL_SAMPLE_MASK_VALUE
        GL_MAX_SAMPLE_MASK_WORDS
        GL_TEXTURE_2D_MULTISAMPLE
        GL_PROXY_TEXTURE_2D_MULTISAMPLE
        GL_TEXTURE_2D_MULTISAMPLE_ARRAY
        GL_PROXY_TEXTURE_2D_MULTISAMPLE_ARRAY
        GL_TEXTURE_BINDING_2D_MULTISAMPLE
        GL_TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY
        GL_TEXTURE_SAMPLES
        GL_TEXTURE_FIXED_SAMPLE_LOCATIONS
        GL_SAMPLER_2D_MULTISAMPLE
        GL_INT_SAMPLER_2D_MULTISAMPLE
        GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE
        GL_SAMPLER_2D_MULTISAMPLE_ARRAY
        GL_INT_SAMPLER_2D_MULTISAMPLE_ARRAY
        GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY
        GL_MAX_COLOR_TEXTURE_SAMPLES
        GL_MAX_DEPTH_TEXTURE_SAMPLES
        GL_MAX_INTEGER_SAMPLES
        GL_VERTEX_ATTRIB_ARRAY_DIVISOR
        GL_SRC1_COLOR
        GL_ONE_MINUS_SRC1_COLOR
        GL_ONE_MINUS_SRC1_ALPHA
        GL_MAX_DUAL_SOURCE_DRAW_BUFFERS
        GL_ANY_SAMPLES_PASSED
        GL_SAMPLER_BINDING
        GL_RGB10_A2UI
        GL_TEXTURE_SWIZZLE_R
        GL_TEXTURE_SWIZZLE_G
        GL_TEXTURE_SWIZZLE_B
        GL_TEXTURE_SWIZZLE_A
        GL_TEXTURE_SWIZZLE_RGBA
        GL_TIME_ELAPSED
        GL_TIMESTAMP
        GL_INT_2_10_10_10_REV
        GL_SAMPLE_SHADING
        GL_MIN_SAMPLE_SHADING_VALUE
        GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET
        GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET
        GL_TEXTURE_CUBE_MAP_ARRAY
        GL_TEXTURE_BINDING_CUBE_MAP_ARRAY
        GL_PROXY_TEXTURE_CUBE_MAP_ARRAY
        GL_SAMPLER_CUBE_MAP_ARRAY
        GL_SAMPLER_CUBE_MAP_ARRAY_SHADOW
        GL_INT_SAMPLER_CUBE_MAP_ARRAY
        GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY
        GL_DRAW_INDIRECT_BUFFER
        GL_DRAW_INDIRECT_BUFFER_BINDING
        GL_GEOMETRY_SHADER_INVOCATIONS
        GL_MAX_GEOMETRY_SHADER_INVOCATIONS
        GL_MIN_FRAGMENT_INTERPOLATION_OFFSET
        GL_MAX_FRAGMENT_INTERPOLATION_OFFSET
        GL_FRAGMENT_INTERPOLATION_OFFSET_BITS
        GL_MAX_VERTEX_STREAMS
        GL_DOUBLE_VEC2
        GL_DOUBLE_VEC3
        GL_DOUBLE_VEC4
        GL_DOUBLE_MAT2
        GL_DOUBLE_MAT3
        GL_DOUBLE_MAT4
        GL_DOUBLE_MAT2x3
        GL_DOUBLE_MAT2x4
        GL_DOUBLE_MAT3x2
        GL_DOUBLE_MAT3x4
        GL_DOUBLE_MAT4x2
        GL_DOUBLE_MAT4x3
        GL_ACTIVE_SUBROUTINES
        GL_ACTIVE_SUBROUTINE_UNIFORMS
        GL_ACTIVE_SUBROUTINE_UNIFORM_LOCATIONS
        GL_ACTIVE_SUBROUTINE_MAX_LENGTH
        GL_ACTIVE_SUBROUTINE_UNIFORM_MAX_LENGTH
        GL_MAX_SUBROUTINES
        GL_MAX_SUBROUTINE_UNIFORM_LOCATIONS
        GL_NUM_COMPATIBLE_SUBROUTINES
        GL_COMPATIBLE_SUBROUTINES
        GL_PATCHES
        GL_PATCH_VERTICES
        GL_PATCH_DEFAULT_INNER_LEVEL
        GL_PATCH_DEFAULT_OUTER_LEVEL
        GL_TESS_CONTROL_OUTPUT_VERTICES
        GL_TESS_GEN_MODE
        GL_TESS_GEN_SPACING
        GL_TESS_GEN_VERTEX_ORDER
        GL_TESS_GEN_POINT_MODE
        GL_ISOLINES
        GL_QUADS
        GL_FRACTIONAL_ODD
        GL_FRACTIONAL_EVEN
        GL_MAX_PATCH_VERTICES
        GL_MAX_TESS_GEN_LEVEL
        GL_MAX_TESS_CONTROL_UNIFORM_COMPONENTS
        GL_MAX_TESS_EVALUATION_UNIFORM_COMPONENTS
        GL_MAX_TESS_CONTROL_TEXTURE_IMAGE_UNITS
        GL_MAX_TESS_EVALUATION_TEXTURE_IMAGE_UNITS
        GL_MAX_TESS_CONTROL_OUTPUT_COMPONENTS
        GL_MAX_TESS_PATCH_COMPONENTS
        GL_MAX_TESS_CONTROL_TOTAL_OUTPUT_COMPONENTS
        GL_MAX_TESS_EVALUATION_OUTPUT_COMPONENTS
        GL_MAX_TESS_CONTROL_UNIFORM_BLOCKS
        GL_MAX_TESS_EVALUATION_UNIFORM_BLOCKS
        GL_MAX_TESS_CONTROL_INPUT_COMPONENTS
        GL_MAX_TESS_EVALUATION_INPUT_COMPONENTS
        GL_MAX_COMBINED_TESS_CONTROL_UNIFORM_COMPONENTS
        GL_MAX_COMBINED_TESS_EVALUATION_UNIFORM_COMPONENTS
        GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_CONTROL_SHADER
        GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_EVALUATION_SHADER
        GL_TESS_EVALUATION_SHADER
        GL_TESS_CONTROL_SHADER
        GL_TRANSFORM_FEEDBACK
        GL_TRANSFORM_FEEDBACK_BUFFER_PAUSED
        GL_TRANSFORM_FEEDBACK_BUFFER_ACTIVE
        GL_TRANSFORM_FEEDBACK_BINDING
        GL_MAX_TRANSFORM_FEEDBACK_BUFFERS
        GL_FIXED
        GL_IMPLEMENTATION_COLOR_READ_TYPE
        GL_IMPLEMENTATION_COLOR_READ_FORMAT
        GL_LOW_FLOAT
        GL_MEDIUM_FLOAT
        GL_HIGH_FLOAT
        GL_LOW_INT
        GL_MEDIUM_INT
        GL_HIGH_INT
        GL_SHADER_COMPILER
        GL_SHADER_BINARY_FORMATS
        GL_NUM_SHADER_BINARY_FORMATS
        GL_MAX_VERTEX_UNIFORM_VECTORS
        GL_MAX_VARYING_VECTORS
        GL_MAX_FRAGMENT_UNIFORM_VECTORS
        GL_RGB565
        GL_PROGRAM_BINARY_RETRIEVABLE_HINT
        GL_PROGRAM_BINARY_LENGTH
        GL_NUM_PROGRAM_BINARY_FORMATS
        GL_PROGRAM_BINARY_FORMATS
        GL_VERTEX_SHADER_BIT
        GL_FRAGMENT_SHADER_BIT
        GL_GEOMETRY_SHADER_BIT
        GL_TESS_CONTROL_SHADER_BIT
        GL_TESS_EVALUATION_SHADER_BIT
        GL_ALL_SHADER_BITS
        GL_PROGRAM_SEPARABLE
        GL_ACTIVE_PROGRAM
        GL_PROGRAM_PIPELINE_BINDING
        GL_MAX_VIEWPORTS
        GL_VIEWPORT_SUBPIXEL_BITS
        GL_VIEWPORT_BOUNDS_RANGE
        GL_LAYER_PROVOKING_VERTEX
        GL_VIEWPORT_INDEX_PROVOKING_VERTEX
        GL_UNDEFINED_VERTEX
