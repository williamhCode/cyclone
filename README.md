# Cyclone
_A 2D graphics library written in Cython, Python, and OpenGL._

## Motivation
There are many great 2D python graphics libraries like pygame, pyglet, and arcade. However, they either lack in performance, have a steep learning curve, or have issues with macOS (memory leaks and high dpi rendering).
The purpose of the library is to provide a capable and fast 2D graphics library for Python that is at the same time, easy to pick up and use. 

The library takes care of windowing and input, 2d rendering, and all necessary components for making a 2D game. You can also opt out of using built-in data types, and use other libraries for math related functionality (vectors, shapes and collisions).

### Key Features: 
- simple to use
- blazingly fast 2D rendering for textures and primitives
- texture rendering with built-in rotation/offset
- high-dpi support (macos)
- minimizes cpu load by offloading as much calculations to the GPU
- multiple windows


## Todo
- [ ] rendering
  - [x] textures
  - [x] circles
  - [x] rectangles
  - [x] lines
  - [ ] polygons
  - [x] render texture (framebuffer)
  - [ ] fonts - wip
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
