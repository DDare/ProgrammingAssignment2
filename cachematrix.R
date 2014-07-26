
## Cache an inverse of a matrix via 2 functions
## Creates a matrix object that can cache its inverse with <<

makeCacheMatrix <- function( m = matrix() ) {

    y <- NULL

## Set the matrix
    set <- function( matrix ) {
            m <<- matrix
            y <<- NULL
    }

## Get the matrix
    get <- function() {
    	## Return the matrix
    	m
    }

## Set inverse of the matrix
    setInverse <- function(inverse) {
        y <<- inverse
    }

## Get the inverse of the matrix

    getInverse <- function() {
        y
    }

## Return list
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}

## ...............................................................
## Get inverse of the special matrix from "makeCacheMatrix"
## If the inverse has already been calculated then the "cachesolve" 
## will retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {


## Return a matrix that is the inverse of 'x'
    m <- x$getInverse()

## Return the inverse if its already set
    if( !is.null(m) ) {
            message("Retrieving data")
            return(m)
    }

    data <- x$get()

## Calculate the inverse
    m <- solve(data) %*% data

    x$setInverse(m)

## Display the matrix
    m
}
