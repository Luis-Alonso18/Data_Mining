# Practice 2
Functions
Practice find 20 more functions in R and make an example of it.

#### 1. log() function
The log() function in R returns the natural logarithmic values. The log10() and log2() functions have a base of 10 and 2 respectively. The following code snippet shows the use of these functions.
``` R
log(10)
[1] 2.302585
 ``` 
### 2. var() function
Using R, we can use the var function to calculate the variance of a variable. Considering the following example vector, it is possible to calculate its variance in said function:
``` R
x <- c(10, 25, 12, 18, 5, 16, 14, 20)
var (x)
[1] 38.57143
 ``` 
 ### 3. funcion sd()

In R, the standard deviation of a variable can be calculated using the sd function, as shown below:
``` R
x <- c(10, 25, 12, 18, 5, 16, 14, 20)
sd(x)
[1] 6.21059
 ``` 
### 4. Function rnorm()
It generates the Normal Distributions On Special Spaces. The rnorm() function helps to generate random numbers whose distribution is normal.
``` R
data <- rnorm(10)
data
 [1] -0.817489438  0.796979835 -0.454650872  1.985568831 -2.697695760 -0.145192992 -0.886271081
 [8]  0.007688927 -0.881900841  0.200527728
 ``` 
 ### 5. Function seq()
In this case, the function uses the value 1 as starting point and the value 10 as ending point of the sequence. As you can see based on the previous R code, we therefore created a numeric vector ranging from 1 to 10.
``` R
seq(10)
 [1]  1  2  3  4  5  6  7  8  9 10
 ``` 
 ### 6. Function rep()
 The rep() is a built-in generic R function that replicates the values in the provided vector.  The rep() method takes a vector as an argument and returns the replicated values. Thus, the rep() is a vectorized looping function whose only goal is to achieve iteration without costing time and memory.
``` R
rep(1,20)
 [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
 ``` 
 ### 7 Function sum()
``` R
sum(x=2,y=3)
[1] 5
 ``` 
 ### 8. Function min()
It is used to obtain the minimum of a vector.
``` R
x <- c(10, 25, 12, 18, 5, 16, 14, 20)
min(x)
[1] 5
 ``` 
 ### 9. Function max()
It is used to obtain the maximum of a vector.
``` R
 x <- c(10, 25, 12, 18, 5, 16, 14, 20)
> max(x)
[1] 25
 ``` 
 ### 10. Function length()
It is used to determine the length of a vector.
``` R
x <- c(10, 25, 12, 18, 5, 16, 14, 20)
> length(x)
[1] 8
 ``` 
 ### 11. Function range()
It is used to obtain the range of values ​​of a vector, it gives the minimum and the maximum.
``` R
x <- c(10, 25, 12, 18, 5, 16, 14, 20)
> range(x)
[1]  5 25
 ``` 
 ### 12. Function prod()
Multiply all elements of the vector
``` R
x <- c(10, 25, 12, 18, 5, 16, 14, 20)
> prod(x)
[1] 1209600000
 ``` 
### 13. Function whitch.min()
Returns the position where the minimum value of the vector is.
``` R
x <- c(10, 25, 12, 18, 5, 16, 14, 20)
> which.min(x)
[1] 5
 ``` 
 ### 14. Function whitch.max()
Returns the position of the maximum value of the vector.
``` R
x <- c(10, 25, 12, 18, 5, 16, 14, 20)
> which.max(x)
[1] 2
 ``` 
 ### 15. Function rev()
Invert a vector
``` R
x <- c(10, 25, 12, 18, 5, 16, 14, 20)
> rev(x)
[1] 20 14 16  5 18 12 25 10
 ``` 
 ### 16. Function exp()
It is used to use the exponent e
``` R
exp(1)
[1] 2.718282
 ``` 
  ### 17. Function sqrt()
To take the square root of a number.
``` R
sqrt(49)
[1] 7 
 ``` 
  ### 18. Function abs()
It is used to get the absolute value of a number.
``` R
abs(-52.2)
[1] 52.2
 ``` 
  ### 19. Function for()
The for statement is very useful for repeating a procedure a number of times.
``` R
nrep <- 10
> n <- 100
> conteo <- numeric(nrep)
> for (i in 1:nrep) {
+   x <- runif(n=n, min=1, max=3)
+   conteo[i] <- sum(x >= 2.5)
+ }
> 
> conteo 
 [1] 28 24 21 25 17 23 22 29 32 22
 ``` 
  ### 20. Function gl()
Generate factors by specifying the pattern of their levels.
``` R
 gl(5,2)
 [1] 1 1 2 2 3 3 4 4 5 5
Levels: 1 2 3 4 5
 ``` 
 Referencies.
 1. arula, M. (2021, 15 enero). Logaritmo natural en R. Delft Stack. https://www.delftstack.com/es/howto/r/log-values-in-r/

 2. Coder, R. (2021, 2 octubre). Varianza y desviación típica en R. R CODER. https://r-coder.com/varianza-desviacion-tipica-r/#:%7E:text=Desviaci%C3%B3n%20t%C3%ADpica%20en%20R%20con%20la%20funci%C3%B3n%20sd,Sn%3DSn2%20.
 3. Lathiya, K. (2021, 21 diciembre). rnorm: What is rnorm() Function in R. R-Lang. https://r-lang.com/rnorm-function-in-r/

 4. Seq Function in R (5 Examples) | How to Apply from, to, by & length.out. (2021, 23 diciembre). Statistics Globe. https://statisticsglobe.com/seq-function-in-r/
 5. Crea tu propia función en R paso a paso. (s. f.). Máxima Formación. Recuperado 8 de marzo de 2022, de https://www.maximaformacion.es/blog-dat/crea-tu-propia-funcion-en-r-paso-a-paso/
 6. 5 Funciones básicas de R | Manual de R. (s. f.). Manual de R. Recuperado 8 de marzo de 2022, de https://fhernanb.github.io/Manual-de-R/funbas.html
 7. gl function - RDocumentation. (s. f.). Función Gl. Recuperado 8 de marzo de 2022, de https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/gl
