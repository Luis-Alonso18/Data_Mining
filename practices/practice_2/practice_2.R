#Functions
#Practice find 20 more functions in R and make an example of it.
log(10)

# Vector sample
x <- c(10, 25, 12, 18, 5, 16, 14, 20)
var (x)
#vector sample
x <- c(10, 25, 12, 18, 5, 16, 14, 20)
sd(x)

data <- rnorm(10)
data

seq(10)

rep(1,20)

sum(x=2,y=3)
# Vector sample
x <- c(10, 25, 12, 18, 5, 16, 14, 20)
min(x)
# Vector sample
x <- c(10, 25, 12, 18, 5, 16, 14, 20)
max(x)
# Vector sample
x <- c(10, 25, 12, 18, 5, 16, 14, 20)
length(x)
# Vector sample
x <- c(10, 25, 12, 18, 5, 16, 14, 20)
range(x)
# Vector sample
x <- c(10, 25, 12, 18, 5, 16, 14, 20)
prod(x)
# Vector sample
x <- c(10, 25, 12, 18, 5, 16, 14, 20)
which.min(x)
# Vector sample
x <- c(10, 25, 12, 18, 5, 16, 14, 20)
which.max(x)
# Vector sample
x <- c(10, 25, 12, 18, 5, 16, 14, 20)
rev(x)

exp(1)
sqrt(49)
abs(-52.2)
# Function for()
nrep <- 10
n <- 100
conteo <- numeric(nrep)
for (i in 1:nrep) {
  x <- runif(n=n, min=1, max=3)
  conteo[i] <- sum(x >= 2.5)
}

conteo 

gl(5,2)
