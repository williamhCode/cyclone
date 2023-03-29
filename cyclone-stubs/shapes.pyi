from typing import overload

class Rectangle:
    x: float
    y: float
    width: float
    height: float
    size: tuple[float, float]
    position: tuple[float, float]

    def __init__(self, x: float, y: float, width: float, height: float) -> None: ...
    @overload
    def __getitem__(self, i: int) -> float: ...
    @overload
    def __getitem__(self, s: slice) -> tuple[float]: ...

