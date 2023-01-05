from dataclasses import dataclass

@dataclass(slots=True)
class Event:
    action: int
    key: int | None
    button: int | None
