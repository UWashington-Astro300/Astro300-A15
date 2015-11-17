#!/usr/bin/python

import sys
from numpy import *
import pylab as py


t = arange(1,100,0.01)

x = sin(t) * (exp(cos(t)) - 2*cos(4*t) - (sin(t/12)**5))

y = cos(t) * (exp(cos(t)) - 2*cos(4*t) - (sin(t/12)**5))

py.plot(x,y,color="b")

py.xlabel('X')
py.ylabel('Y')

py.show()

sys.exit()
