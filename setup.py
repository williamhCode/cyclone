import sys
sys.argv = [sys.argv[0], "build_ext", "--inplace"]

from setuptools import Extension, setup
from Cython.Build import cythonize
import os

if __name__ == "__main__":
    extensions = []

    for path, dirs, file_names in os.walk("."):
        for file_name in file_names:
            if file_name.endswith("pyx"):
                ext_path = "{0}/{1}".format(path, file_name)
                ext_name = (
                    ext_path
                    .replace("./", "")
                    .replace("/", ".")
                    .replace(".pyx", "")
                )
                ext = Extension(
                    name=ext_name, 
                    sources=[ext_path], 
                )
                extensions.append(ext)

    setup(
        ext_modules=cythonize(
            module_list=extensions, 
            annotate=False,
            compiler_directives={'language_level' : "3"},
        ),
    )

