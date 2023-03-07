# Cyclone 2d Graphics Library
_A 2D batch renderer written in Python, Cython and OpenGL._

## Goal
There are many great 2D python graphics libraries like pygame, pyglet, and arcade. However, they either lack in performance, or have a steep learning curve
The purpose of the library is to provide a blazingly fast Python 2D graphics library that is, at the same time, easy to use and pick up. 

The design philosophy is BYO (bring your own), meaning that it only takes care of windowing and drawing, and nothing else. This makes it easy to integrate with external libraries like a physics engine that has their own vector classes, objects, etc., and also makes it a lot more flexible. Plus, why rewrite when there's already awesome libraries out there?

## Building
`python setup.py` to build Cython sources. Engine code in 'cyclone/'.  

_Note: currently only builds for macOS_


