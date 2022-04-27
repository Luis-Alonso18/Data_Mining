## Practice 1

1. Find a data source with csv format (Free topic)
2. Read the csv and analyze the data with R
3. Generate three graphs with R that tells the history of the data, the first being a scatter plot of points, the second being a facet plot, and the third being a plot that tells us something statistical like the distribution of the data. data and containing the themes layer (theme).
This practice must be documented in its respective branch (branch) of your working repository on github

Data
The data set contains total cases, total deaths, total cases // 1 million inhabitants, total deaths / 1 million inhabitants, percentage of deaths related to the COVID 19 coronavirus pandemic.
Data set obtained from the Worldometer website.

```r
covid <- read.csv("COVID-19 Coronavirus.csv")
head(covid)
colnames(covid) <- c("Country", "Other.Name", "Code", "Population", "Continent", "Total.Cases","Total.Deaths", "Total.Cases.1M.Pop", "Total.Deaths.1M.Pop", "Death.Percentage")
```
![](https://github.com/Luis-Alonso18/Data_Mining/edit/Unit_2/practices/practice_1/pic_1)


### Dot scatter plot
```r
#Scatter plot
ggplot(data=covid,aes(x=Total.Cases.1M.Pop,y=Total.Deaths.1M.Pop,color=Continent))+geom_point()+(xlab("Total Cases per 1M population"))+(ylab("Total Deaths per 1M population"))
```
![](https://github.com/Luis-Alonso18/Data_Mining/edit/Unit_2/practices/practice_1/pic_2)

### Facet chart
```r
#Facets
v <- ggplot(covid, aes(x=Death.Percentage))
v + geom_histogram(binwidth = 1, aes(fill=Continent),color="Black") + facet_grid(Continent~.,scales="free")
```
![](https://github.com/Luis-Alonso18/Data_Mining/edit/Unit_2/practices/practice_1/pic_3)


### Graphic layer themes
```r
o <- ggplot(covid, aes(x=Death.Percentage))
h <- o + geom_histogram(binwidth = 1, aes(fill=Continent), color="black")
h
h+  xlab("Death percentage") +
  ylab("Number of countries") +
  theme(axis.title.x = element_text(color = "Red", size=25),
        axis.title.y = element_text(color = "blue", size=25),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20))
```
![](https://github.com/Luis-Alonso18/Data_Mining/edit/Unit_2/practices/practice_1/pic_4)
