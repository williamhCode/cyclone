from engine.texture import Texture
from ._common import Vec2

class Surface(Texture):

    def __init__(self, size: Vec2, resize_nearest: bool=False) -> None: ...


