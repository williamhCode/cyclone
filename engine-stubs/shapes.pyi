class Rectangle:
    x: float
    y: float
    width: float
    height: float

    def __init__(self, x: float, y: float, width: float, height: float) -> None: ...

    @property
    def position(self) -> tuple[float, float]: ...

    @property
    def size(self) -> tuple[float, float]: ...
