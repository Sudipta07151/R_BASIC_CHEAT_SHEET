#-------------t-test---------theory

#population standard deviation not known

#t= (xbar-mu)/(sigma of sample / sqrt(n))
#n is no of samples

q<-seq(-4,4,by=0.1)
#find vertical distance
dt(q,df=19)
plot(q,dt(q,df=19),type="l")



#QUESTION EXAMPLE
#Perfume bottle producing 150cc, 
#4 bottles are randomly picked and the average
#volume was found to be 151cc and sd of sample was
#2cc. Has mean volume changed?
#95% conf level

#H0->mean=150cc
#Ha->mean!=150cc (so two tailed test)

tcal=(151-150)/(2/sqrt(4))
#ans :1

#degree of freedom= sample size-1 , here 4-1=3

#population sd not known (so we cannot use z test)

vol=c(151,153,152,152)
t.test(x=vol,mu=150,conf.level=0.95)
