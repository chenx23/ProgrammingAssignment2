
## The following functions calculate and cache an inverse of a matrix
## so that the calculated inverse can be read directly when it is invoked 
## again.

## This function returns a "matrix", which is a list containing three functions,
## 1. set a matrix
## 2. return a matrix
## 3. return the inverse of a matrix. It first to see if the inverse has 
## been calculated or not. If not, the inverse is computed before returned

makeCacheMatrix <- function(mat = matrix()) {
  inverse <- NULL
  set <- function(y){
    mat <<- y
    inverse <<- NULL
  }
  get <- function() mat
  getinverse <- function(){
    if(is.null(inverse)){
      message("calculate the inverse of a matrix")
      inverse <<- solve(mat)
    }
    inverse
  }
  list(set=set, get=get, getinverse=getinverse)
}


## This function returns the inverse of a matrix

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  x$getinverse()
}

