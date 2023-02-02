from setuptools import Extension, setup
from Cython.Build import cythonize
from pathlib import Path
import platform

# platform specific ----------------------------
system = platform.system()

platform_library_dirs = {
    "Darwin": ["engine/lib/shared/Darwin"],
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
files= [
    ("engine.render", "engine/render.pyx"),
    ("engine.window", "engine/window.pyx"),
    ("engine.constants", "engine/constants.pyx"),
    ("engine.shader", "engine/shader.pyx"),
    ("engine.texture", "engine/texture.pyx"),
    ("engine.surface", "engine/surface.pyx")
]

# stubs
# packages = ["engine-stubs"]
# package_data = {"engine-stubs": ["*.pyi"]}

include_dirs = [
    "engine/lib/include", 
]

macros = [
    ("STB_IMAGE_IMPLEMENTATION", None),
    ("CGLM_DEFINE_PRINTS", None),
]


# compiler -------------------------------------
language = "c"
default = ["-w"]
debug_args = ["-w", "-O0"]
release_args = ["-w", "-O3", "-ffast-math", "-march=native"]
args = default

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
        # runtime_library_dirs=library_dirs,
        extra_compile_args=args,
        language=language,
    )
    extensions.append(ext)

setup(
    name='engine',
    version='0.1.0',
    description='A 2d graphics library written in cython',
    ext_modules=cythonize(
        module_list=extensions, 
        annotate=annotate,
        compiler_directives={'language_level' : "3"},
        force=force,
        quiet=quiet,
    ),
    # packages=packages,
    # package_data=package_data,
    # include_package_data=True,
)

# export DYLD_FALLBACK_LIBRARY_PATH=/Users/williamhou/Documents/Coding/Personal-coding/2D-Graphics-Lib/engine/lib/shared/Darwin

# for path, dirs, file_names in os.walk("."):
#     for file_name in file_names:
#         if file_name.endswith("pyx"):
#             ext_path = "{0}/{1}".format(path, file_name)
#             ext_name = (
#                 ext_path
#                 .replace("", "")
#                 .replace("/", ".")
#                 .replace(".pyx", "")
#             )
#             ext = Extension(
#                 name=ext_name, 
#                 sources=[ext_path], 
#                 libraries=libraries,
#                 language=language,
#                 include_dirs=include_dirs,
#                 library_dirs=lib_dirs,
#                 runtime_library_dirs=lib_dirs,
#                 extra_compile_args=args,
#             )
#             extensions.append(ext)
