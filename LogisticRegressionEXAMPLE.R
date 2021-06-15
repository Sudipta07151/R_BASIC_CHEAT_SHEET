#EXAMPLE 2 LOGISTIC REGRESSION

TitanicData<-read.csv("tested.csv")
str(TitanicData)
TitanicData<-TitanicData[c(2,3,5,10)]
str(TitanicData)
TitanicData$Survived<-factor(TitanicData$Survived)
TitanicData$Pclass<-factor(TitanicData$Pclass)
TitanicData$Sex<-factor(TitanicData$Sex)
str(TitanicData)
View(TitanicData)
#two way tables for factor variables

xtabs(~Survived+Pclass,data=TitanicData)

#partition data
set.seed(1234)
sample.data<-sample(2,nrow(TitanicData),prob=c(0.8,0.2),
                    replace=T)
train<-TitanicData[sample.data==1,]
test<-TitanicData[sample.data==2,]

#logistic Regression Model
#family=binomial as survived takes only two values

model=glm(Survived~Pclass+Fare,
          data=train,family="binomial")

summary(model)

#PREDICTION
p<-predict(model,train,type="response")
head(p)
head(train)

#confusion matrix
pred1<-ifelse(p>0.5,1,0)
tab1<-table(Predicted=pred1,Actual=train$Survived)
tab1

#test data
p2<-predict(model,test,type="response")
pred2<-ifelse(p2>0.5,1,0)
tab2<-table(Predicted=pred2,Actual=test$Survived)
tab2

#goodness of fit test
pvalue<-with(model,pchisq(null.deviance-deviance,
                          df.null-df.residual,
                          lower.tail=F))
             
pvalue
#p value is higher than 0.05 [[1] 0.1271514
#] so model is not significant
