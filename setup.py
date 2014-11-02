from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext 

source = [
    'backend.cpp', 
    './front.pyx'
    ]

#numpy_include = ['/System/Library/Frameworks/Python.framework/Versions/Current/Extras/lib/python/numpy/core/include']

setup(
    cmdclass = dict(build_ext = build_ext),
    ext_modules = [
        Extension(
            'PyCallback',
            source,
            #include_dirs = numpy_include,
            language='c++',
        )
    ]
)
