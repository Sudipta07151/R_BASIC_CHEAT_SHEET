library(factoextra)
workdata<-decathlon2
workdata=workdata[c(1:11)]
str(workdata)
colnames(workdata)

#no binary data so no variables to remove
install.packages("GGally")
library(GGally)
ggpairs(workdata)

#-----PRINCIPAL COMPONENT ANALYSIS-----
pca<-prcomp(workdata,center = T,scale=T)
summary(pca)

#attributes available
attributes(pca)
print(pca)

#how many principal component is needed to show the variances
#scree plot
screeplot(x=pca,type="line")
#the elbow point is 5

#plot eigen values
fviz_pca_ind(pca,col.ind="cos2",repel=T)

fviz_pca_var(pca,col.ind="contrib",repel=T)

#individual and variance together

fviz_pca_biplot(pca,repel=T,col.ind="blue",
                col.var="red")

fviz_pca_ind(pca,col.ind=workdata$Rank)
