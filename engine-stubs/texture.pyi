from ._common import Vec2


class Texture:
    width: int
    height: int
    resize_nearest: bool

    def resize(self, width: int, height: int) -> None: ...

    @property
    def size(self) -> tuple[int, int]: ...


class TextureTarget(Texture):
    framebuffer_width: int
    framebuffer_height: int

    def __init__(self, size: Vec2, resize_nearest: bool=False) -> None: ...

