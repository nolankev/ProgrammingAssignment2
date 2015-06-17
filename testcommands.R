A = matrix(1:9,3,3)
A[3,3] = 40
a <- makeCacheMatrix(A)

a$get()     # should return the matrix
a$getInv()  # should return null
a$setInv(2.718281828)
a$getInv()  # should return e =~ 2.718

cacheSolve(a)   # should print "searching cache" and then
                # return e=~ 2.718 again, because it's in the cache

a$set(A)        # wipes the cache (globally) when it does minv <<- NULL
cacheSolve(a)   # returns the inverse now, not 2.718 anymore,
                # because cache had emptied, and needed to be recalculated.
                # Notice "searching cache" was not printed

# 4x4 messing
v1 = c(5,2,4,-1)
v2 = c(-1,1,-1,1)
v3 = c(0,1,0,1)
v4 = c(10,0,4,0)
sol = c(34.5, -3.5, 2.5, 48)
G = rbind(v1,v2,v3,v4)
g = makeCacheMatrix(G)
cacheSolve(g)
cacheSolve(g) %*% sol # searches cache, since there is something already in there