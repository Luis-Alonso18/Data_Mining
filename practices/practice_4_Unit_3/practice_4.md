# Practice 4

### K-Nearest Neighbors (K-NN)

### Importing the dataset
```r
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]
```
  
### Coding of the target feature as a factor
```r
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
```
  
### Split the dataset into the training set and the test set
```r
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```
  
### Feature Scaling
```r
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```
  
### Fitting K-NN to the training set and predicting the results of the test set
```r
library(class)
y_pred = knn(train = training_set[, -3],
             test = test_set[, -3],
             cl = training_set[, 3],
             k = 5,
             prob = TRUE)
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/practices/practice_4_Unit_3/pic1.jpg)
  
### Create the confusion matrix
```r
cm = table(test_set[, 3], y_pred)
```
  
### Visualising the Training set results
```r
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3], test = grid_set, cl = training_set[, 3], k = 5)
plot(set[, -3],
     main = 'K-NN (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
```` 
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/practices/practice_4_Unit_3/pic2.jpg)
  
```r
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/practices/practice_4_Unit_3/pic3.jpg)
  
```r
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/practices/practice_4_Unit_3/pic4.jpg)
  
```r
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/practices/practice_4_Unit_3/pic5.jpg)
  
### Visualising the test set results
```r
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3], test = grid_set, cl = training_set[, 3], k = 5)
plot(set[, -3],
     main = 'K-NN (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/practices/practice_4_Unit_3/pic6.jpg)
  
```r
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/practices/practice_4_Unit_3/pic7.jpg)
  
```r
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/practices/practice_4_Unit_3/pic8.jpg)
  
```r
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/practices/practice_4_Unit_3/pic9.jpg)
  
### Conclusion
The algorithm gives us as a result 2 zones that indicate which is the group to which each data belongs according to age and estimated salary.
