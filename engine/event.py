from dataclasses import dataclass

@dataclass
class Event:
    key: int
    button: int
    action: int
