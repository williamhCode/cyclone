# Cyclone - 2d Graphics Library
_A 2D batch renderer written in Cython, Python, and OpenGL._

## Goal
There are many great 2D python graphics libraries like pygame, pyglet, and arcade. However, they either lack in performance, have a steep learning curve, or have issues with macOS (memory leaks and high dpi rendering).
The purpose of the library is to provide a blazingly fast Python 2D graphics library that is, at the same time, easy to use and pick up. 

The library is built with simplicity and modularity in mind. It takes care of windowing and input, everything you need for 2d rendering, and things useful for game dev. However, you can opt out of using built-in data types, and use other libraries for math related stuff (vectors, shapes and collisions).

### Features: 
- multiple windows
- high-dpi support (macos)
- fancy primitive rendering
- texture rendering with built-in rotation/offset
- minimizes cpu load by offloading as much calculations to the GPU (python is slow and hard to parallelize)
- blazingly fast

## Todo
- [ ] rendering
  - [x] textures
  - [x] circles
  - [x] rectangles
  - [x] lines
  - [ ] polygons
  - [x] render texture (framebuffer)
  - [ ] fonts
  - [ ] blend options
  - [ ] custom shaders
- [ ] windowing
  - [x] keyboard and mouse input
  - [x] multi window
  - [ ] more window options (fullscreen, resizable, etc.)
- [ ] extras
  - [ ] vector/matrix classes
  - [ ] simple shapes collision detection

## Contributing
#### Clone Repo
```
git clone --recurse-submodule https://github.com/williamhCode/cyclone.git
```

#### Install Python Modules
```
pip install -r requirements.txt
```

#### Build C Library Dependencies
Make sure CMake is installed, shared object files should end up in `lib/`.
```
cmake -E make_directory cmake_build
cmake -E chdir cmake_build cmake ..
cmake --build cmake_build
```

#### Install Library in Dev Mode
```
pip install -e .
```

#### Build Cyclone
```
python setup.py build_ext --inplace
```
