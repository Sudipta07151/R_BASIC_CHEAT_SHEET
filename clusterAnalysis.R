library(readr)
data<-read_csv('utilities.csv')
str(data)
View(head(data))

#scatter plot (with pairs which is suitable) 
pairs(data[2:9])

#scatter plot
plot(data$Fuel_Cost~data$Sales,data=data)
#inlcude labels
with(data=data,text(data$Fuel_Cost~data$Sales,
                    labels=data$Company,,pos=2,cex=0.5))


#normalize

#we exclude column 1  
z<-data[,-c(1)]
meansCol<-apply(z,2,mean)  #1 means row ---#2 means column
sds<-apply(z,2,sd)
#to normalize
nor=scale(z,center=meansCol,scale=sds)

#calculate distance matrix
distance=dist(nor)
#Hierarchical agglomerative clustering

#using default method=complete
data.hclust=hclust(distance)
plot(data.hclust)

#plot company names
plot(data.hclust,labels=data$Company)

#using default method=ward.D
data.whclust=hclust(distance,method="ward.D")
plot(data.whclust)

#drawing rectangle to segregate clustors
#k denotes how many clusters
rect.hclust(data.whclust,k=5)

#Cluster membership
member=cutree(data.whclust,3)
#shows how many member in each cluster
table(member)

#characterizing clusters
aggregate(nor,list(member),mean)

#Silhoutee Plot
install.packages("cluster")
library(cluster)

plot(silhouette(cutree(data.hclust,3),distance))

#-------------K-MEANS-CLUSTERING----------


set.seed(123)
km<-kmeans(nor,3)
km
km$cluster

#Within cluster sum of squares SS should be low
#as elements will be tightly packed

#total_SS high is better as clusters are further 
#apart and that means good clustering

#visualize kmeans

clusplot(data,km$cluster,color=T,
         shade=T,labels=2,
         lines=2)
