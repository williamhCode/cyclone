# Cyclone - 2d Graphics Library
_A 2D batch renderer written in Python, Cython and OpenGL._

## Goal
There are many great 2D python graphics libraries like pygame, pyglet, and arcade. However, they either lack in performance, or have a steep learning curve.
The purpose of the library is to provide a blazingly fast Python 2D graphics library that is, at the same time, easy to use and pick up. 

The library is built with simplicity and modularity in mind. It takes care of windowing, displaying things on the screen, and only a few other things that are useful for making a 2D game.

## Building
`python setup.py build_ext --inplace` to build Cython sources.

_Note: currently only builds for macOS_


