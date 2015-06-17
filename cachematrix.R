## makeCacheMatrix and cacheSolve are used to create an object which stores
## a matrix and its inverse. 


## makeCacheMatrix function stores a list of functions which
##      1. set() to set the matrix
##      2. get() to return the matrix
##      3. getInv() to return the inverse
##      4. setInv() to set the inverse

makeCacheMatrix <- function(x = matrix()) {
    minv <- NULL
    set <- function(y) {
        x <<- y
        minv <<- NULL
    }
    get <- function() {
        return(x)
    }
    getInv <- function() {
        return(minv)
    }
    setInv <- function(inverse) {
        minv <<- inverse
    }
    list(set = set, get = get, setInv = setInv, getInv = getInv)
}



## cacheSolve function checks if the matrix inverse is in cache
##      returns the inverse if it has been cached
##      else calculates the inverse, caches it, returns it

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    minv <- x$getInv()
    if (!is.null(minv)) {
        message("searching cache")
        return(minv)
    }
    invertable = x$get()
    minv <- solve(invertable)
    x$setInv(minv)
    return(minv)    
}