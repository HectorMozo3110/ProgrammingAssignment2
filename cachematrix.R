## These functions create a special matrix object that can cache
## its inverse so the inverse does not need to be recalculated
## every time it is requested.


## This function creates a special matrix object that can store
## a matrix and cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

    inv <- NULL

    set <- function(y) {
        x <<- y
        inv <<- NULL
    }

    get <- function() x

    setinverse <- function(inverse) {
        inv <<- inverse
    }

    getinverse <- function() inv

    list(
        set = set,
        get = get,
        setinverse = setinverse,
        getinverse = getinverse
    )
}


## This function returns the inverse of the special matrix.
## If the inverse has already been calculated, it retrieves
## the cached inverse instead of recomputing it.

cacheSolve <- function(x, ...) {

    inv <- x$getinverse()

    if(!is.null(inv)) {
        message("getting cached inverse matrix")
        return(inv)
    }

    data <- x$get()

    inv <- solve(data, ...)

    x$setinverse(inv)

    inv
}