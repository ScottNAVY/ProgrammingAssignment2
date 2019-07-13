## Put comments here that give an overall description of what your
## functions do

## First, we do the work and store it in a Matrix so we can access it later

makeCacheMatrix <- function(x = matrix()) {
  m<<-NULL
  set<-function(y){
      x<<-y
      m<<-NULL
  }
  get<- function() x
  setInverse<- function(solve) m <<- inverse 
  getInverse<- function()m
  list(set = set, get =get, setInverse = setInverse, getInverse = getInverse)

}


## Now we summon the cached data, if it's there

cacheSolve <- function(x, ...) {
  m<- x$getInverse()
  if (!is.null(m)) {
    message("We got the data")
    return(m)
  }
  data<-x$get()
  m<-solve(data,...)
  x$setInverse(m)
  m
        ## Return a matrix that is the inverse of 'x'
}

