#DENSITY_BASED_CLUSTERING

#preparing data
data("iris")
data<-iris
str(iris)
data.removed.factor<-data[,-c(5)]
str(data.removed.factor)

#package required
install.packages("fpc")
install.packages("dbscan")
library(fpc)
library(dbscan)
library(factoextra)

#two pramenters for density based clustering
#1) eps, 2)minPoints

#obtatining optimal eps value

kNNdistplot(data.removed.factor,k=3)
#optimal value where line goes suddenly up here 0.45
abline(h=0.45)

#density based clustering with fpc & dbscan
set.seed(123)

#as dbscan() is found both in fpc and dbscan package
#so we have to mention which package to use

#using fpc package
f<-fpc::dbscan(data.removed.factor,eps=0.45,MinPts = 6)

print(f)
#the result shows the cluster devision
#0col means the number of noise points
#this gives border points info also

#using dbscan package
d<-dbscan::dbscan(data.removed.factor,eps=0.45,minPts = 6)
print(d)
#this only gives summary of clusters

#cluster visualization
#using f 
fviz_cluster(f,data.removed.factor,geom="point")

#using d
fviz_cluster(d,data.removed.factor,geom="point")

