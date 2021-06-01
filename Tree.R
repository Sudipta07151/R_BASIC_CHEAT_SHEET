library(rio)
bin<-import('C:/Users/SUDIPTA ADAK/Desktop/binary.csv')
View(bin)
str(bin)

bin$admit<-as.factor(bin$admit)
bin$rank<-as.factor(bin$rank)

str(bin)

take.sample<-sample(2,nrow(bin),replace=T,prob=c(0.8,0.2))
take.sample

set.seed(1234)
train_data<-bin[take.sample==1,]
View(train_data)

test_data<-bin[take.sample==2,]

str(test_data)
str(train_data)

#TREE

install.packages("party")
library(party)



bin_Tree=ctree(admit~ .,train_data)
bin_Tree
plot(bin_Tree,type="simple")

#error

error<-predict(bin_Tree,train_data)
View(error)
head(train_data)

p_tab<-table(Predicted=error,Actual=train_data$admit)
p_tab


##misclassification

(82+7)/325

#accuracy_percentage
print(paste('Accuracy percentage: ',(216+20)/325))

#error cal of test data

pst_data<-predict(bin_Tree,test_data)
pst_data
pst_tab=table(Predicted=pst_data,Actual=test_data$admit)
pst_tab

#misclassification

print(paste('Misclassification: ',(20+0)/75))


#accuracy_percentage
print(paste('Accuracy percentage: ',(56+2)/75))

