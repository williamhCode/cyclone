import os
import sys
import subprocess
from glob import glob
import pathlib

from Cython.Build import cythonize
from setuptools import Extension, setup
from setuptools.command.build_ext import build_ext as _build_ext


# options
release = True
build_libs = False

annotate = False
force = False
quiet = False


# build_ext from cmake
# cmake -E make_directory cmake_build
# cmake -E chdir cmake_build cmake ..
# cmake --build cmake_build
class build_ext(_build_ext):
    def run(self):
        self.build_cmake()
        super().run()

    def build_cmake(self):
        cwd = pathlib.Path().absolute()

        env = os.environ.copy()
        build_temp = pathlib.Path(self.build_temp)
        build_temp.mkdir(parents=True, exist_ok=True)

        subprocess.check_call(
            ["cmake", "-E", "make_directory", self.build_temp],
            env=env,
        )
        subprocess.check_call(
            ["cmake", "-E", "chdir", self.build_temp, "cmake", cwd],
            env=env,
        )
        subprocess.check_call(
            ["cmake", "--build", self.build_temp, "--config", "Release"],
            env=env,
        )


os.environ["CC"] = "gcc"

# general --------------------------------------
files = []
for dirpath, _, filenames in os.walk("cyclone"):
    for filename in filenames:
        if filename.endswith("pyx"):
            ext_path = os.path.join(dirpath, filename)
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

runtime_library_dirs = [
    os.getcwd() + "/lib",  # for editable install
    sys.prefix + "/lib",  # for non-editable install
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
debug_args = ["-w", "-O0"]
release_args = ["-w", "-O3"]
if release:
    args = release_args
else:
    args = debug_args

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
        runtime_library_dirs=runtime_library_dirs,
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
    cmdclass={"build_ext": build_ext if build_libs else _build_ext},
    packages=packages,
    package_data=package_data,
    data_files=data_files,
)
