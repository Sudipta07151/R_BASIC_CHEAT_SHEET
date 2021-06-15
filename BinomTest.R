data<-read.csv('500_Person_Gender_Height_Weight_Index.csv')
data$Gender<-factor(data$Gender)
str(data)
head(data)

#we will check whether the male/female proportion
#in the population is 50/50

mytable=table(data$Gender)
mytable

#ho:no of female=no of female
#ha:no of female!=no of female [two sided]

#run the binom test
binom.test(mytable,p=0.50,
           alternative = "two.sided",
           conf.level=0.95)

#p is high null must fly
#fail to reject null hypothesis


#to check wheteher proportion of male success is 60%

binom.test(mytable,p=0.40,
           alternative = "two.sided",
           conf.level=0.95)

#p is low null must go
#reject null hypothesis