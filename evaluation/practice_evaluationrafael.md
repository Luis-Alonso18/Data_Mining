# Unit 4 evaluative practice
### K-Means Clustering
K-means clustering is one of the simplest and most popular unsupervised machine learning algorithms.
Unsupervised algorithms typically make inferences from data sets using only input vectors without referring to known or labeled outcomes (which do not feature a dependent variable).
“The goal of K-means is simple: to group together similar data points and discover underlying patterns. To achieve this goal, K-means searches for a fixed number ( k ) of clusters in a data set.
![](https://internsofdata.files.wordpress.com/2020/03/1976e-1fz-rjypprlgemdti-rlbdg.png)

A group refers to a collection of data points aggregated due to certain similarities.
To process the learning data, the K-means algorithm in data mining starts with a first set of randomly selected centroids, which are used as starting points for each set, and then performs iterative (repetitive) calculations to optimize the results. centroid positions.
However, their performance is often not as competitive as other sophisticated clustering techniques because slight variations in the data could lead to a large variance.
We import the dataset
Load the data.
```r
dataset = read.csv('iris.csv')
dataset = dataset[1:4]
```
We will use this method to find the optimal value of k
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
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_4/evaluation/pic2.jpg?raw=true)

Using the method of k means, using the number of k that we find in the graph
```r
set.seed(29)
kmeans = kmeans(x = dataset, centers = 3)
y_kmeans = kmeans$cluster
y_kmeans
```
We visualize the centroids with the data separated by the kmeans model
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
         main = paste('Clusters of iris'),
         xlab = 'Component two',
         ylab = 'Component one')
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_4/evaluation/pic3.jpg?raw=true)

We can observe the centroids that were generated and the data is joined in two centroids, centroids 1 and 2 share data from 0 to 3 while centroid 3 has data from -1 to -3