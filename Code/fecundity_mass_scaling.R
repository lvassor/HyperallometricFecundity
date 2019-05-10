#!/usr/bin/env Rscript

# Author: Luke Vassor login: ljv3618@ic.ac.uk
# Script: ggplot.R
# Desc: R script involving practicing ggplot.
# Date: Oct 2018

# Clean workspace
rm(list = ls())

# Import and Libraries
require(ggplot2)

# Script
growth_model <- function(a, b, c, a_exp, b_exp, c_exp, m){
    dm_dt <- a*(m**a_exp) - b*(m**b_exp)# - c*(m**c_exp)
    growth_curve <- qplot(m, dm_dt, 
        main = 'Growth rate',
        xlab = "Mass",
        ylab = "Growth rate"
    )
# }
# growth_time <- function(M, m0, a, t){
#     curve = M*((1 - (1 - ((m0/M)**0.25))*np.exp(-a*t/(4*(M**0.25))))**4)
#     growth_curve = plt.plot(t, curve, 'b-', label = 'Mass with Time')
#     plt.show()
# }

mass = seq(0,100,0.5)

growth_model(a = 40, b = 9, c = 0.1, a_exp = 0.75, b_exp = 1, c_exp = 1, m = mass)