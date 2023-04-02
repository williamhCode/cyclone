from cyclone.texture import Texture, RenderTexture
from cyclone.shapes import Rectangle
from ._common import Vec2, Mat4, Color, Region

class Renderer:
    def __init__(self) -> None: ...
    def clear(self, color: Color) -> None: ...
    def begin(
        self, view_matrix: Mat4 = None, target: RenderTexture = None
    ) -> None: ...
    def end(self) -> None: ...
    def draw_texture(
        self,
        texture: Texture,
        position: Vec2,
        rotation: float = 0.0,
        offset: Vec2 = (0.0, 0.0),
        region: Rectangle = None,
        flipped: bool = False,
        color: Color = (255, 255, 255, 255),
    ) -> None: ...
    def draw_texture_region(
        self,
        texture: Texture,
        position: Vec2,
        region: Region,
        rotation: float = 0.0,
        offset: Vec2 = (0.0, 0.0),
        flipped: bool = False,
        color: Color = (255, 255, 255, 255),
    ) -> None: ...
    def draw_circle(
        self,
        color: Color,
        position: Vec2,
        radius: float,
        width: float = 0.0,
        fade: float = 0.0,
    ) -> None: ...
    def draw_rectangle(
        self,
        color: Color,
        position: Vec2,
        size: Vec2,
        rotation: float = 0.0,
        offset: Vec2 = (0.0, 0.0),
        width: float = 0.0,
        fade: float = 0.0,
    ) -> None: ...
    def draw_line(
        self, color: Color, start: Vec2, end: Vec2, width: float = 1.0
    ) -> None: ...
    def draw_lines(
        self, color: Color, points: tuple[Vec2, ...] | list[Vec2], width: float = 1.0
    ) -> None: ...
