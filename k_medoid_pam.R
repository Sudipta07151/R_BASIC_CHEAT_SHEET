#k-medoid
#using pam algorithm

set.seed(123)
data("USArrests")
data<-USArrests
data<-scale(data)
View(data)

#pam function present inside cluster package

install.packages("cluster")
install.packages("factoextra")
library(cluster)
library(factoextra)

#find optimal number of cluster using fviz_nbclust()
dev.off()
fviz_nbclust(data,FUNcluster =pam,method="wss")+theme_classic()
#elbow point 2

#pam cluster

#pam(data_file_name,dist_metric_type,stanardization required)

pam.cluster<-pam(data,2,metric="euclidean",stand=F)

#visualize

fviz_cluster(pam.cluster,data=data,
             pallette=c("red","blue"),
             geom="point"
             )


#silhoutte plot

pm2<-silhouette(pam.cluster$cluster,dist(data))
fviz_silhouette(pm2)
