arrests<-USArrests
str(arrests)
View(arrests)

#FIND KMEANS

grps<-4
itrs<-25
k.means.arrests<-kmeans(arrests,grps,itrs)
k.means.arrests

#PLOTTING
plot(arrests,col=k.means.arrests$cluster)


#2nd Exp
library(ggplot2)

data.iris<-iris

sapply(data.iris[,-5],FUN=var)

ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width,col=Species))+geom_point()

ggplot(iris,aes(x=Petal.Length,y=Petal.Width,col=Species))+geom_point()


#Clustering

set.seed(200)
k.max=10
wss<-sapply(1:k.max,function(k){kmeans(iris[,3:4],k,nstart = 20,iter.max=20)$tot.wit})
wss

plot(1:k.max,wss,type="b")

icluster<-kmeans(iris[,3:4],3,nstart=20)
table(icluster$cluster,iris$Species)

#cluster plot

install.packages("cluster")
library(cluster)
clusplot(iris,icluster$cluster,color=T,shade=T,
         labels = 0,lines = 0)

tot.withinss<-vector(mode="character",length=10)
for(i in 1:10){
  icluster<-kmeans(iris[,1:4],center=i,nstart=20)
  tot.withinss[i]<-icluster$tot.withinss
}

plot(1:10,tot.withinss,type="b",pch=19)

table(icluster$cluster)
icluster$tot.withinss
icluster$center


#partitioning around meloids [PAM]

pam_with_iris<-pam(iris[,1:4],k=4)
pam_with_iris

#plotting
plot(pam_with_iris)
clusplot(pam(x=iris[,1:4],k=4))


#Hierarchical Clustering

df<-USArrests
is.na(df)

df=na.omit(df)
df<-scale(df)
df
d<-dist(df,method="euclidean")
hc1<-hclust(d,method="complete")
plot(hc1,cex=0.6,hang=-1)


#Hierarchical Clustering in AGNES

hc2<-agnes(df,method="complete")
plot(hc2)

#agglomerate coef under

hc2$ac

m=c("average","single","complete","ward")
names(m)=c("average","single","complete","ward")

#comp coeff

ac=function(x){
  agnes(df,method=x)$ac
}

install.packages("tidyverse")
library(tidyverse)
map_dbl(m,ac)

hc3<-agnes(df,method="ward")
hc3$ac

#dendogram
#pltree

pltree(hc3,cex=0.6,hang=-1,main="Dendogram")


hc4<-diana(df)
hc4$dc
pltree(hc4)

#agglomerative heirarchical clustering

hc5<-hclust(d,method="ward.D2")

#check subgrp
sub_grp=cutree(hc5,k=4)
table(sub_grp)

USArrests%>%mutate(cluster=sub_grp)%>%head
plot(hc5,cex=1)

#rect.hclust()

rect.hclust(hc5,k=4,border=2:6)

hc_a=agnes(df,method="ward")
hc_a


hc_d=diana(df)
hc_d

cutree(as.hclust(hc_d),k=4)

#drawing a tanglegram

install.packages("dendextend")
library(dendextend)

res.dist=dist(df,method="euclidean")
res.dist
hc6<-hclust(res.dist,method="complete")
hc7<-hclust(res.dist,method="ward.D2")
dend1<-as.dendrogram(hc6)
dend2<-as.dendrogram(hc7)

tanglegram(dend1,dend2)

#entanglement
dend_list=dendlist(dend1,dend2)
dend_list

tanglegram(dend1,dend2,
           highlight_distinct_edges = FALSE,
           common_subtrees_color_lines=FALSE,
           common_subtrees_color_branches = TRUE
)

#density based clustering
#density based spatial clusterinf with NOISE

install.packages("fpc")
install.packages("dbscan")
library(fpc)
library(dbscan)

iris_mat<-as.matrix(iris[,-5])
iris_mat

##knndistplot()

kNNdistplot(iris_mat,k=4)

#abline()

abline(h=0.4,col="red")

#for noise point

set.seed(1234)
db=dbscan(iris_mat,0.4,4)
db

##display of the hull plot with the clusters found

hullplot(iris_mat,db$cluster)

#Grubbs Test

set.seed(3147)
x=rnorm(100)
x

boxplot.stats(x)$out
head(df)

(a=which(x%in%boxplot.stats(x)$out))

#(a=which(y%in%boxplot.stats(y)$out))


(outlier.list1=intersect((a,b))
boxplot(df,outcol="red")
