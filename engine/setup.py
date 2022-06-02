import sys
sys.argv = [sys.argv[0], "build_ext", "--build-lib", "src"]

from src.utiliies import set_cwd
from setuptools import Extension, setup
from Cython.Build import cythonize
from pathlib import Path
import numpy

with set_cwd(Path(__file__).parent.resolve()):
    module_list = [Extension('render', ['src/render.pyx'], include_dirs=[numpy.get_include()])]

    setup(
        ext_modules=cythonize(module_list),
    )