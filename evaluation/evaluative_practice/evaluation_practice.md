![](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1ElztEEG0qaCdQPxa4eZFgEMnW73VtVZp0UWesiHzdyequ05qBo8nYKiQLiTwHEtKfg&usqp=CAU)  
TECNOLÓGICO NACIONAL DE MÉXICO  
INSTITUTO TECNOLÓGICO DE TIJUANA  
SUBDIRECCIÓN ACADÉMICA  
(DEPARTAMENTO DE SISTEMAS Y COMPUTACIÓN)  
ING. SISTEMAS COMPUTACIONALES  
MATERIA:  
MINERÍA DE DATOS  
UNIDAD 2:  
Práctica Evaluatoria  
DOCENTE:  
JOSE CHRISTIAN ROMERO HERNANDEZ  
ALUMNO(S):  
ALONSO VILLEGAS LUIS ANTONIO 18212139  
SANCHEZ BAEZ RAFAEL 16212543  
  
TIJUANA B.C. A 04 DE MAYO DE 2022   
  
# Evaluative Practice Unit 2
### Instructions
Develop the following problem with R and RStudio for knowledge extraction that the problem requires.
The directors of the movie review website are very happy with your previous delivery and now they have a new requirement for you.
The previous consultant had created a chart for them which is illustrated in the following image.
  
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_2/evaluation/evaluative_practice/pic1.jpg)
  
However, the R code used to create the plot has been lost and cannot be recovered.
Your task is to create the code that will recreate the same graph making it look as close to the original as possible.
  
### Procedure  

#### 1. We set the path where our csv file is located, and save it in a "Data" variable
```r
setwd("C:/Users/LuisPC/Desktop/DataMining/Datasets")
getwd()
Data <- read.csv("Project-Data.csv")
```
  
#### 2. We review the data
```r
head(Data)
```
  
#### 3. We filter the data
```r
Genrefilter<-Data[Data$Genre=="action" | Data$Genre=="adventure" | Data$Genre=="animation"| Data$Genre=="comedy" | Data$Genre=="drama",]
Studiofilter<-Genrefilter[Genrefilter$Studio=="Buena Vista Studios"| Genrefilter$Studio=="Fox" | Genrefilter$Studio=="Paramount Pictures"| Genrefilter$Studio=="Sony"| Genrefilter$Studio=="Universal"| Genrefilter$Studio=="WB",]
```
  
#### 4. We call the "ggplot2" libraries to make the graph and load the text fonts
```r
library(ggplot2)
library(extrafont)
loadfonts()
```
  
#### 5. We create the graph that we are asked for
```r
u <- ggplot(Studiofilter, aes(x=Genre, y=Gross...US,color=Studio,size=Budget...mill.))
u + geom_jitter() + geom_boxplot(size=0.3,color="Black",alpha=0.5) + labs(title="Domestic Gross % by Genre",x="Genre",y="Gross % US")+scale_size(name="Budget $M")+theme(axis.title.x = element_text(color = "purple",size=20),
    axis.title.y = element_text(color = "purple",size=20),
    plot.title = element_text(hjust=0.5,size=28,family = "Comic Sans MS"))
```
![](https://github.com/Luis-Alonso18/Data_Mining/blob/Unit_2/evaluation/evaluative_practice/pic2.jpg)

 