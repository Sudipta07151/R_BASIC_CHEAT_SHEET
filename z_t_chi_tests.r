install.packages("rio")

#Z_TEST

install.packages("BSDA")
library(BSDA)

data_z=import("C:/Users/SUDIPTA ADAK/Downloads/Perfume+Volumes.csv")
data_z
mean(data_z$`Machine 1`)
#mean=150 sd=2 sample=100 conf-lvl=95%

#single sample test
z.test(x=data_z$`Machine 1`,alternative="greater",sigma.x=2,mu=150)

#p is low than 0.05(so p is high null must fly, failed to reject Ho)

#T_TEST

q<-seq(-4.0,4.0,by=0.1)
dt(q,df=19)
plot(x=q,y=dt(q,df=19),type="l")
lines(x=q,y=dt(q,df=9))
lines(x=q,y=dt(q,df=4))

#sample of 4 bottles volume as (151,153,152,152)
bottle_sample<-c(151,153,152,152)
#conf level 95%
#H0=150cc
#Ha!=150cc
#so two tailed test
t.test(x=bottle_sample,mu=150,alternative = "two.sided",conf.level=0.95)

#p<0.05 (p is low so null must go)
#reject null hypothesis


#CHI_SQUARE_TEST

install.packages("EnvStats")
library(rio)
library(EnvStats)

data_chi=import("C:/Users/SUDIPTA ADAK/Downloads/VolumeVar.csv")
data_chi
#p is higher than 0.05(so p is low null must go, reject Ho)

var(data_chi$Volumes) 

varTest(x=data_chi$Volumes,alternative="greater",sigma.squared=4)
