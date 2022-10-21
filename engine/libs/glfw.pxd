from libc.stdint cimport uint64_t, uint32_t

cdef extern from "GLFW/glfw3.h":

    ctypedef void (*GLFWglproc)()

    ctypedef void (*GLFWvkproc)()

    ctypedef struct GLFWmonitor:
        pass

    ctypedef struct GLFWwindow:
        pass

    ctypedef struct GLFWcursor:
        pass

    ctypedef void (*GLFWerrorfun)(int error_code, char* description)

    ctypedef void (*GLFWwindowposfun)(GLFWwindow* window, int xpos, int ypos)

    ctypedef void (*GLFWwindowsizefun)(GLFWwindow* window, int width, int height)

    ctypedef void (*GLFWwindowclosefun)(GLFWwindow* window)

    ctypedef void (*GLFWwindowrefreshfun)(GLFWwindow* window)

    ctypedef void (*GLFWwindowfocusfun)(GLFWwindow* window, int focused)

    ctypedef void (*GLFWwindowiconifyfun)(GLFWwindow* window, int iconified)

    ctypedef void (*GLFWwindowmaximizefun)(GLFWwindow* window, int maximized)

    ctypedef void (*GLFWframebuffersizefun)(GLFWwindow* window, int width, int height)

    ctypedef void (*GLFWwindowcontentscalefun)(GLFWwindow* window, float xscale, float yscale)

    ctypedef void (*GLFWmousebuttonfun)(GLFWwindow* window, int button, int action, int mods)

    ctypedef void (*GLFWcursorposfun)(GLFWwindow* window, double xpos, double ypos)

    ctypedef void (*GLFWcursorenterfun)(GLFWwindow* window, int entered)

    ctypedef void (*GLFWscrollfun)(GLFWwindow* window, double xoffset, double yoffset)

    ctypedef void (*GLFWkeyfun)(GLFWwindow* window, int key, int scancode, int action, int mods)

    ctypedef void (*GLFWcharfun)(GLFWwindow* window, unsigned int codepoint)

    ctypedef void (*GLFWcharmodsfun)(GLFWwindow* window, unsigned int codepoint, int mods)

    ctypedef void (*GLFWdropfun)(GLFWwindow* window, int path_count, char* paths[])

    ctypedef void (*GLFWmonitorfun)(GLFWmonitor* monitor, int event)

    ctypedef void (*GLFWjoystickfun)(int jid, int event)

    cdef struct GLFWvidmode:
        int width
        int height
        int redBits
        int greenBits
        int blueBits
        int refreshRate

    cdef struct GLFWgammaramp:
        unsigned short* red
        unsigned short* green
        unsigned short* blue
        unsigned int size

    cdef struct GLFWimage:
        int width
        int height
        unsigned char* pixels

    cdef struct GLFWgamepadstate:
        unsigned char buttons[15]
        float axes[6]

    int glfwInit()

    void glfwTerminate()

    void glfwInitHint(int hint, int value)

    void glfwGetVersion(int* major, int* minor, int* rev)

    char* glfwGetVersionString()

    int glfwGetError(char** description)

    GLFWerrorfun glfwSetErrorCallback(GLFWerrorfun callback)

    GLFWmonitor** glfwGetMonitors(int* count)

    GLFWmonitor* glfwGetPrimaryMonitor()

    void glfwGetMonitorPos(GLFWmonitor* monitor, int* xpos, int* ypos)

    void glfwGetMonitorWorkarea(GLFWmonitor* monitor, int* xpos, int* ypos, int* width, int* height)

    void glfwGetMonitorPhysicalSize(GLFWmonitor* monitor, int* widthMM, int* heightMM)

    void glfwGetMonitorContentScale(GLFWmonitor* monitor, float* xscale, float* yscale)

    char* glfwGetMonitorName(GLFWmonitor* monitor)

    void glfwSetMonitorUserPointer(GLFWmonitor* monitor, void* pointer)

    void* glfwGetMonitorUserPointer(GLFWmonitor* monitor)

    GLFWmonitorfun glfwSetMonitorCallback(GLFWmonitorfun callback)

    GLFWvidmode* glfwGetVideoModes(GLFWmonitor* monitor, int* count)

    GLFWvidmode* glfwGetVideoMode(GLFWmonitor* monitor)

    void glfwSetGamma(GLFWmonitor* monitor, float gamma)

    GLFWgammaramp* glfwGetGammaRamp(GLFWmonitor* monitor)

    void glfwSetGammaRamp(GLFWmonitor* monitor, GLFWgammaramp* ramp)

    void glfwDefaultWindowHints()

    void glfwWindowHint(int hint, int value)

    void glfwWindowHintString(int hint, char* value)

    GLFWwindow* glfwCreateWindow(int width, int height, char* title, GLFWmonitor* monitor, GLFWwindow* share)

    void glfwDestroyWindow(GLFWwindow* window)

    int glfwWindowShouldClose(GLFWwindow* window)

    void glfwSetWindowShouldClose(GLFWwindow* window, int value)

    void glfwSetWindowTitle(GLFWwindow* window, char* title)

    void glfwSetWindowIcon(GLFWwindow* window, int count, GLFWimage* images)

    void glfwGetWindowPos(GLFWwindow* window, int* xpos, int* ypos)

    void glfwSetWindowPos(GLFWwindow* window, int xpos, int ypos)

    void glfwGetWindowSize(GLFWwindow* window, int* width, int* height)

    void glfwSetWindowSizeLimits(GLFWwindow* window, int minwidth, int minheight, int maxwidth, int maxheight)

    void glfwSetWindowAspectRatio(GLFWwindow* window, int numer, int denom)

    void glfwSetWindowSize(GLFWwindow* window, int width, int height)

    void glfwGetFramebufferSize(GLFWwindow* window, int* width, int* height)

    void glfwGetWindowFrameSize(GLFWwindow* window, int* left, int* top, int* right, int* bottom)

    void glfwGetWindowContentScale(GLFWwindow* window, float* xscale, float* yscale)

    float glfwGetWindowOpacity(GLFWwindow* window)

    void glfwSetWindowOpacity(GLFWwindow* window, float opacity)

    void glfwIconifyWindow(GLFWwindow* window)

    void glfwRestoreWindow(GLFWwindow* window)

    void glfwMaximizeWindow(GLFWwindow* window)

    void glfwShowWindow(GLFWwindow* window)

    void glfwHideWindow(GLFWwindow* window)

    void glfwFocusWindow(GLFWwindow* window)

    void glfwRequestWindowAttention(GLFWwindow* window)

    GLFWmonitor* glfwGetWindowMonitor(GLFWwindow* window)

    void glfwSetWindowMonitor(GLFWwindow* window, GLFWmonitor* monitor, int xpos, int ypos, int width, int height, int refreshRate)

    int glfwGetWindowAttrib(GLFWwindow* window, int attrib)

    void glfwSetWindowAttrib(GLFWwindow* window, int attrib, int value)

    void glfwSetWindowUserPointer(GLFWwindow* window, void* pointer)

    void* glfwGetWindowUserPointer(GLFWwindow* window)

    GLFWwindowposfun glfwSetWindowPosCallback(GLFWwindow* window, GLFWwindowposfun callback)

    GLFWwindowsizefun glfwSetWindowSizeCallback(GLFWwindow* window, GLFWwindowsizefun callback)

    GLFWwindowclosefun glfwSetWindowCloseCallback(GLFWwindow* window, GLFWwindowclosefun callback)

    GLFWwindowrefreshfun glfwSetWindowRefreshCallback(GLFWwindow* window, GLFWwindowrefreshfun callback)

    GLFWwindowfocusfun glfwSetWindowFocusCallback(GLFWwindow* window, GLFWwindowfocusfun callback)

    GLFWwindowiconifyfun glfwSetWindowIconifyCallback(GLFWwindow* window, GLFWwindowiconifyfun callback)

    GLFWwindowmaximizefun glfwSetWindowMaximizeCallback(GLFWwindow* window, GLFWwindowmaximizefun callback)

    GLFWframebuffersizefun glfwSetFramebufferSizeCallback(GLFWwindow* window, GLFWframebuffersizefun callback)

    GLFWwindowcontentscalefun glfwSetWindowContentScaleCallback(GLFWwindow* window, GLFWwindowcontentscalefun callback)

    void glfwPollEvents()

    void glfwWaitEvents()

    void glfwWaitEventsTimeout(double timeout)

    void glfwPostEmptyEvent()

    int glfwGetInputMode(GLFWwindow* window, int mode)

    void glfwSetInputMode(GLFWwindow* window, int mode, int value)

    int glfwRawMouseMotionSupported()

    char* glfwGetKeyName(int key, int scancode)

    int glfwGetKeyScancode(int key)

    int glfwGetKey(GLFWwindow* window, int key)

    int glfwGetMouseButton(GLFWwindow* window, int button)

    void glfwGetCursorPos(GLFWwindow* window, double* xpos, double* ypos)

    void glfwSetCursorPos(GLFWwindow* window, double xpos, double ypos)

    GLFWcursor* glfwCreateCursor(GLFWimage* image, int xhot, int yhot)

    GLFWcursor* glfwCreateStandardCursor(int shape)

    void glfwDestroyCursor(GLFWcursor* cursor)

    void glfwSetCursor(GLFWwindow* window, GLFWcursor* cursor)

    GLFWkeyfun glfwSetKeyCallback(GLFWwindow* window, GLFWkeyfun callback)

    GLFWcharfun glfwSetCharCallback(GLFWwindow* window, GLFWcharfun callback)

    GLFWcharmodsfun glfwSetCharModsCallback(GLFWwindow* window, GLFWcharmodsfun callback)

    GLFWmousebuttonfun glfwSetMouseButtonCallback(GLFWwindow* window, GLFWmousebuttonfun callback)

    GLFWcursorposfun glfwSetCursorPosCallback(GLFWwindow* window, GLFWcursorposfun callback)

    GLFWcursorenterfun glfwSetCursorEnterCallback(GLFWwindow* window, GLFWcursorenterfun callback)

    GLFWscrollfun glfwSetScrollCallback(GLFWwindow* window, GLFWscrollfun callback)

    GLFWdropfun glfwSetDropCallback(GLFWwindow* window, GLFWdropfun callback)

    int glfwJoystickPresent(int jid)

    float* glfwGetJoystickAxes(int jid, int* count)

    unsigned char* glfwGetJoystickButtons(int jid, int* count)

    unsigned char* glfwGetJoystickHats(int jid, int* count)

    char* glfwGetJoystickName(int jid)

    char* glfwGetJoystickGUID(int jid)

    void glfwSetJoystickUserPointer(int jid, void* pointer)

    void* glfwGetJoystickUserPointer(int jid)

    int glfwJoystickIsGamepad(int jid)

    GLFWjoystickfun glfwSetJoystickCallback(GLFWjoystickfun callback)

    int glfwUpdateGamepadMappings(char* string)

    char* glfwGetGamepadName(int jid)

    int glfwGetGamepadState(int jid, GLFWgamepadstate* state)

    void glfwSetClipboardString(GLFWwindow* window, char* string)

    char* glfwGetClipboardString(GLFWwindow* window)

    double glfwGetTime()

    void glfwSetTime(double time)

    uint64_t glfwGetTimerValue()

    uint64_t glfwGetTimerFrequency()

    void glfwMakeContextCurrent(GLFWwindow* window)

    GLFWwindow* glfwGetCurrentContext()

    void glfwSwapBuffers(GLFWwindow* window)

    void glfwSwapInterval(int interval)

    int glfwExtensionSupported(char* extension)

    GLFWglproc glfwGetProcAddress(char* procname)

    int glfwVulkanSupported()

    char** glfwGetRequiredInstanceExtensions(uint32_t* count)

    enum:
        GLFW_VERSION_MAJOR
        GLFW_VERSION_MINOR
        GLFW_VERSION_REVISION
        GLFW_TRUE
        GLFW_FALSE
        GLFW_RELEASE
        GLFW_PRESS
        GLFW_REPEAT
        GLFW_HAT_CENTERED
        GLFW_HAT_UP
        GLFW_HAT_RIGHT
        GLFW_HAT_DOWN
        GLFW_HAT_LEFT
        GLFW_HAT_RIGHT_UP
        GLFW_HAT_RIGHT_DOWN
        GLFW_HAT_LEFT_UP
        GLFW_HAT_LEFT_DOWN
        GLFW_KEY_UNKNOWN
        GLFW_KEY_SPACE
        GLFW_KEY_APOSTROPHE
        GLFW_KEY_COMMA
        GLFW_KEY_MINUS
        GLFW_KEY_PERIOD
        GLFW_KEY_SLASH
        GLFW_KEY_0
        GLFW_KEY_1
        GLFW_KEY_2
        GLFW_KEY_3
        GLFW_KEY_4
        GLFW_KEY_5
        GLFW_KEY_6
        GLFW_KEY_7
        GLFW_KEY_8
        GLFW_KEY_9
        GLFW_KEY_SEMICOLON
        GLFW_KEY_EQUAL
        GLFW_KEY_A
        GLFW_KEY_B
        GLFW_KEY_C
        GLFW_KEY_D
        GLFW_KEY_E
        GLFW_KEY_F
        GLFW_KEY_G
        GLFW_KEY_H
        GLFW_KEY_I
        GLFW_KEY_J
        GLFW_KEY_K
        GLFW_KEY_L
        GLFW_KEY_M
        GLFW_KEY_N
        GLFW_KEY_O
        GLFW_KEY_P
        GLFW_KEY_Q
        GLFW_KEY_R
        GLFW_KEY_S
        GLFW_KEY_T
        GLFW_KEY_U
        GLFW_KEY_V
        GLFW_KEY_W
        GLFW_KEY_X
        GLFW_KEY_Y
        GLFW_KEY_Z
        GLFW_KEY_LEFT_BRACKET
        GLFW_KEY_BACKSLASH
        GLFW_KEY_RIGHT_BRACKET
        GLFW_KEY_GRAVE_ACCENT
        GLFW_KEY_WORLD_1
        GLFW_KEY_WORLD_2
        GLFW_KEY_ESCAPE
        GLFW_KEY_ENTER
        GLFW_KEY_TAB
        GLFW_KEY_BACKSPACE
        GLFW_KEY_INSERT
        GLFW_KEY_DELETE
        GLFW_KEY_RIGHT
        GLFW_KEY_LEFT
        GLFW_KEY_DOWN
        GLFW_KEY_UP
        GLFW_KEY_PAGE_UP
        GLFW_KEY_PAGE_DOWN
        GLFW_KEY_HOME
        GLFW_KEY_END
        GLFW_KEY_CAPS_LOCK
        GLFW_KEY_SCROLL_LOCK
        GLFW_KEY_NUM_LOCK
        GLFW_KEY_PRINT_SCREEN
        GLFW_KEY_PAUSE
        GLFW_KEY_F1
        GLFW_KEY_F2
        GLFW_KEY_F3
        GLFW_KEY_F4
        GLFW_KEY_F5
        GLFW_KEY_F6
        GLFW_KEY_F7
        GLFW_KEY_F8
        GLFW_KEY_F9
        GLFW_KEY_F10
        GLFW_KEY_F11
        GLFW_KEY_F12
        GLFW_KEY_F13
        GLFW_KEY_F14
        GLFW_KEY_F15
        GLFW_KEY_F16
        GLFW_KEY_F17
        GLFW_KEY_F18
        GLFW_KEY_F19
        GLFW_KEY_F20
        GLFW_KEY_F21
        GLFW_KEY_F22
        GLFW_KEY_F23
        GLFW_KEY_F24
        GLFW_KEY_F25
        GLFW_KEY_KP_0
        GLFW_KEY_KP_1
        GLFW_KEY_KP_2
        GLFW_KEY_KP_3
        GLFW_KEY_KP_4
        GLFW_KEY_KP_5
        GLFW_KEY_KP_6
        GLFW_KEY_KP_7
        GLFW_KEY_KP_8
        GLFW_KEY_KP_9
        GLFW_KEY_KP_DECIMAL
        GLFW_KEY_KP_DIVIDE
        GLFW_KEY_KP_MULTIPLY
        GLFW_KEY_KP_SUBTRACT
        GLFW_KEY_KP_ADD
        GLFW_KEY_KP_ENTER
        GLFW_KEY_KP_EQUAL
        GLFW_KEY_LEFT_SHIFT
        GLFW_KEY_LEFT_CONTROL
        GLFW_KEY_LEFT_ALT
        GLFW_KEY_LEFT_SUPER
        GLFW_KEY_RIGHT_SHIFT
        GLFW_KEY_RIGHT_CONTROL
        GLFW_KEY_RIGHT_ALT
        GLFW_KEY_RIGHT_SUPER
        GLFW_KEY_MENU
        GLFW_KEY_LAST
        GLFW_MOD_SHIFT
        GLFW_MOD_CONTROL
        GLFW_MOD_ALT
        GLFW_MOD_SUPER
        GLFW_MOD_CAPS_LOCK
        GLFW_MOD_NUM_LOCK
        GLFW_MOUSE_BUTTON_1
        GLFW_MOUSE_BUTTON_2
        GLFW_MOUSE_BUTTON_3
        GLFW_MOUSE_BUTTON_4
        GLFW_MOUSE_BUTTON_5
        GLFW_MOUSE_BUTTON_6
        GLFW_MOUSE_BUTTON_7
        GLFW_MOUSE_BUTTON_8
        GLFW_MOUSE_BUTTON_LAST
        GLFW_MOUSE_BUTTON_LEFT
        GLFW_MOUSE_BUTTON_RIGHT
        GLFW_MOUSE_BUTTON_MIDDLE
        GLFW_JOYSTICK_1
        GLFW_JOYSTICK_2
        GLFW_JOYSTICK_3
        GLFW_JOYSTICK_4
        GLFW_JOYSTICK_5
        GLFW_JOYSTICK_6
        GLFW_JOYSTICK_7
        GLFW_JOYSTICK_8
        GLFW_JOYSTICK_9
        GLFW_JOYSTICK_10
        GLFW_JOYSTICK_11
        GLFW_JOYSTICK_12
        GLFW_JOYSTICK_13
        GLFW_JOYSTICK_14
        GLFW_JOYSTICK_15
        GLFW_JOYSTICK_16
        GLFW_JOYSTICK_LAST
        GLFW_GAMEPAD_BUTTON_A
        GLFW_GAMEPAD_BUTTON_B
        GLFW_GAMEPAD_BUTTON_X
        GLFW_GAMEPAD_BUTTON_Y
        GLFW_GAMEPAD_BUTTON_LEFT_BUMPER
        GLFW_GAMEPAD_BUTTON_RIGHT_BUMPER
        GLFW_GAMEPAD_BUTTON_BACK
        GLFW_GAMEPAD_BUTTON_START
        GLFW_GAMEPAD_BUTTON_GUIDE
        GLFW_GAMEPAD_BUTTON_LEFT_THUMB
        GLFW_GAMEPAD_BUTTON_RIGHT_THUMB
        GLFW_GAMEPAD_BUTTON_DPAD_UP
        GLFW_GAMEPAD_BUTTON_DPAD_RIGHT
        GLFW_GAMEPAD_BUTTON_DPAD_DOWN
        GLFW_GAMEPAD_BUTTON_DPAD_LEFT
        GLFW_GAMEPAD_BUTTON_LAST
        GLFW_GAMEPAD_BUTTON_CROSS
        GLFW_GAMEPAD_BUTTON_CIRCLE
        GLFW_GAMEPAD_BUTTON_SQUARE
        GLFW_GAMEPAD_BUTTON_TRIANGLE
        GLFW_GAMEPAD_AXIS_LEFT_X
        GLFW_GAMEPAD_AXIS_LEFT_Y
        GLFW_GAMEPAD_AXIS_RIGHT_X
        GLFW_GAMEPAD_AXIS_RIGHT_Y
        GLFW_GAMEPAD_AXIS_LEFT_TRIGGER
        GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER
        GLFW_GAMEPAD_AXIS_LAST
        GLFW_NO_ERROR
        GLFW_NOT_INITIALIZED
        GLFW_NO_CURRENT_CONTEXT
        GLFW_INVALID_ENUM
        GLFW_INVALID_VALUE
        GLFW_OUT_OF_MEMORY
        GLFW_API_UNAVAILABLE
        GLFW_VERSION_UNAVAILABLE
        GLFW_PLATFORM_ERROR
        GLFW_FORMAT_UNAVAILABLE
        GLFW_NO_WINDOW_CONTEXT
        GLFW_FOCUSED
        GLFW_ICONIFIED
        GLFW_RESIZABLE
        GLFW_VISIBLE
        GLFW_DECORATED
        GLFW_AUTO_ICONIFY
        GLFW_FLOATING
        GLFW_MAXIMIZED
        GLFW_CENTER_CURSOR
        GLFW_TRANSPARENT_FRAMEBUFFER
        GLFW_HOVERED
        GLFW_FOCUS_ON_SHOW
        GLFW_RED_BITS
        GLFW_GREEN_BITS
        GLFW_BLUE_BITS
        GLFW_ALPHA_BITS
        GLFW_DEPTH_BITS
        GLFW_STENCIL_BITS
        GLFW_ACCUM_RED_BITS
        GLFW_ACCUM_GREEN_BITS
        GLFW_ACCUM_BLUE_BITS
        GLFW_ACCUM_ALPHA_BITS
        GLFW_AUX_BUFFERS
        GLFW_STEREO
        GLFW_SAMPLES
        GLFW_SRGB_CAPABLE
        GLFW_REFRESH_RATE
        GLFW_DOUBLEBUFFER
        GLFW_CLIENT_API
        GLFW_CONTEXT_VERSION_MAJOR
        GLFW_CONTEXT_VERSION_MINOR
        GLFW_CONTEXT_REVISION
        GLFW_CONTEXT_ROBUSTNESS
        GLFW_OPENGL_FORWARD_COMPAT
        GLFW_OPENGL_DEBUG_CONTEXT
        GLFW_OPENGL_PROFILE
        GLFW_CONTEXT_RELEASE_BEHAVIOR
        GLFW_CONTEXT_NO_ERROR
        GLFW_CONTEXT_CREATION_API
        GLFW_SCALE_TO_MONITOR
        GLFW_COCOA_RETINA_FRAMEBUFFER
        GLFW_COCOA_FRAME_NAME
        GLFW_COCOA_GRAPHICS_SWITCHING
        GLFW_X11_CLASS_NAME
        GLFW_X11_INSTANCE_NAME
        GLFW_NO_API
        GLFW_OPENGL_API
        GLFW_OPENGL_ES_API
        GLFW_NO_ROBUSTNESS
        GLFW_NO_RESET_NOTIFICATION
        GLFW_LOSE_CONTEXT_ON_RESET
        GLFW_OPENGL_ANY_PROFILE
        GLFW_OPENGL_CORE_PROFILE
        GLFW_OPENGL_COMPAT_PROFILE
        GLFW_CURSOR
        GLFW_STICKY_KEYS
        GLFW_STICKY_MOUSE_BUTTONS
        GLFW_LOCK_KEY_MODS
        GLFW_RAW_MOUSE_MOTION
        GLFW_CURSOR_NORMAL
        GLFW_CURSOR_HIDDEN
        GLFW_CURSOR_DISABLED
        GLFW_ANY_RELEASE_BEHAVIOR
        GLFW_RELEASE_BEHAVIOR_FLUSH
        GLFW_RELEASE_BEHAVIOR_NONE
        GLFW_NATIVE_CONTEXT_API
        GLFW_EGL_CONTEXT_API
        GLFW_OSMESA_CONTEXT_API
        GLFW_ARROW_CURSOR
        GLFW_IBEAM_CURSOR
        GLFW_CROSSHAIR_CURSOR
        GLFW_HAND_CURSOR
        GLFW_HRESIZE_CURSOR
        GLFW_VRESIZE_CURSOR
        GLFW_CONNECTED
        GLFW_DISCONNECTED
        GLFW_JOYSTICK_HAT_BUTTONS
        GLFW_COCOA_CHDIR_RESOURCES
        GLFW_COCOA_MENUBAR
        GLFW_DONT_CARE

