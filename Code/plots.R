#!/usr/bin/env Rscript

#Author: Luke Vassor login: ljv3618@ic.ac.uk
#Script: thesis_plots.R
#Desc: R script to produce thesis results.
#Date: Oct 2018


# Clean workspace
rm(list = ls())

# Libraries and Imports
require(ggplot2)
library(extrafont)
loadfonts()
# Read data
## Plot for intake scaling of 0.75
dF75 <- data.frame(read.csv("../Results/alpha_sensitivity_x=0.75.csv", sep=",", header=F))
alpha75 <- dF75[,1]
c_opt75 <- dF75[,3]
rho_opt75 <- dF75[,4]
pearson_score75 <- round(cor(alpha75, rho_opt75, method = "pearson"), 2)
<<<<<<< HEAD
p75 <- qplot(alpha75, rho_opt75) + 
# annotate("text", x = 0.9*max(alpha75), y = 1.21, label = paste("R = ", pearson_score75), family="cmr10", size = 4) 
geom_hline(yintercept=1, linetype="dashed")
=======
p75 <- qplot(alpha75, rho_opt75) + annotate("text", x = 0.9*max(alpha75), y = 1.21, label = paste("R = ", pearson_score75), family="cmr10", size = 4) + geom_hline(yintercept=1, linetype="dashed")
>>>>>>> 2e12bb41d27af66c3b9ce02ae5c020354f89e975
p75 <- p75 + theme_bw() + theme(text = element_text(family="cmr10", size = 10), panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
panel.background = element_blank(), axis.line = element_line(colour = "black")) + ylab(expression(paste("Optimum ", rho))) + xlab(expression(paste("Maturity age, ", alpha))) +
scale_x_continuous(limits = c(0,250), breaks = seq(0, 250, by = 20)) + scale_y_continuous(limits = c(0,1.3), breaks = seq(0, 1.3, by = 0.1))
ggsave(filename = paste('../Results/', "alpha_sensitivity_x=0.75", ".pdf", sep = ""), plot = p75, height = 4, width = 4.2, device = "pdf")
embed_fonts(paste('../Results/', "alpha_sensitivity_x=0.75", ".pdf", sep = ""), outfile="../Results/alpha_sensitivity_x=0.75.pdf")
# dev.off()

## Plot for intake scaling of 0.85
dF85 <- data.frame(read.csv("../Results/alpha_sensitivity_x=0.85.csv", sep=",", header=F))
alpha85 <- dF85[,1]
c_opt85 <- dF85[,3]
rho_opt85 <- dF85[,4]
pearson_score85 <- round(cor(alpha85, rho_opt85, method = "pearson"), 2)
<<<<<<< HEAD
p85 <- qplot(alpha85, rho_opt85) + 
# annotate("text", x = 0.9*max(alpha85), y = 1.21, label = paste("R = ", pearson_score85), family="cmr10", size = 4) 
geom_hline(yintercept=1, linetype="dashed")
=======
p85 <- qplot(alpha85, rho_opt85) + annotate("text", x = 0.9*max(alpha85), y = 1.21, label = paste("R = ", pearson_score85), family="cmr10", size = 4) + geom_hline(yintercept=1, linetype="dashed")
>>>>>>> 2e12bb41d27af66c3b9ce02ae5c020354f89e975
p85 <- p85 + theme_bw() + theme(text = element_text(family="cmr10", size = 10), panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
panel.background = element_blank(), axis.line = element_line(colour = "black")) + ylab(expression(paste("Optimum ", rho))) + xlab(expression(paste("Maturity age, ", alpha))) +
scale_x_continuous(limits = c(0,200), breaks = seq(0, 200, by = 20)) + scale_y_continuous(limits = c(0,1.3), breaks = seq(0, 1.3, by = 0.1))
ggsave(filename = paste('../Results/', "alpha_sensitivity_x=0.85", ".pdf", sep = ""), plot = p85, height = 4, width = 4.2, device = "pdf")
embed_fonts(paste('../Results/', "alpha_sensitivity_x=0.85", ".pdf", sep = ""), outfile="../Results/alpha_sensitivity_x=0.85.pdf")
# dev.off()