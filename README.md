# Cyclone
_A 2D graphics library written in Cython, Python, and OpenGL._

## Motivation
There are many great 2D python graphics libraries like pygame, pyglet, and arcade. However, they either lack in performance, have a steep learning curve, or have issues with macOS (memory leaks and high dpi rendering).
The purpose of the library is to provide a blazingly fast Python 2D graphics library that is, at the same time, easy to use and pick up. 

The library is built with simplicity and modularity in mind. It takes care of windowing and input, everything you need for 2d rendering, and things useful for game dev. However, you can opt out of using built-in data types, and use other libraries for math related stuff (vectors, shapes and collisions).

## Features: 
- blazingly fast (90,000 textures at 60fps)*
- texture/primitive rendering with built-in rotation/offset
- high-dpi support (macos)
- minimizes cpu load by offloading most calculations to the GPU (python is slow and hard to parallelize)
- multiple windows

<sub>*: tested on m1 macbook pro

## Todo
**_Not active, building a library from Cython alone is too hard to maintain due to lack of proper tooling and language quirks._**
- [ ] rendering
  - [x] textures
  - [x] circles
  - [x] rectangles
  - [x] lines
  - [x] polygons
  - [x] render texture (framebuffer)
  - [x] fonts
  - [ ] rendering options (blend, render to stencil buffer, etc.)
  - [ ] custom shaders
- [ ] windowing
  - [x] keyboard and mouse input
  - [x] multi window
  - [ ] more window options (fullscreen, resizable, etc.)
- [ ] math
  - [ ] vector/matrix classes
  - [ ] shapes
  - [ ] simple collision detection
- [ ] build for linux and windows
- [ ] upload to pypi
- [ ] documentation
- [ ] convert OpenGL to [WebGPU](https://developer.chrome.com/blog/webgpu-release/) for future proofing?

## Contributing

#### Clone Repo
```
git clone --recurse-submodule https://github.com/williamhCode/cyclone.git
```

#### Install Python Modules
```
pip install -r requirements.txt
```

#### Build Cyclone
```
python setup.py build_ext --inplace
```
You can control the build mode in `setup.py`. You only need to run with `build_libs` option once, which builds the c libraries.

#### Install Library in Dev Mode
```
pip install -e .
```
#### Run Docs
```
mkdocs serve
```
