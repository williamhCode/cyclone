# 2D-Graphics-Lib (trying to come up with an actual name)
A 2D batch renderer written in Python, Cython and OpenGL.  

__Goal:__ To provide a blazingly fast Python 2D graphics library that's easy to use and pick up (like pygame but wayyy faster). Design philosophy is BYO (bring your own), meaning that it only takes care of windowing and drawing, and nothing else (may or may not add simple audio capabilities). This makes it easy to integrate with external libraries like a physics engine that has their own vector classes, objects, etc.

### Instructions
`python setup.py` to build Cython sources. Engine code in 'engine/'.  

_Note: currently only builds for macOS_


