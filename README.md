# Cyclone - 2d Graphics Library
_A 2D batch renderer written in Python, Cython and OpenGL._

## Goal
There are many great 2D python graphics libraries like pygame, pyglet, and arcade. However, they either lack in performance, have a steep learning curve, or have issues with macOS (memory leaks and high dpi rendering).
The purpose of the library is to provide a blazingly fast Python 2D graphics library that is, at the same time, easy to use and pick up. 

The library is built with simplicity and modularity in mind. It takes care of windowing and input, everything you need for 2d rendering, and things useful for game dev. However, you can opt out of using built-in data types, and use other libraries for math related stuff (vectors, shapes and collisions).

## Contributing
#### Install Python Modules
```
pip install -r requirements.txt
```

#### Build C Library Dependencies
Make sure CMake is installed, shared object files should end up in `lib/`.
```
cmake .
cmake --build .
```

#### Install Library in Dev Mode
```
pip install -e .
```

#### Build Project
```
python setup.py build_ext --inplace
```
