from dataclasses import dataclass

@dataclass(slots=True)
class Event:
    key: int
    button: int | None
    action: int | None
