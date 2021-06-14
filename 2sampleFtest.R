#F test

#example: 
#we took 8 samples from machine A and the 
#standard deviation was 1.1.

#from machine B we picked 5 sample and the variance was 11.

#is there a difference in the variance from machine a and B
#check with 95%confidence level


#Ho: va==v2
#Ha:va!=v2 [two tailed test]

mchA<-c(150,150,149,151,151,148,151,151)
sd(mchA)
vA<-var(mchA)

mchB<-c(152,146,152,150,155)
sd(mchB)
vB<-var(mchB)

var.test(y=mchA,x=mchB,ratio=1,conf.level=0.9)
#p is low null must go
#p-value =0.01516<0.10 
#so we reject null hypothesis



#with formula
Fcal<-vB/vA #as vB > vA here
Fcal

#df is sample sizes-1
Fcrit<-qf(p=0.05,df1=4,df2=7,lower.tail =F )
Fcrit

#we reject null hypothesis as Fcal>Fcrit