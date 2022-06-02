# Practice 4
#### Analyze the code corresponding to the data visualization of the machine learning model K Nearest neighbors K-NN,
##### The k-nearest neighbors algorithm, also known as KNN or k-NN, is a non-parametric, supervised learning classifier, which uses proximity to make classifications or predictions about the grouping of an individual data point. While it can be used for either regression or classification problems, it is typically used as a classification algorithm, working off the assumption that similar points can be found near one another.
We will start by loading the data Social_Network_Ads.csv  and filtering the data using only columns 3, 4 and 5
```r
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]
```
Encoding the target feature as factor
```r
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
```
we proceed to divide the dataset into test and training data
```r
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```
We perform the scaling of characteristics to be able to create the learning model.
```r
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```
Fitting K-NN to the Training set and Predicting the Test set results
In this step, the adjustments for the K-NN model are made to the training and test data.
```r
library(class)
y_pred = knn(train = training_set[, -3],
             test = test_set[, -3],
             cl = training_set[, 3],
             k = 5,
             prob = TRUE)
```
Making the Confusion Matrix
```r
cm = table(test_set[, 3], y_pred)
```
Visualising the Training set results

We indicate what data we want in the plot, the division of the data and the visual characteristics that we want for our graph.
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
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/practices/Practice_4_unit3/Captura%20de%20pantalla%20de%202022-06-01%2018-47-08.png?raw=true)
Visualising the Test set results
The same steps are performed as in the previous plot but this time we use the data from the Test set.
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
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/practices/Practice_4_unit3/Test_set.png?raw=true)


We can notice within the two graphs the result of the points of the salary estimate and the age, in the same way we can notice the errors that the model made when classifying the data.