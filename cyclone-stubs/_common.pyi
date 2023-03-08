from typing import Protocol, TypeVar
from callbacks import *
from shapes import Rectangle

T = TypeVar("T")

class HasGetItemAndLen(Protocol[T]):
    def __getitem__(self, key: int) -> T: ...
    def __len__(self) -> int: ...

Vec2 = tuple[float, float] | list[float] | HasGetItemAndLen[float]
Vec3 = tuple[float, float, float] | list[float] | HasGetItemAndLen[float]
Vec4 = tuple[float, float, float, float] | list[float] | HasGetItemAndLen[float]
Mat4 = tuple[Vec4, Vec4, Vec4, Vec4] | list[Vec4] | HasGetItemAndLen[Vec4]
Color = Vec3 | Vec4
Region = tuple[float, float, float, float] | list[float] | Rectangle

CallbackData = KeyData | MouseButtonData | CursorPositionData
