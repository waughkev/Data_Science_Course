##R str function
str(str)
#Returns function (object, ...)  
##Random x variable
x<- rnorm(100, 2, 4)
summary(x)
str(x)
f <- gl(40, 10)
str(f)
summary(f)
#Use the airqualtiy dataset with summary and str
library(datasets)
head(airquality)
str(airquality)

#str is great forgetting a quick look of your data
m <- matrix(rnorm(100), 10, 10)
str(m)
m[,1]
#Split a data frame by variable in column
s <- split(airquality, airquality$Month)
str(s)

#Generating Random Numbers - Simulation
#set seed for simulation
rnorm(5)
set.seed(1)

#Poisson functions to generate random numbers
rpois(10,1)
rpois(10,2)
rpois(10, 20)

ppois(2,2)
ppois(4,2)
ppois(6,2)

#Simulating a linear model
set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
##Create a plot based on x and y data
plot(x,y)

#Simulting a linear model with binary x
set.seed(10)
x <- rbinom(100,1,0.5)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
##Create a plot based on x and y data
plot(x,y)
#Plot has two parallel vertical line plots


set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))
summary(y)
plot(x,y)

#Random Sampling
set.seed(1)
sample(1:10, 4)

sample(letters, 5)

sample(1:10, replace=TRUE) 