from ._common import Vec2

CLAMP_TO_EDGE: int
CLAMP_TO_BORDER: int
MIRRORED_REPEAT: int
REPEAT: int

class Texture:
    width: float
    height: float
    framebuffer_width: int
    framebuffer_height: int
    size: tuple[float, float]

    def __init__(
        self,
        size: Vec2,
        data: bytes = None,
        resize_nearest: bool = False,
        wrap_mode=CLAMP_TO_EDGE,
    ) -> None: ...
    @classmethod
    def load(cls, filepath: str, resize_nearest: bool = False) -> Texture: ...
    def reset_size(self) -> None: ...

class RenderTexture(Texture):
    def __init__(
        self,
        size: Vec2,
        resize_nearest: bool = False,
        wrap_mode=CLAMP_TO_EDGE,
        high_dpi: bool = True,
    ) -> None: ...
