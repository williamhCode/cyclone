import os

from Cython.Build import cythonize
from setuptools import Extension, setup

# general --------------------------------------
files = []
for path, dirs, file_names in os.walk("cyclone"):
    for file_name in file_names:
        if file_name.endswith("pyx"):
            ext_path = f"{path}/{file_name}"
            ext_name = ext_path.replace("/", ".").replace(".pyx", "")
            files.append((ext_name, ext_path))

include_dirs = [
    "deps/glfw/include",
    "deps/glad/include",
    "deps/cglm/include",
    "deps/stb",
]

library_dirs = [
    "lib",
]

libraries = [
    "glad",
    "glfw",
]

macros = [
    ("STB_IMAGE_IMPLEMENTATION", None),
    ("CGLM_DEFINE_PRINTS", None),
]


# compiler -------------------------------------
language = "c"
default_args = ["-std=c17", "-w",]
debug_args = ["-std=c17", "-w", "-O0"]
release_args = ["-std=c17", "-w", "-O3", "-ffast-math", "-march=native"]
args = debug_args

# cythonize options
annotate = False
force = False
quiet = False

# setup ----------------------------------------
extensions = []
for ext_name, ext_path in files:
    ext = Extension(
        name=ext_name,
        sources=[ext_path],
        include_dirs=include_dirs,
        define_macros=macros,
        library_dirs=library_dirs,
        libraries=libraries,
        runtime_library_dirs=library_dirs,
        extra_compile_args=args,
        language=language,
    )
    extensions.append(ext)

setup(
    name="cyclone",
    version="0.1.0",
    description="A 2d graphics library written in cython",
    ext_modules=cythonize(
        module_list=extensions,
        annotate=annotate,
        compiler_directives={"language_level": "3"},
        force=force,
        quiet=quiet,
    ),
)
