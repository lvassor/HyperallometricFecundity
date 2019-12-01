#!/usr/bin/env python3
"""Allows user to tweak the scaling of reproductive allocation of
mass to investigate life history consequences"""

__appname__ = "fecundity_mass_scaling.py"
__author__ = 'Luke Vassor (ljv3618@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "M.Sc. CMEE, Imperial College London"
# Date: May 2019

# Imports
import scipy as sc
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# Script
def growth_model(a, b, c, a_exp, b_exp, c_exp, m):
    """Produces figure of growth rate dm/dt with mass"""
    dm_dt = a*(m**a_exp) - b*(m**b_exp)# - c*(m**c_exp)
    growth_curve = plt.plot(m, dm_dt, 'g-', label = 'Growth rate')
    # ylim = ax.get_ylim()
    # plt.vlines(3, ylim[0], ylim[1])
    plt.xlabel('Mass')
    plt.ylabel('dm/dt')
    plt.title('Change in growth rate with mass of organism')
    plt.grid(True)

    plt.tight_layout()
    plt.show()

def growth_time(M, m0, a, t):
    """Produces figure of mass with time growth curve"""
    curve = M*((1 - (1 - ((m0/M)**0.25))*np.exp(-a*t/(4*(M**0.25))))**4)
    growth_curve = plt.plot(t, curve, 'b-', label = 'Mass with Time')
    axes = plt.gca()
    axes.set_xlim([0,800])
    axes.set_ylim([0,1000])
    
    plt.xlabel('Time (Days)')
    plt.ylabel('Mass (g)')
    plt.title('Change in Mass of organism with Time')
    plt.grid(True)

    plt.tight_layout()
    plt.show()


mass = np.arange(0,100,0.5) # Mass array
time = np.arange(1,800,1) # Time array

growth_model(a = 7, b = 2, c = 2, a_exp = 0.75, b_exp = 1, c_exp = 1.06, m = mass)

# Growth curve for guinea pig (West et al. 2001, p2)
growth_time(M = 840, m0 = 5, a = 0.2, t = time)

