# 2D-Graphics-Lib
A 2D batch renderer written in Python, Cython and OpenGL.

### Instructions
`python setup.py` to build Cython sources. Engine code in 'engine/'.

__Goal:__ To write a blazingly fast 2D graphics library in modern OpenGL(4.1) with the power of Cython.\
__Furture Plans:__ Use cross platform graphics api such as bgfx for better compatibility. OpenGL is deprecated by Apple, and I don't know how long it will last before they remove OpenGL drivers. In addition, OpenGL drivers on m1 macs are kind of bad (only 16 texture slots).
