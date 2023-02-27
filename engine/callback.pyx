cimport cython

cdef class KeyData:

    def __init__(self, int key, int scancode, int action, int mods):
        self.key = key
        self.scancode = scancode
        self.action = action
        self.mods = mods


cdef class MouseButtonData:

    def __init__(self, int button, int action, int mods):
        self.button = button
        self.action = action
        self.mods = mods


cdef class CursorPositionData:

    def __init__(self, double xpos, double ypos):
        self.xpos = xpos
        self.ypos = ypos
