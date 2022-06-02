# Evaluation practice
### Naïve Bayes
Naive Bayes models are a special class of Machine Learning classification algorithms. They assume that the predictor variables are independent of each other.
In other words, that the presence of a certain feature in a data set is completely unrelated to the presence of any other feature.
They provide an easy way to build models with very good behavior due to their simplicity.
They do this by providing a way to compute the 'posterior' probability of a certain event A occurring, given some 'prior' event probabilities.
  
### Algorithm
Step 1: Compute the prior probability for the given class labels.
Step 2: Determine the probability with each attribute of each class.
Step 3: Put these values into Bayes theorem and calculate the posterior probability.
Step 4: See which class has a higher probability, given that the input variable belongs to the higher probability class.
  
### We load the dataset and limit the data to only the last 3 columns of the csv: “Age”, ”Estimate Salary” and “Purchased”.
```r
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]
```
  
### We establish the levels of the “Purchased” column that would be “0” and “1”.
```r
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
```
  
### We split the dataset into training data and test data.
```r
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```
  
### Feature scaling.
```r
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```
  
### We make the classifier with the training dataset.
```r
library(e1071)
classifier = naiveBayes(formula = Purchased ~ .,
                        data = training_set,
                        type = 'C-classification',
                        kernel = 'linear')
naiveBayes
```

  
### Prediction of the results of the test set.
```r
y_pred = predict(classifier, newdata = test_set[-3])
y_pred
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/evaluation/evaluation_practice_Unit_3/pic1.jpg)
  
### Confusion matrix
```r
cm = table(test_set[, 3], y_pred)
cm
```
  
### Visualising the Training set results
```r
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
     main = 'Naive Bayes (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/evaluation/evaluation_practice_Unit_3/pic2.jpg)
  
```r
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/evaluation/evaluation_practice_Unit_3/pic3.jpg)
  
```r
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/evaluation/evaluation_practice_Unit_3/pic4.jpg)
  
```r
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/evaluation/evaluation_practice_Unit_3/pic5.jpg)
  
  
### Visualising the test set results
```r
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'Naive Bayes (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/evaluation/evaluation_practice_Unit_3/pic6.jpg)
  
```r
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/evaluation/evaluation_practice_Unit_3/pic7.jpg)
  
```r
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/evaluation/evaluation_practice_Unit_3/pic8.jpg)
  
```r
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/evaluation/evaluation_practice_Unit_3/pic9.jpg)

