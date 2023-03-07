cdef class Rectangle:

    def __init__(self, float x, float y, float width, float height):
        self.x = x
        self.y = y
        self.width = width
        self.height = height

    def __getitem__(self, int i):
        if i == 0:
            return self.x
        elif i == 1:
            return self.y
        elif i == 2:
            return self.width
        elif i == 3:
            return self.height
        else:
            raise IndexError("Index out of range")

    @property
    def position(self):
        return self.x, self.y

    @property
    def size(self):
        return self.width, self.height
