class Texture:
    width: int
    height: int
    resize_nearest: bool

    def resize(self, width: int, height: int) -> None: ...
    @property
    def size(self) -> tuple[int, int]: ...

