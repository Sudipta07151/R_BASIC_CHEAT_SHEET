#one sample variance test
#chi square distribution

#example: 
#25 bottles were selected and their variances was 5
#Has sd increased from the historical 4 variance?
#95% conf level

#Ho:var<=4
#Ha:var>4

install.packages("EnvStats")
library(EnvStats)

#import data
library(readr)
data<-read_csv("PerfumeVolumes2.csv")
data<-as.data.frame(data)
data<-data$`Machine 1`
View(data)

sampledata<-sample(data,25)
sampledata

#test
varTest(x=sampledata,sigma.squared =4, 
          ,alternative = "greater",
        conf.level = 0.95)


#p is high so null must fly
#so we fail to reject null hypothesis


#without using package
#using formula

calChi<-(25-1)*var(sampledata)/4
calChi

#use qchisq for 5% area on the right
#5% prob on right tail
critChi<-qchisq(p=0.05,df=24,lower.tail=F)
critChi

#as calculated is less than critical value so
#we fail to reject null hypothesis

