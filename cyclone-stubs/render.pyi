from cyclone.texture import Texture, RenderTexture
from cyclone.shapes import Rectangle
from ._common import Vec2, Mat4, Color, Region

class Renderer:
    def __init__(self) -> None:
        """initializes the renderer

        Initializes the renderer with the current window.

        Returns:
            None
        """
    def clear(self, color: Color) -> None:
        """clears the current target

        Clears the current target with the given color, filling the
        target with a solid color.

        Args:
            color: the color to clear the target with. The alpha component is ignored.

        Returns:
            None
        """
    def begin(self, view_matrix: Mat4 = None, target: RenderTexture = None) -> None:
        """begins rendering

        Begins rendering to the current target. If a target is not
        specified, the default target is used.

        *Note: This function must be called before rendering anything!*

        Args:
            view_matrix: the view matrix to use for rendering
            target: the render target to render to

        Returns:
            None
        """
    def end(self) -> None:
        """ends rendering

        Ends rendering to the current target. All draw functions called between
        begin() and end() will be rendered to the target.

        *Note: This function must be called after rendering!*

        Returns:
            None
        """

    def draw_texture(
        self,
        texture: Texture,
        position: Vec2,
        rotation: float = 0.0,
        offset: Vec2 = (0.0, 0.0),
        flip_mode: int = 0,
        color: Color = (255, 255, 255, 255),
    ) -> None:
        """draws a texture

        Draws a texture to the current target. The offset is applied first,
        then rotation, then position.

        Args:
            texture: the texture to draw
            position: bottom-left position of the texture
            rotation: angle in degrees to rotate the texture
            offset: the position offset
            flip_mode: the flip mode, if

                - 0, don't flip
                - 1, flip horizontally
                - 2, flip vertically
                - 3, flip both horizontally and vertically

            color: the color to tint the texture. The alpha component is
                optional if using a tuple.

        Returns:
            None
        """
    def draw_texture_region(
        self,
        texture: Texture,
        position: Vec2,
        region: Region,
        rotation: float = 0.0,
        offset: Vec2 = (0.0, 0.0),
        flip_mode: int = 0,
        color: Color = (255, 255, 255, 255),
    ) -> None:
        """draws a texture region

        Draws a region of a texture to the current target. The offset is
        applied first, then rotation, then position.

        Args:
            texture: the texture to draw
            position: bottom-left position of the texture
            region: the region of the texture to draw. If region is out of
                the texture's bounds, texture will act based on the
                texture's wrap mode (currently repeat).
            rotation: angle in degrees to rotate the texture
            offset: the position offset
            flip_mode: the flip mode, if

                - 0, don't flip
                - 1, flip horizontally
                - 2, flip vertically
                - 3, flip both horizontally and vertically

            color: the color to tint the texture. The alpha component is
                optional if using a tuple.

        Returns:
            None
        """
    def draw_circle(
        self,
        color: Color,
        position: Vec2,
        radius: float,
        width: float = 0.0,
        fade: float = 0.0,
    ) -> None:
        """draws a circle

        Draws a circle to the current target.

        Args:
            color: the color of the circle. The alpha component is optional
                if using a tuple.
            position: the center of the circle
            radius: the radius of the circle
            width: the width of the circle's outline. If 0, the circle
                will be filled.
            fade: the fade of the circle in pixels. Applies a gradient to the
                circle's edge.

        Returns:
            None
        """
    def draw_rectangle(
        self,
        color: Color,
        position: Vec2,
        size: Vec2,
        rotation: float = 0.0,
        offset: Vec2 = (0.0, 0.0),
        width: float = 0.0,
        fade: float = 0.0,
    ) -> None:
        """draws a rectangle

        Draws a rectangle to the current target.

        Args:
            color: the color of the rectangle. The alpha component is
                optional if using a tuple.
            position: the bottom-left position of the rectangle
            size: the size of the rectangle
            rotation: the angle in degrees to rotate the rectangle
            offset: the position offset
            width: the width of the rectangle's outline. If 0, the
                rectangle will be filled.
            fade: the fade of the rectangle in pixels. Applies a gradient
                to the rectangle's edge.

        Returns:
            None
        """
    def draw_line(
        self, color: Color, start: Vec2, end: Vec2, width: float = 1.0
    ) -> None:
        """draws a line

        Draws a line to the current target.

        Args:
            color: the color of the line. The alpha component is optional if
                using a tuple.
            start: the start position of the line
            end: the end position of the line
            width: the width of the line

        Returns:
            None
        """
    def draw_lines(
        self, color: Color, points: tuple[Vec2, ...] | list[Vec2], width: float = 1.0
    ) -> None:
        """draws lines

        Draws a sequence of contiguous lines to the current target.

        Args:
            color: the color of the lines. The alpha component is optional
                if using a tuple.
            points: a sequence of 2 or more (x, y) coordinates.
            width: the width of the lines

        Returns:
            None
        """
