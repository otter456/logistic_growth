#Script to plot the logistic growth data

#load the data
growth_data <- read.csv("experiment1.csv")

#install package ggplot2 for plotting
install.packages("ggplot2")

#load package 
library(ggplot2)

#logistic growth of exp1 plot
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  theme_bw()

#logistic growth of exp1 on semi-log plot
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  scale_y_continuous(trans='log10')
