##R Programming Coursera Swirl Tutorial


install.packages("swirl")

library(swirl)

ls() ##Show all variables

rm(list=ls()) ##remove all variables in workspace



x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
x[!bad]


x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", "f",NA)

good <- complete.cases(x,y) ##Finds mathcing indexes in each list without an NA value
good ##Displays status of if index in two lists have non-NA values for both
##Returns TRUE  TRUE FALSE  TRUE FALSE FALSE

x <- matrix(1:4, 2, 2)
y <- matrix(rep(10, 4), 2 ,2)
x
y
x * y ##Multiplies each element in the matrix by it's matchign index in the other matrix
x/y ##Divides each element in the matrix by it's matchign index in the other matrix
x %*% y ##Matrix multiplication, which does something I am not 100% sure

x <- 4 ##declared variable
y <- if(X > 3) { ##condition of if x is greater than 3
  9 ##makes y 9
} else { ## if x is not greater than 3 (3 or lower)
  0 ##y becomes 0
}
y

for(i in 1:10) {
  print(i)
}

x <- matrix(1:6, 2, 3) #matrix of 2 rows and 3 columns
x ##MAtrix variable for testing
for(i in seq_len(nrow(x))) {  ##for loop to compare i to the sequence lenth of number row for x
  for(j in seq_len(ncol(x))) { ##for loop to compare j to sequence length of number column for x
    print(x[i, j]) ##prints current matrix index using i and j as row and column indexes
  }
}

##While Loop
whilecount <- 0
while(whilecount < 10) {
  print(whilecount)
  whilecount <- whilecount + 1
}


##While loop for a coin flip simulation
z <- 5

while(z >= 3 && z <= 7) {
  print(z)
  coin <- rbinom(1, 1, 0.5) #random binomial distribution
  
  if(coin == 1) {
    z <- z + 1
  } else {
    z <- z - 1
  }
}
print(z)


make.power <- function(n) {
  pow <- function(x) {
    x^n
  }
  pow
}

cube <- make.power(3)
square <- make.power(2)
cube(2)
square(15)
deca <- make.power(12)
deca(5)

ls(environment(cube))
get("n", environment(cube))

y <- 10
f <- function(x) {
  y <- 2
  y^2 + g(x) ##y^2 will be 2^2, since y in the function is 2
}

g <- function(x) {
  x*y
}

f(3) ##g equals 30, since it will take global y variable of 10, added to the 4 of y^2 in the f function, the total is 34 

##Normal Likelihood, taken from optimization examples
make.NegLogLik <- function(data, fixed=c(FALSE, FALSE)) {
  params <- fixed
  function(p) {
    params[!fixed] <- p #changes params that are not fixed to p?
    mu <- params[1]
    sigma <- params[2]
    a <- -0.5*length(data) *log(2*pi*sigma^2)
    b <- -0.5*sum(data-mu)^2/(sigma^2)
    -(a + b)
  }
}

##Setting a seed
set.seed(1); normals <- rnorm(100, 1,2) ##remember what rnorm does again? vecotr of the first number
nLL <- make.NegLogLik(normals)          ##with a mean of the second number and a standard deviation of the third
nLL
ls(environment(nLL))

##Using the new nLL function with optim
##mu is mean, sigma is the standard deviation
optim(c(mu = 0, sigma =1), nLL)$par ##what the hell is $par?

nll <- make.NegLogLik(normals, c(FALSE, 2))
optimize(nLL, c(-1, 3))$minimum

##Dates and Times
x <- as.Date("1970-01-01")
xju <- unclass(x <- as.Date("1983-06-13"))
y <- as.Date("2015-08-19")
yju <- unclass(y <- as.Date("2015-08-19"))

#Look into POSIXct and POSIXlt classes

#lapply examples
x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)

v <- 1:4
lapply(v, runif) # runif genereates random deviates
lapply(v, runif, min=0, max =10)

mac <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
mac
lapply(mac, function(elt) elt[,1]) # anon function made to 