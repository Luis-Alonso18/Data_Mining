# Practice 2
Analyze the code corresponding to the data visualization of the multiple linear regression machine learning model, also analyze the code corresponding to the backward elimination function.

### Data
Set a path to the folder containing the file with the data
```
getwd()
setwd("C:/Users/LuisPC/Desktop/DataMining/MachineLearning/MultipleLinearRegression")
getwd()
```

### Importing the dataset
```R
dataset <- read.csv('50_Startups.csv')
```

### Encoding categorical data 
```R
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))

dataset
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/practices/practice_2_Unit_3/pic1.jpg)

### Splitting the dataset into the Training set and Test set
```R
library(caTools)
set.seed(123)
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```

### Fitting Multiple Linear Regression to the Training set
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State)
```R
regressor = lm(formula = Profit ~ .,
               data = training_set )

summary(regressor)
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/practices/practice_2_Unit_3/pic2.jpg)

### Prediction the Test set results
```R
y_pred = predict(regressor, newdata = test_set)
y_pred
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/practices/practice_2_Unit_3/pic3.jpg)

### Assigment: visualize the siple liner regression model with R.D.Spend 
### Building the optimal model using Backward Elimination
```R
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               data = dataset )
summary(regressor)
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/practices/practice_2_Unit_3/pic4.jpg)
```R
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
               data = dataset )
summary(regressor)
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/practices/practice_2_Unit_3/pic5.jpg)
```R
regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset )
summary(regressor)
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/practices/practice_2_Unit_3/pic6.jpg)
```R
regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset )
summary(regressor)
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/practices/practice_2_Unit_3/pic7.jpg)
```R
y_pred = predict(regressor, newdata = test_set)
y_pred
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/practices/practice_2_Unit_3/pic8.jpg)


### Analise the follow atomation backwardElimination function 
```R
backwardElimination <- function(x, sl) {
  numVars = length(x)
  for (i in c(1:numVars)){
    regressor = lm(formula = Profit ~ ., data = x)
    maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
    if (maxVar > sl){
      j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
      x = x[, -j]
    }
    numVars = numVars - 1
  }
  return(summary(regressor))
}

SL = 0.05
```

dataset = dataset[, c(1,2,3,4,5)]
```R
training_set
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/practices/practice_2_Unit_3/pic9.jpg)

```R
backwardElimination(training_set, SL)
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/practices/practice_2_Unit_3/pic10.jpg)  
What this function does is remove features that do not have an effect on the dependent variable or the prediction of the output.



