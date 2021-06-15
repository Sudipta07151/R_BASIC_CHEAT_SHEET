#PRINCIPAL COMPOENT ANALYSIS

library(factoextra)
data("decathlon2")
data<-decathlon2
str(data)

active<-data[1:23,1:10]
head(active[,1:6])

#PCA
res.pca<-prcomp(active,scale=T)
fviz_eig(res.pca)

fviz_pca_ind(res.pca,col.ind="cos2")

fviz_pca_var(res.pca,col.val="contrib")

fviz_pca_biplot(res.pca,repel=T)

#RESULT OF PCA
#CALCULATE THE EIGEN VALUE

eigenValue<-get_eigenvalue(res.pca)
eigenValue


#variance

res.var=get_pca_var(res.pca)
res.var
View(res.var$coord)
View(res.var$cos2)

#for individual

res.ind=get_pca_ind(res.pca)
View(res.ind$coord)

#prediction using PCA
ind.sup=decathlon2[24:27,1:10]
ind.sup[,1:6]
ind.coord<-predict(res.pca,ind.sup)
ind.coord[,1:4]

