## This set of functions cache the inverse of a matrix 
##

## This function initializes a list of functions to be used for caching matrix inverses

makeCacheMatrix = function(x=matrix()) {
  m <- NULL
  
  set = function(y) {
    x <<- y
    m <<- NULL
  }
  
  get = function() {
    x
  }
  
  setinverse = function(mat) {
    m <<- mat
  }
  
  getinverse = function() {
    m
  }
  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## This function gets the inverse of the matrix. It gets it from the cache if it is already computed.
## If not it computes it using the 'solve' function

cacheSolve = function(specialmat) {
  mat1 = specialmat$getinverse()
  
  if(!is.null(mat1)) {
    message("getting cached data")
    return(mat1)
  }
  
  mat2 = specialmat$get()
  invmat = solve(mat2)
  specialmat$setinverse(invmat)
  invmat
}

