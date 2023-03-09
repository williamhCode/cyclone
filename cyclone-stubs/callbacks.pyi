from typing import overload

class KeyData:
    key: int
    scancode: int
    action: int
    mods: int

    def __init__(self, key: int, scancode: int, action: int, mods: int) -> None: ...
    @overload
    def __getitem__(self, i: int) -> int: ...
    @overload
    def __getitem__(self, s: slice) -> tuple[int]: ...

class MouseButtonData:
    button: int
    action: int
    mods: int

    def __init__(self, button: int, action: int, mods: int) -> None: ...
    @overload
    def __getitem__(self, i: int) -> int: ...
    @overload
    def __getitem__(self, s: slice) -> tuple[int]: ...

class CursorPositionData:
    xpos: float
    ypos: float

    def __init__(self, xpos: float, ypos: float) -> None: ...
    @overload
    def __getitem__(self, i: int) -> float: ...
    @overload
    def __getitem__(self, s: slice) -> tuple[float]: ...
