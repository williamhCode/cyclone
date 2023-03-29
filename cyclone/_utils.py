import os
from pathlib import Path
from contextlib import contextmanager

LIB_DIR = Path(__file__).parent.parent

@contextmanager
def set_lib_dir():
    old_path = os.getcwd()
    os.chdir(LIB_DIR)
    yield
    os.chdir(old_path)
