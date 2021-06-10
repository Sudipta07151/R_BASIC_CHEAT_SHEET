#NORMAL PROBABILITY DISTRIBUTION

par(mfrow=c(1,1))
zvalue<-seq(-4,4,by=0.1)

#gives vertical value of curve-----dnorm()

dnorm(0)
dnorm(1)
dnorm(zvalue)
plot(zvalue,dnorm(zvalue),"l")


#area outisde +3 and -3 (probability find?)

#to find probability-----------pnorm(z value)
#[gives areq to the left of curve]

#area to the left of 3sigma
pnorm(-3)

#area to the right of 3sigma
1-pnorm(-3)


#know probability and find 
#z-value---------qnorm(prob value)





