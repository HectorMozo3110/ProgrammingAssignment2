source("cachematrix.R")

x <- matrix(c(1, 2, 3, 4), 2, 2)

m <- makeCacheMatrix(x)

print("First calculation:")
print(cacheSolve(m))

print("Second calculation:")
print(cacheSolve(m))