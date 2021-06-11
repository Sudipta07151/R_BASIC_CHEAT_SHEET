#CHI SQUARE TEST-----theory--------

#used to test one sample against the 
#population variance

#chi2=((n-1)pow(S,2))/pow(sigma,2)

#n no of sample items
#S square is variance of sample
#sigma square is variance of population

#A sample of 25 bottles was selected.
#The variance of these 25 bottles as 6cc.
#Has it increased from established 5cc?
#95% confidence level

#Ha: S^2>sigma^2
#H0: s^2<=sigma^2

#chi2=24*5/4=30

#critical value of chi square from 24 degrees 
#of freedom=36.42

#fail to reject H0

#--------------LAB------------
#using '''Envstats''' package

install.packages("EnvStats")
library(EnvStats)
library(readr)

data<-read_csv("Perfume.csv")
v=var(data$`Machine 1`)
View(data)

#if data not present

#d=rnorm(6,sd=sqrt(6),mean=150)
#d
#take mean as anything


varTest(x=data$`Machine 1`,alternative = "greater",
        conf.level=0.95,sigma.squared =5)
