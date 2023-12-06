#Script to plot data and model

#load the data
growth_data <- read.csv("experiment1.csv")

#function for to output population size under logistic growth
logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

#input my values of N0, r and K using exp1
N0 <- 975.5 #initial population
  
r <- 1.004e-02 #growth rate
  
K <- 6.000e+10 #carrying capacity 

#logistic growth of exp1 plot
ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()

  #scale_y_continuous(trans='log10')

#logistic growth of exp1 on semi-log plot
ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point() +
  
  scale_y_continuous(trans='log10')


