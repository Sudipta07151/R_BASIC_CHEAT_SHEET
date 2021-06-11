library(readr)
library(dplyr)

#GET FIFA DATA 

data<-read_csv('Movie.csv')
View(data)

#SELECTED DATA

data<-data[1:100,]
data<-data[,-c(2,6)]
View(data)

#REMOVE NAME ROW
z<-data[,-c(1)]
na.omit(z)
z<-apply(z,2,as.numeric)
View(z)
str(z)
#PREPARE MODEL

meansCol<-apply(z,2,mean)
sds<-apply(z,2,sd)
normalize<-scale(z,center = meansCol,scale=sds)
View(normalize)

#Find Distance between points
#calculate distance matrix
distance<-dist(normalize)

#make cluster
data.hclust=hclust(distance)
plot(data.hclust,labels = data$Film,,cex=0.6)

#make rectangles
rect.hclust(data.hclust,k=4)

#divide and see cluster elements

table(cutree(data.hclust,4))

#silhouette plot
install.packages("cluster")
library(cluster)

plot(silhouette(cutree(data.hclust,5),distance))


#K-MEANS-CLUSTERING
set.seed(123)
km<-kmeans(normalize,4)
km

clusplot(data,km$cluster)


