# Practice 3

## Analyze the code corresponding to the data visualization of the logistic regression machine learning model.

### We configure the path of the folder that contains the csv with the data that is needed.
```R
getwd()
setwd("c:/Users/LuisPC/escritorio/DataMining/MachineLearning/LogisticRegression")
getwd()
```

### Importing the dataset
```R
dataset <- read.csv('Social_Network_Ads.csv')
dataset <- dataset[, 3:5]
```

### Splitting the dataset into the Training set and Test set
```R
library(caTools)
set.seed(123)
split <- sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```



### Feature scaling
```R
training_set[, 1:2] <- scale(training_set[, 1:2])
test_set[, 1:2] <- scale(test_set[, 1:2])
```



### Fitting Logistic Regression to Training set
```R
classifier = glm(formula = Purchased ~ .,
                 family = binomial,
                 data = training_set)
```

### Predicting the Test set results
```R
prob_pred = predict(classifier, type = 'response', newdata = test_set[-3])
prob_pred
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/practices/practice_3_Unit_3/pic1.jpg)


```R
y_pred = ifelse(prob_pred > 0.5, 1, 0)
y_pred
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/practices/practice_3_Unit_3/pic2.jpg)



### Making the Confusion Metrix
```R
cm = table(test_set[, 3], y_pred)
cm
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/practices/practice_3_Unit_3/pic3.jpg)
The diagonal of the confusion matrix would give us 83%.

### We plotted the estimated salary, age, and whether it was purchased, using the training set and the test set.
```R
library(ggplot2)
ggplot(training_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/practices/practice_3_Unit_3/pic4.jpg)

```R
ggplot(training_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/practices/practice_3_Unit_3/pic5.jpg)

```R
ggplot(test_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/practices/practice_3_Unit_3/pic6.jpg)

```R
ggplot(test_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/practices/practice_3_Unit_3/pic7.jpg)



### Visualization the Training set result
```R
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Logistic Regression (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/practices/practice_3_Unit_3/pic8.jpg)

```R
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/practices/practice_3_Unit_3/pic9.jpg)

```R
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/practices/practice_3_Unit_3/pic10.jpg)

```R
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/practices/practice_3_Unit_3/pic11.jpg)



### Visualising the Test set results
```R
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Logistic Regression (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/practices/practice_3_Unit_3/pic12.jpg)

```R
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/practices/practice_3_Unit_3/pic13.jpg)

```R
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/practices/practice_3_Unit_3/pic14.jpg)

```R
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/practices/practice_3_Unit_3/pic15.jpg)



