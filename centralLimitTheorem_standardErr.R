#generate 10000 numbers uniform distribution
r<-runif(10000)
hist(r)

mu<-mean(r)
sd<-sd(r)


#draw 4 random sample from r and calculate mean

sample.data<-sample(r,4)
m<-mean(sample.data)
s<-sd(sample.data)

cl4<-mean(sample(r,4))
for(i in 1:1000)
{
  cl4<-c(cl4,mean(sample(r,4)))  
}
meancl4<-mean(cl4)
sdcl4<-sd(cl4)
hist(cl4)
 

par(mfrow=c(2,2))
