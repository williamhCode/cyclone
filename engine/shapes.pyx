cdef class Rectangle:
    
    def __init__(self, float x, float y, float width, float height):
        self.x = x
        self.y = y
        self.width = width
        self.height = height

    @property
    def position(self):
        return self.x, self.y

    @property
    def size(self):
        return self.width, self.height

