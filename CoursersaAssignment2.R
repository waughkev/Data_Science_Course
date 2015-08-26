##R Programming Assignment 2: Caching the mean of a vector

##Assignment's makeVector Function, each time function is ran on a matrix, it creates an environment to store the info in


makeVector <- function(x = numeric()) {
  m <- NULL #used to ensure m is NULL at first
  set <- function(y) { #set function that will reset everytime function is ran
    x <<- y
    m <<- NULL
  }
  get <- function() x ##x is grabbed here and returned
  setmean <- function(mean) m <<- mean 
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

##Assignment's cache mean function
cachemean <- function(x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}


##makeCacheMatrix function needed: This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  ##matrix object
  
  ##
}

##cacheSolve This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
##If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should 
##retrieve the inverse from the cache

#solve(x) may be needed

cacheSolve <- function(x,...) {
  ## Return a matrix that is the inverse of 'x'
}