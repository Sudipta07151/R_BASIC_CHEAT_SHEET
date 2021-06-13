#two sample t_test
#-------equal variance-use pooled variance-----


mc1<-c(150,152,154,152,151)
mc2<-c(156,155,158,155,154)

#need to check if variance is equal or not
#ho: var(mc1)==var(mc2)
#ha: var(mc1)!=var(mc2)

var.test(x=mc1,y=mc2)

#we get p value as [p-value = 0.9667],
#p is high null must fly
#so we fail to reject null hypothesis
#so we can conclude the variance is equal
#and carry on with the test 

#as variance is equal

t.test(x=mc1,y=mc2,alternative = "two.sided",
       var.equal=T)

#p is low null must go
#so we reject null hypothesis
#[p-value = 0.003919]<0.05

#plot
boxplot(mc1,mc2)

#------------two sample t_test----------
#------------unequal variance----------

library(readr)
data<-read_csv("PerfumeVolumes2.csv")
mch1<-data$`Machine 1`
mch2<-data$`Machine 2`

#need to check if variance is equal or not
#ho: var(mc1)==var(mc2)
#ha: var(mc1)!=var(mc2)

var.test(x=mch1,y=mch2)

#p is low null must go 
#p-value = 0.0164<0.05 so we reject null hypothesis
#and conclude the varinace is different

#variance not equal t test

t.test(x=mch1,y=mch2,var.equal = F)

#here we can reject null hypothesis
# p-value =0.0004141 <0.05

boxplot(mch1,mch2)
