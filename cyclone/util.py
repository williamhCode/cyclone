import os
from contextlib import contextmanager
from pathlib import Path

@contextmanager
def set_cwd(path: Path):
    old_path = os.getcwd()
    os.chdir(path)
    yield
    os.chdir(old_path)
