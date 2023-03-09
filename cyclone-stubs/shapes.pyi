from typing import overload

class Rectangle:
    x: float
    y: float
    width: float
    height: float

    def __init__(self, x: float, y: float, width: float, height: float) -> None: ...
    @overload
    def __getitem__(self, i: int) -> float: ...
    @overload
    def __getitem__(self, s: slice) -> tuple[float]: ...
    @property
    def position(self) -> tuple[float, float]: ...
    @property
    def size(self) -> tuple[float, float]: ...
