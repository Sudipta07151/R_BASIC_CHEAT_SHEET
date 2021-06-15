#LOGISTIC REGRESSION

#goal: classify student application as admit or reject

#target or dependent variance (admit (0-no ; 1 yes))

#predictors or independent variables(GRE GPA RANK)




#read data file

#mydata<-read.csv(file.choose(),header = T)
mydata<-read.csv("students.csv")
str(mydata)
mydata$admit<-factor(mydata$admit)
mydata$rank<-factor(mydata$rank)
str(mydata)

#two way table of factor variables
xtabs(~admit+rank,data=mydata)


#partition data- train 80% and test 20%
set.seed(1234)
sample.data<-sample(2,nrow(mydata),replace=T,prob=c(0.8,0.2))
train<-mydata[sample.data==1,]
test<-mydata[sample.data==2,]


#LOGISTIC REGRESSION MODEL
#family='binomial' as admit takes only two values

model=glm(admit~gre+gpa+rank,data=train,family='binomial')
summary(model)
#more stars means more statistical significance

#drop gre as it is not statistically significant
model=glm(admit~gpa+rank,data=train,family='binomial')
summary(model)


#PREDICTIONS

#probability that a student will be admitted 
p<-predict(model,train,type="response")

#check the students
head(p)
head(train)

#INTERPRETATION OF COEFFICIENTS
#gpa           1.3735     0.3590   3.826 0.000130 ***
#rank2        -0.5712     0.3564  -1.603 0.108976    
#rank3        -1.1645     0.3804  -3.061 0.002203 ** 
#rank4        -1.5642     0.4756  -3.289 0.001005 **

#as the coef decreases with rank it shows the students 
#from low rank institutions chances for admition gets
#reduced

#as gpa increases the applicant being accepted goes up


#MISCLASIFICATION ERROR
#CONFUSION MATRIX

pred1<-ifelse(p>0.5,1,0)
tab1<-table(Predicted=pred1,Actual=train$admit)
tab1

#73+15 is misclassification
#error %
(1-sum(diag(tab1))/sum(tab1))*100


#misclasification error -test data

p2<-predict(model,test,type="response")
pred2<-ifelse(p2>0.5,1,0)
tab2<-table(Predicted=pred2,Actual=test$admit)
tab2
(1-sum(diag(tab2))/sum(tab2))*100

#goodness of fit test

pvalue<-with(model,pchisq(null.deviance-deviance,
                  df.null-df.residual,lower.tail=F))

pvalue
#p so small so our confidence is high that 
#this model is statistically significant