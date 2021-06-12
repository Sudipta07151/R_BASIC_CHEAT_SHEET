#supervised learning
#KNN

install.packages("caret")
install.packages("mlbench")
library(caret)
library(mlbench)

#Example1 _Student Application(classification)
data<-read_csv('binary.csv')
str(data)

#FACTOR
data$admit[data$admit==0]<-'No'
data$admit[data$admit==1]<-'Yes'

data$admit<-factor(data$admit)
str(data)

#PARTITION DATA
#we can use na.omit(data) to remove na values

set.seed(1234)
variable.data<-sample(2,nrow(data),replace=T,prob=c(0.7,0.3))
str(variable.data)

#according to sample[As we gave 2] 
#traindata==1
#testdata==2

#example
#data[,c(1:2)] get all rows but 2 columns

train<-data[variable.data==1,]
test<-data[variable.data==2,]

#KNN model
#using trainControl() from caret package

trControl<-trainControl(method="repeatedcv",
                        number=10,
                        repeats=3)

set.seed(222)

#admit against all variables so used (.)
#preProcess param to normalize data [val-mean/sd] 

fit<-train(admit~.,
           data=train,
           method="knn",
           tuneLength=20,
           trControl=trControl,
           preProc=c("center","scale")
           )

#get summary
fit
#visualize performance
plot(fit)

#prediction

pred.data<-predict(fit,newdata = test)

#create confusionmatrix
confusionMatrix(pred.data,test$admit)



#example2
data("BostonHousing")
data<-BostonHousing
str(data)
View(data)
#partition data

set.seed(1234)
part.data<-sample(2,nrow(data),prob=c(0.7,0.2),replace=T)
training.data<-data[part.data==1,]
testing.data<-data[part.data==2,]

#KNN MODEL
trControl=trainControl(method ="repeatedcv",
                       number=10,
                       repeats = 3
 
                                             )
set.seed(333)
fit=train(medv~.,
          trControl=trControl,
          method="knn",
          tuneLength=20,
          preProc=c("center","scale"),
          data=training.data)

#model performance
fit

#plot
plot(fit)

#most important and least important variable
varImp(fit)

#predict using test data
predict.data<-predict(fit,newdata=testing.data)

#ACTUAL VALUE ON x axis 
#and predicted value on y axis
plot(predict.data~testing.data$medv)
