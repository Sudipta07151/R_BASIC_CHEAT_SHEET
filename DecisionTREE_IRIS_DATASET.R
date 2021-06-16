data<-iris
str(data)
summary(iris)
str(data)

#partition data
set.seed(555)

sample.data<-sample(2,nrow(data),prob=c(0.8,0.2),replace=T)
train=data[sample.data==1,]
test=data[sample.data==2,]

#decision tree model
library(party)

#here species is a categorical variable
tree=ctree(Species~.,train)

#visualization Tree
plot(tree)

#simple tree plot
plot(tree,type="simple")


#if we used for a numerical variable
tree=ctree(Sepal.Length~.,train)
plot(tree)

#prediction and misclassification

#if we only want type
pred1<-predict(tree,train)
pred1

#if we want probability
pred2<-predict(tree,train,type="prob")
pred2


#errors train data
pred3<-predict(tree,train)
tab1<-table(pred3,train$Species)
1-sum(diag(tab1))/sum(tab1)

#errors test data
pred4<-predict(tree,test)
tab2<-table(pred4,test$Species)
1-sum(diag(tab2))/sum(tab2)
