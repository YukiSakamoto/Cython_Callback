
from cython.operator cimport dereference as deref
import sys
# referenced from
# http://stackoverflow.com/questions/5242051/cython-implementing-callbacks

ctypedef double (*method_type)(void *param, void *user_data)


cdef extern from "backend.hpp":
    cdef cppclass Callback:
        Callback(method_type method, void *user_data)
        double cy_execute(void *parameter)

cdef double callback_template(void *parameter, void *method):
    return (<object>method)(<object>parameter)


cdef class PyCallback:
    cdef Callback *thisptr

    def __cinit__(self, method):
        self.thisptr = new Callback(callback_template, <void*>method)

    def __dealloc__(self):
        if self.thisptr:
            del self.thisptr

    cpdef double execute(self, parameter):
        return self.thisptr.cy_execute(<void*>parameter)

