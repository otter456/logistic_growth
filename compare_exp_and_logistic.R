##script to compare exponential and logistic growth

#load package and data
library(ggplot2)
growth_data <- read.csv("experiment1.csv")

#function assuming logistical growth
logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

#function assuming exponential growth
exp_fun <- function(t) {
  N <- N0*exp(r*t)
}

#estimated values to input into the function 
#initial population size
N0 <- 975.5 
#rate of growth
r <- 1.004e-02 
#carrying capacity 
K <- 6.000e+10 

#QUESTION 2
#find N at t=4980min using exponential and logistic curves
N_at_4980_exp <- exp_fun(4980)
N_at_4980_logistic <- logistic_fun(4980)

N_at_4980_exp
N_at_4980_logistic

#QUESTION 3
#plot logistic and exponential function
plot1 <- ggplot(aes(t,N), data = growth_data) +
  geom_point(size = 1) +
  geom_function(fun = exp_fun, aes(colour = "Exponential")) +
  geom_function(fun = logistic_fun, aes(colour = "Logistic")) +
  scale_y_continuous(limits = c(0, 6.5*10^10)) +
  labs(title = "Comparison of exponential and logistic growth curves", 
       subtitle = "Data from experiment1.csv", 
       x = "t (min)", 
       y = "N") +
  scale_colour_manual(values = c("Logistic" = "blue", "Exponential" = "red"), 
                      name = "Growth type") +
  theme(legend.position = "bottom", legend.justification = "centre")

plot1

#plot logistic and exponential functions on semi-log plot
plot2 <- ggplot(aes(t,N), data = growth_data) +
  geom_point(size = 1) +
  geom_function(fun = exp_fun, aes(colour = "Exponential")) +
  geom_function(fun = logistic_fun, aes(colour = "Logistic")) +
  scale_y_log10() +
  labs(title = "Comparison of exponential and logistic growth curves (semi-log plot)", 
       subtitle = "Data from experiment1.csv", 
       x = "t (min)", 
       y = "log(N)") +
  scale_colour_manual(values = c("Logistic" = "blue", "Exponential" = "red"), 
                      name = "Growth type") +
  theme(legend.position = "bottom", legend.justification = "centre")
plot2

