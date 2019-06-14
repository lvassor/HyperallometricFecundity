#!/usr/bin/env python3
"""Script to run the Lotka-Volterra Consumer-Resource 
model using command line parameters and scipy integration tools"""

__appname__ = 'LV1.py'
__author__ = 'Luke Vassor (ljv3618@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "M.Sc. CMEE, Imperial College London"
# Date: Nov 2018

# Imports
import sys
import scipy as sc
import matplotlib.pylab as p
import scipy.stats
import scipy.integrate as integrate                     # Numerical integration

# Script
# Building the model
# Define L(t)
def L(t):
    return sc.exp(-t)

def dCR_dt(pops, t=0):                                  # numerically counting the behaviour of this model by repeating this mdoel as many times so as to have accurate representation of what model is doing
    """ Takes model parameters and populates array
    based on model calculations"""                      # t=0 is default
    m = pops[0]
    r = pops[1]
    Q = L(t)
    dRdt = Q * c * m**rho # because lifetime R is the integral of RHS, so ODE is RHS with no integrand
    dmdt = a * m**(3/4) - b * m - c * m**rho
    return sc.array([dRdt, dmdt])                       #want to return a scipy array because scipy integrate works on scipy arrays

# set parameters
a = 0.2 
b = 0.0371501159982672 
c = 0.001
rho = 1

# Define the time vector
t = sc.linspace(0, 100, 1000)



# set the initial conditions for the two populations (10 resources and 5 consumers per unit area)
m0 = 10
r0 = 5
rm0 = sc.array([m0, r0])

# Integration
pops, infodict = integrate.odeint(dCR_dt, rm0, t, full_output = True)
pops
type(infodict)
infodict.keys()


# Plot predator-prey cycles & Output
f1 = p.figure()
p.plot(t, pops[:,0], 'g-', label = 'Resource density') #plot
p.plot(t, pops[:,1], 'b-', label = 'Consumer density')
p.grid()
p.legend(loc='best')
p.xlabel('Time')
p.ylabel('Population density')
p.title("Consumer-Resource population dynamics")
# p.annotate('Parameters: \n r = {}, \n a = {}, \n z = {}, \n e = {}'.format(str(r), str(a), str(z), str(e)), xy=(2, 1), xytext=(4, 35))
p.show()
# f1.savefig('../Results/LV1_cycle.pdf')



# # Plot Consumer-Resource density & Output
# f2 = p.figure()
# p.plot(pops[:,0], pops[:,1], 'r-')
# p.grid()
# p.xlabel('Resource density')
# p.ylabel('Consumer density')
# p.title("Consumer-Resource population dynamics")
# p.annotate('Parameters: \n r = {}, \n a = {}, \n z = {}, \n e = {}'.format(str(r), str(a), str(z), str(e)), xy=(15,15), xytext=(15,15))
# # f2.savefig('../Results/LV1_density.pdf')

# print("Complete. Please see Results directory for plots.")