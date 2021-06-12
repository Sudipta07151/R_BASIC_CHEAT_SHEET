#-------decision tree----

#using party
#decision tree model
library(party)

set.seed(123)

#partition
ind<-sample(2,
            nrow(data),
            prob=c(0.8,0.2),
            replace = T
            )

train=data[ind==1,]
test=data[ind==2,]

tree=ctree(Species~.,data=train)
tree
plot(tree)

#using rpart
library(readr)
library(rpart)
library(rpart.plot)

titanic_data<-read_csv("train.csv")
str(titanic_data)
View(data)
str(data)
View(titanic_data)

#Survived with only one variable
gender_tree<-rpart(Survived~Sex,data=titanic_data)
rpart.plot(gender_tree)

#ALL
gender_tree<-rpart(Survived~.,data=titanic_data)
rpart.plot(gender_tree)


