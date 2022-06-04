# Practice 1

## Analyze the code corresponding to the visualization of linear regression machine learning model data.

### We configure the path of the file that contains the data
```R
getwd()
setwd("C:/Users/LuisPC/Desktop/DataMining/MachineLearning/SimpleLinearRegression")
getwd()
```

### Importing the dataset
```R
dataset <- read.csv('Salary_Data.csv')
```

### Splitting the dataset into the Training set and Test set
```R
Install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$Salary, SplitRatio = 2/3)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```

### Fitting Simple Linear Regression to the Training set
```R
regressor = lm(formula = Salary ~ YearsExperience,
               data = dataset)
summary(regressor)
```

### Predicting the Test set results
```R
y_pred = predict(regressor, newdata = test_set)
```

### Visualising the Training set results
```R
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary vs Experience (Training Set)') +
  xlab('Years of experience') +
  ylab('Salary')
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/practices/practice_1_Unit_3/pic1.jpg)  

### Visualising the Test set results
```R
ggplot() +
  geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary vs Experience (Test Set)') +
  xlab('Years of experience') +
  ylab('Salary')
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_3/practices/practice_1_Unit_3/pic2.jpg)  

### Conclusion
Although in the graphs and in the training data set, in some cases they have more years of experience and are paid less than others, the prediction model tells us that the more years of experience they have, the higher the salary.
