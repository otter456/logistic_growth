#Script to estimate the model parameters using a linear approximation

#install package dplyr for piping
install.packages("dplyr")

#load package
library(dplyr)

#load data
growth_data <- read.csv("experiment1.csv")

##Case 1. K >> N0, t is small

#filter data to when t<1000 because this is when we see linear growth
data_subset1 <- growth_data %>% filter(t<1000) %>% mutate(N_log = log(N))

#run the linear model for case 1
model1 <- lm(N_log ~ t, data_subset1)
summary(model1)

##Case 2. N(t) = K

#filter the data to when t>3000 because this is when it reaches carrying capacity
data_subset2 <- growth_data %>% filter(t>3000)

#run the linear model for case 2
model2 <- lm(N ~ 1, data_subset2)
summary(model2)
