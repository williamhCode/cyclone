from ._common import Vec2
from cyclone.window import Window

class Texture:
    width: int
    height: int
    framebuffer_width: int
    framebuffer_height: int
    size: tuple[int, int]

    def __init__(
        self, size: Vec2, data: bytes = None, resize_nearest: bool = False
    ) -> None: ...
    @classmethod
    def load(cls, filepath: str, resize_nearest: bool = False) -> Texture: ...
    def reset_size(self) -> None: ...

class RenderTexture(Texture):
    def __init__(
        self,
        size: Vec2,
        resize_nearest: bool = False,
        high_dpi: bool = True,
    ) -> None: ...
