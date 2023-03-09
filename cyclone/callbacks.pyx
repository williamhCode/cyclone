cdef class KeyData:

    def __init__(self, int key, int scancode, int action, int mods):
        self.key = key
        self.scancode = scancode
        self.action = action
        self.mods = mods

    def __getitem__(self, i):
        return (self.key, self.scancode, self.action, self.mods)[i]


cdef class MouseButtonData:

    def __init__(self, int button, int action, int mods):
        self.button = button
        self.action = action
        self.mods = mods

    def __getitem__(self, i):
        return (self.button, self.action, self.mods)[i]


cdef class CursorPositionData:

    def __init__(self, double xpos, double ypos):
        self.xpos = xpos
        self.ypos = ypos

    def __getitem__(self, i):
        return (self.xpos, self.ypos)[i]
