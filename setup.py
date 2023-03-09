from setuptools import Extension, setup
from Cython.Build import cythonize
from pathlib import Path
import platform
import os

# platform specific ----------------------------
system = platform.system()

platform_library_dirs = {
    "Darwin": [
        "cyclone/lib/shared/Darwin",
        "build/glfw/src",
        "build/glad/src",
    ],
}
library_dirs = platform_library_dirs[system]

platform_libraries = {
    "Darwin": [
        "glad",
        "glfw",
    ]
}
libraries = platform_libraries[system]

# general --------------------------------------
files = []
for path, dirs, file_names in os.walk("cyclone"):
    for file_name in file_names:
        if file_name.endswith("pyx"):
            ext_path = f"{path}/{file_name}"
            ext_name = ext_path.replace("/", ".").replace(".pyx", "")
            files.append((ext_name, ext_path))

# files = [
#     ("cyclone.render", "cyclone/render.pyx"),
#     ("cyclone.window", "cyclone/window.pyx"),
#     ("cyclone.constants", "cyclone/constants.pyx"),
#     ("cyclone.shader", "cyclone/shader.pyx"),
#     ("cyclone.texture", "cyclone/texture.pyx"),
#     ("cyclone.callbacks", "cyclone/callbacks.pyx"),
#     ("cyclone.shapes", "cyclone/shapes.pyx"),
# ]

# stubs
# packages = ["cyclone-stubs"]
# package_data = {"cyclone-stubs": ["*.pyi"]}

include_dirs = [
    "cyclone/lib/include",
    "deps/glfw/include",
    "deps/glad/include",
]

macros = [
    ("STB_IMAGE_IMPLEMENTATION", None),
    ("CGLM_DEFINE_PRINTS", None),
]


# compiler -------------------------------------
language = "c"
default_args = ["-w"]
debug_args = ["-w", "-O0"]
release_args = ["-w", "-O3", "-ffast-math", "-march=native"]
args = debug_args

# cythonize options
annotate = False
force = True
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
        # runtime_library_dirs=library_dirs,
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
    # packages=packages,
    # package_data=package_data,
    # include_package_data=True,
)

# export DYLD_FALLBACK_LIBRARY_PATH=/Users/williamhou/Documents/Coding/Personal-coding/2D-Graphics-Lib/cyclone/lib/shared/Darwin
