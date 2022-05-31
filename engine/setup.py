import sys
sys.argv = ["setup.py", "build_ext"]

from setuptools import setup
from Cython.Build import cythonize
from pathlib import Path
import numpy

directory_path = Path(__file__).parent.resolve()
module_list = [str(directory_path / 'render.pyx')]

setup(
    ext_modules=cythonize(module_list),
    include_dirs=[numpy.get_include()]
)