# A set of functions to solve Kepler's Equation
#
# Takes Eccentricity and Mean Anomoly as arguments
# Both need to be Numpy arrays
#
# Returns E in DEGREES as a Numpy array
#
# Method from:
# http://murison.alpheratz.net/dynamics/twobody/KeplerIterations_summary.pdf

import numpy as np

def FindE0(ecc,M):

  cosM = np.cos(M)

  t1 = ecc
  t2 = ecc**2 * cosM
  t3 = (3.0 * cosM**2 - 1.0) * 0.5 * ecc**3
  t4 = np.sin(M) * (t1 + t2 + t3)
  E0 = M + t4

  return E0

def FindNextE(ecc,M,x):

  t1 = x - (ecc * np.sin(x)) - M
  t2 = 1.0 - ecc * np.cos(x)

  NewE = t1 / t2

  return NewE

def FindE(ecc,degM):

  M = np.radians(degM)
  NewE = []

  for te,tM in zip(ecc,M):

    E0 = FindE0(te,tM)

    delta = 1.0e-10
    dE = 1.0
    count = 0

    while (dE > delta):

      NextE = FindNextE(te,tM,E0)
      E = E0 - NextE
      dE = np.absolute(E - E0)
      E0 = E
      count = count + 1

    NewE.append(E)

  ArrayE = np.array(NewE)
 
  return np.degrees(ArrayE)

def FindT (ecc,E):

  Erad = np.radians(E)

  T1 = np.sqrt((1.0 + ecc) / (1.0 - ecc)) * np.tan(Erad/2.0)
  T2 = 2.0 * np.arctan(T1)
  T = np.degrees(T2)
  T[T<0] += 360.0
  return T

