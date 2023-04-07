import os
from os import path
from glob import glob

from Cython.Build import cythonize
from setuptools import Extension, setup

os.environ["CC"] = "gcc"

# general --------------------------------------
files = []
for dirpath, _, filenames in os.walk("cyclone"):
    for filename in filenames:
        if filename.endswith("pyx"):
            ext_path = path.join(dirpath, filename)
            ext_name = ext_path.replace("/", ".").replace(".pyx", "")
            files.append((ext_name, ext_path))

include_dirs = [
    "deps/glfw/include",
    "deps/glad/include",
    "deps/cglm/include",
    "deps/stb",
    "deps/freetype/include",
    "deps/freetype/include/freetype",
]

library_dirs = [
    "lib",
]

libraries = [
    "glfw",
    "glad",
    "freetype",
]

macros = [
    ("STB_IMAGE_IMPLEMENTATION", None),
    ("CGLM_DEFINE_PRINTS", None),
]


# compiler -------------------------------------
language = "c"
default_args = ["-std=c17", "-w"]
debug_args = ["-std=c17", "-w", "-O0"]
release_args = ["-std=c17", "-w", "-O3", "-ffast-math", "-march=native"]
args = debug_args

# cythonize options
annotate = True
force = False
quiet = False

# setup ----------------------------------------
extensions = []
for ext_name, ext_path in files:
    ext = Extension(
        name=ext_name,
        sources=[ext_path],
        include_dirs=include_dirs,
        library_dirs=library_dirs,
        libraries=libraries,
        define_macros=macros,
        runtime_library_dirs=library_dirs,
        language=language,
        extra_compile_args=args,
    )
    extensions.append(ext)

packages = [
    "cyclone",
    "cyclone.shaders",
]

package_data = {"cyclone.shaders": ["*"]}

data_files = [("lib", glob("lib/*"))]

setup(
    name="cyclone",
    version="0.1.0",
    description="Python 2D Graphics Library",
    ext_modules=cythonize(
        module_list=extensions,
        annotate=annotate,
        compiler_directives={"language_level": "3"},
        force=force,
        quiet=quiet,
    ),
    packages=packages,
    package_data=package_data,
    data_files=data_files,
)
