cdef class Rectangle:

    def __init__(self, float x, float y, float width, float height):
        self.x = x
        self.y = y
        self.width = width
        self.height = height

    def __getitem__(self, i):
        return (self.x, self.y, self.width, self.height)[i]

    def __repr__(self):
        return f"Rectangle({self.x}, {self.y}, {self.width}, {self.height})"

    @property
    def position(self):
        return self.x, self.y

    @position.setter
    def position(self, value):
        self.x = value[0]
        self.y = value[1]

    @property
    def size(self):
        return self.width, self.height

    @size.setter
    def size(self, value):
        self.width = value[0]
        self.height = value[1]
