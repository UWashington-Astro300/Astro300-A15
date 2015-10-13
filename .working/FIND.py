#!/home/toby/anaconda/bin/python

import sys, math
from math import *
import numpy as np

from FindE import FindE

try:
    infilename = sys.argv[1]
except:
    print "Usage: ",sys.argv[0], "Datafile"; sys.exit(1)

def Findn(a):

  n = 1.7202e-2 * a**(-1.5) * (180.0 / pi)
  return n

def FindM(date,epoch,n,M):

  Mt = M + n * (date - epoch)
  return Mt%360

def Findr(a,ecc,E):

  Erad = np.radians(E)
  r = a * (1.0 - ecc * np.cos(Erad))
  return r

def FindT (ecc,E):

    Erad = np.radians(E)

    T1 = np.sqrt((1.0 + ecc) / (1.0 - ecc)) * np.tan(Erad/2.0)
    T2 = 2.0 * np.arctan(T1)
    T = np.degrees(T2)
    T[T<0] += 360.0
    return T

def FindXYZ(O,w,T,i,r):

    wrad = np.radians(w)
    Orad = np.radians(O)
    Trad = np.radians(T)
    irad = np.radians(i)

    X1 = np.cos(Orad)*np.cos(wrad+Trad)
    X2 = np.sin(Orad)*np.sin(wrad+Trad)*np.cos(irad)
    X = r * (X1 - X2)

    Y1 = np.sin(Orad)*np.cos(wrad+Trad)
    Y2 = np.cos(Orad)*np.sin(wrad+Trad)*np.cos(irad)
    Y = r * (Y1 + Y2)

    Z = np.sin(wrad+Trad) * np.sin(irad) * r

    return X,Y,Z

def MoveToEarth(X,Y,Z):

    tilt = np.radians(23.43929111)

    Xe = X
    Ye = Y * np.cos(tilt) - Z * np.sin(tilt)
    Ze = Y * np.sin(tilt) + Z * np.cos(tilt)

    Xn = Xe - Xe[0]
    Yn = Ye - Ye[0]
    Zn = Ze - Ze[0]

    return Xn,Yn,Zn

def FindDec(X,Y,Z):

    d1 = np.sqrt(X**2 + Y**2)
    d2 = np.arctan(Z / d1)
    return np.degrees(d2)

def FindRA(X,Y):
    
    RA = np.arctan(Y/X)

    RA[X<0] += pi
    RA[np.where((X>0) & (Y<0))] += 2*pi

    return np.degrees(RA)

def HitLong(epoch,RA):

    D = (epoch - 51544.5)

    GMST = 18.697374558 + 24.06570982441908 * D

    Long = (GMST%24 * 15.0) - RA

    return Long

def main():

  # Read in some data from a file

  epoch,a,ecc,i,om,w,M = np.loadtxt(infilename,\
   usecols=(0,1,2,3,4,5,6), dtype=float, unpack=True)

  name = np.loadtxt(infilename, usecols=(9,), dtype=str, unpack=True)

  # Do some stuff

  date = 56581

  n = Findn(a)
  NewM = FindM(date,epoch,n,M)

  E = FindE(ecc,NewM) # This is a function from FindE

  r = Findr(a,ecc,E)

  T = FindT(ecc,E)

  X,Y,Z = FindXYZ(om,w,T,i,r)

  XX,YY,ZZ = MoveToEarth(X,Y,Z)

  D = np.sqrt(XX**2 + YY**2 + ZZ**2)

  EMask = name != 'Earth'

  Dec = FindDec(XX[EMask],YY[EMask],ZZ[EMask])
  RA = FindRA(XX[EMask],YY[EMask])

  Hit = HitLong(date,RA)

  # Dump some output to the screen

  dat = np.column_stack((name,r.round(5),T.round(5),X,Y,Z))

  np.savetxt(sys.stdout,dat,fmt='%s')

if __name__ == "__main__": # Run the main program and exit
    main()
