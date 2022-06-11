import sys
sys.argv = [sys.argv[0], "build_ext", "--build-lib", "engine"]

from setuptools import Extension, setup
from Cython.Build import cythonize

ext_modules = [
    Extension('render', ['engine/src/render.pyx']),
    # Extension('test', ['engine/src/test.pyx']),
]

setup(
    ext_modules=cythonize(ext_modules),
    packages=['engine'],
    include_dirs=['.'],
)