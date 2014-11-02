

import PyCallback

def func(n):
    return n * 2;

cb = PyCallback.PyCallback(func)
print cb.execute(5.0)

