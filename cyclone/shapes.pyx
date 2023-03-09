cdef class Rectangle:

    def __init__(self, float x, float y, float width, float height):
        self.x = x
        self.y = y
        self.width = width
        self.height = height

    def __iter__(self):
        return iter((self.x, self.y, self.width, self.height))

    @property
    def position(self):
        return self.x, self.y

    @property
    def size(self):
        return self.width, self.height
