library(readr)

#-----------one sample z test---theory--------------

#mu=150cc
#sd/sigma=2cc
#95% confidence level == z=1.96

#ho= mu=150cc
#ha= mu!=150cc ,so two tailed test

#single sample
#z= (x-mu)/sigma 

#multiple sample
#z=(x-mu)/(sigma/root(n))
#n=sample size

 
#-----------one sample z test----lab--------------

#q)Bottles are being produced with mean as 150cc and 
#standard deviation of 2cc. 

#sample of 100 bottles show the mean as 152. 
#Has the mean volume increased?

#check with 95% confidence level

#Ha: mean>150cc (so upper tail test)
#Ho: Mean <=150cc

data<-read_csv('Perfume.csv')
mu<-mean(data$`Machine 1`)

#without using package
zvalue<-(mu-150)/(2/sqrt(100))
zvalue

#get z value for 95% confidence level
qnorm(0.05) #on the left of curve same will be at right

#we got z=10
#so we reject null hypothesis


#USING PACKAGE------BSDA----

install.packages("BSDA")
library(BSDA)

?z.test()

#if data set not given
x=rnorm(100,152,sd=2)
z.test(x=x,alternative = "greater",sigma.x =2,mu=150)

#if data set given
z.test(x=data$`Machine 1`,alternative="greater",sigma.x =2,mu=150,conf.level =0.95 )
 
