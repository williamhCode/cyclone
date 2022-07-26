from typing import Protocol


class HasGetItemAndLen(Protocol):
    def __getitem__(self, key: int) -> float: ...

    def __len__(self) -> int: ...


_Vec2 = tuple[float, float] | list[float] | HasGetItemAndLen
_Vec3 = tuple[float, float, float] | list[float] | HasGetItemAndLen
_Vec4 = tuple[float, float, float, float] | list[float] | HasGetItemAndLen
_Color = _Vec3 | _Vec4
