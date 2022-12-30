from typing import Protocol, TypeVar

T = TypeVar('T')

class HasGetItemAndLen(Protocol[T]):
    def __getitem__(self, key: int) -> T: ...

    def __len__(self) -> int: ...


_Vec2 = tuple[float, float] | list[float] | HasGetItemAndLen[float]
_Vec3 = tuple[float, float, float] | list[float] | HasGetItemAndLen[float]
_Vec4 = tuple[float, float, float, float] | list[float] | HasGetItemAndLen[float]
_Mat4 = tuple[_Vec4, _Vec4, _Vec4, _Vec4] | list[_Vec4] | HasGetItemAndLen[_Vec4]
_Color = _Vec3 | _Vec4
