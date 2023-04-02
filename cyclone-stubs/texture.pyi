from ._common import Vec2
from cyclone.window import Window

class Texture:
    width: int
    height: int
    resize_nearest: bool
    size: tuple[int, int]

    def __init__(
        self, width: int, height: int, data: bytes = None, resize_nearest: bool = False
    ) -> None: ...
    @classmethod
    def load(cls, filepath: str, resize_nearest: bool = False) -> Texture: ...
    def reset_size(self) -> None: ...

class RenderTexture(Texture):
    framebuffer_width: int
    framebuffer_height: int

    def __init__(
        self,
        window: Window,
        size: Vec2,
        resize_nearest: bool = False,
        high_dpi: bool = True,
    ) -> None: ...
