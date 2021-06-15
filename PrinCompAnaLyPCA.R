#PCA

library(factoextra)
data("decathlon2")

carsdata<-mtcars
head(carsdata)
str(carsdata)
colnames(carsdata)

#removing binary data
workdata<-mtcars[,c(1:7,10:11)]
str(workdata)

#scatter plot and correlation
install.packages("GGally")
library("GGally")
ggpairs(workdata)

#PRINCIPAL COMPONENT ANALYSIS
pca<-prcomp(workdata,center=T,scale=T)
summary(pca)

#attributes available
attributes(pca)
print(pca)

#how many principal component is needed to show the variances
#scree plot
screeplot(x=pca,type="line")
#choose the elbow point, here 3

#plot eigen value
#factoextra library required
fviz_eig(pca)

#PCA PLOTS
#using biplot
biplot(pca)

#using autoplot
install.packages("ggfortify")
library(ggfortify)
autoplot(pca)

#USING FANCY PLOTS

fviz_pca_ind(pca,col.ind="cos2",
             gradient.cols=c("red","yellow","green"),
             repel=T)


fviz_pca_var(pca,col.var="contrib",
             gradient.cols=c("red","yellow","green"),
              repel=T)



#individual and variance together
fviz_pca_biplot(pca,
                repel=T,
                col.var="red",
                col.ind="blue"
                )

fviz_pca_ind(pca,
             col.ind=mtcars$am,
             palette=c("red","blue"),
             addEllipses = T
             )
