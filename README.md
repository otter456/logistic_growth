# Reproducible Research: version control with a focus on GitHub and R 

## Question 1: 
*(10 points) Annotate the README.md file in your logistic_growth repo with more detailed information about the analysis. Add a section on the results and include the estimates for N0, r and K (mention which .csv file you used).*

### Introduction

* We want to model population growth in a system where 900µl of growth media is mixed with an an isolate of the bacterium Escherichia coli suspended in 100 µl of the same media. To model population growth it will require estimating the initial population size (N0), the rate of growth (r) and the carrying capacity (K). To do this I will be using the data from **experiment one**.

* To model population growth, we can use a differential equation:
  
![image](https://github.com/otter456/logistic_growth/assets/150150890/9d0f101a-ee52-4741-8ddf-d6517613f0b9)

* If we plot N (number of cells) on the y axis against time on the x axis, we find that the population seems to grow exponentially at the beginning. This is because K is much greater than N0 and t is small. After this, growth slows down as it reaches a constant population size at equilibrium i.e., the carrying capacity.

![image](https://github.com/otter456/logistic_growth/assets/150150890/7c17e994-b4cc-4324-98d1-e259ebd540cf)

* If we then make a semi-log plot by log transforming the y axis, we see an increasing linear relationship at the early time points (red rectangle) and then the population reaches a constant size again at equilibrium (blue rectangle).
  
![image](https://github.com/otter456/logistic_growth/assets/150150890/25e3cb7f-a203-417f-afec-c3c69642d9ef)

### Analysis

1. First we need to plot the growth data from experiment one to show the exponential relationship and then transform the y variable by log10 to get a linear relationship in a semilog plot.

**(found in plot_data.R)**

2. We can then estimate model parameters using linear approximation.

* Model 1: To estimate N0 and r, we can restrict ourselves to a region that shows exponential growth i.e., if N << K then (1-(N/K)) ~ 1, and if t is small, then N ~ N0*e^(rt) and the population will grow exponentially.

   * To do this, subset the data to when t < 1000 because this is where the population growth is linear. Then fit a linear model to output an estimate for ln(N) and r
  
* Model 2: To estimate K, we can set t to tends towards infinity and find that N(t) tends towards K i.e., the population size is equal to the carrying capacity. 

   * To do this, subset the data to when t > 3000 because this is when the population size has reached equilibrium. Then fit a linear model to output an estimate for K

**(found in fit_linear_model.R)**

### Results

* Using experiemtn1.csv I found that N0 = 975.5 (using e^6.883 from model1), r = 1.004e-02 (using the estimate of t in model 1), and K = 6.000e+10 (using the estimate of the intercept in model2)

* We can then use these values and a logistic function to return values for N (x axis) which can be plotted against values of t (y axis). Again we can scale time using log10 to get a linear relationship to which a linear model can be fitted.

**(found in plot_data_and_model.R)**

## Question 2: 
*(10 points) Use your estimates of N0 and r to calculate the population size at t = 4980 min, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth?*

* Assuming exponential growth, I found that N = 5.038612e+24 at t = 4980 min.

* Assuming logistical growth, I found that N = 6e+10 at t = 4980 min. 

* The value of N given for logistical growth is approximately the carrying capacity, however, the exponential estimate is unbounded and therefore yields a much greater value of N.

**(found in compare_exp_and_logistic.R)**

## Question 3: 
*(20 points) Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the README.md file so it can be viewed in the repo homepage.*

* When these values are plotted on a graph, we can see that when exponential growth is assumed (red line) the population grows without bound. This is because exponential growth can only be assumed at small values of N and t.
  
* On the other hand, when logistical growth is assumed (blue line), the population size is limited by the carrying capacity (K). This is because as N approaches K, dN/dt approaches zero and the population reaches equilibrium.

![image](https://github.com/otter456/logistic_growth/assets/150150890/2ce08514-2586-4dc4-8f2c-3aef329cef15)

![image](https://github.com/otter456/logistic_growth/assets/150150890/14fccb14-a375-4785-a11c-e18ca5758499)

**(found in compare_exp_and_logistic.R)**

