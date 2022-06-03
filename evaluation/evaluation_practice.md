# Evaluation practice  

### Instructions
Develop the following problem with R and RStudio for the knowledge extraction that the problem requires.
Implement the K-Means clustering model with the Iris.csv dataset found at https://github.com/jcromerohdz/iris using the kmeans() method in R. Once the clustering model is obtained do the corresponding data visualization analysis.
At the end of the development, it is explained in detail what the K-Means grouping model consists of and its observations were appropriate in the data visualization analysis.
  

### K-Means Clustering
K-means clustering is one of the simplest and most popular unsupervised machine learning algorithms.

Unsupervised algorithms typically make inferences from data sets using only input vectors without referring to known or labeled outcomes (which do not have a dependent variable).
  
“The goal of K-means is simple: to group together similar data points and discover underlying patterns. To achieve this goal, K-means searches for a fixed number ( k ) of clusters in a data set.
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_4/evaluation/pic1.jpg) 
  
A group refers to a collection of data points aggregated due to certain similarities.
To process the learning data, the K-means algorithm in data mining starts with a first set of randomly selected centroids, which are used as starting points for each set, and then performs iterative (repetitive) calculations to optimize the results. centroid positions.

However, their performance is often not as competitive as other sophisticated clustering techniques because slight variations in the data could lead to a large variance.
  
### Importing dataset
```r
dataset = read.csv('Iris.csv')
dataset = dataset[1:4]
```
  
### We use the elbow method to find the optimal number of clusters
```r
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')

```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_4/evaluation/pic2.jpg) 
  
The graph shows us that the WCSS does not have as many changes after the third cluster, so the optimal number of clusters is 3.

  
### K-Means fit to data set
```r
set.seed(29)
kmeans = kmeans(x = dataset, centers = 3)
y_kmeans = kmeans$cluster
y_kmeans
```
  
### Visualising the clusters
```r
library(cluster)
clusplot(dataset,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of iris),
         xlab = 'Component two',
         ylab = 'Component one')
```      
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_4/evaluation/pic3.jpg) 
  
At the end it shows that the data set is divided into 3 groups, group 3 is between the values of -3 to -1.8, while the other 2 groups range between the values -0.5 to 3.5, reaching certain values, making them belong. to group 1 and 2.
