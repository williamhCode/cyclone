

cdef class KeyData:
    cdef:
        public int key
        public int scancode
        public int action
        public int mods


cdef class MouseButtonData:
    cdef:
        public int button
        public int action
        public int mods


cdef class CursorPositionData:
    cdef:
        public float xpos
        public float ypos
