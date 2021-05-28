#NORMAL DISTRIBUTION

#rnorm <- random normal (random numbers from normal distribution)
#pnorm <- probability left of z =-2 (area under the curve to the left)
#qnorm <- if we know the percentage and want to know the z value
#dnorm <-  value on y axis of normal distribution

rdist<-rnorm(100,mean=10,sd=3)

#z to PERCENTAGE
pnorm_val<-pnorm(-1.96)
pnorm_val

#PERCENTAGE TO  z 
qnorm_val<-qnorm(0.025)
qnorm_val

#vertical y value
vertical_y_val<-dnorm(0)
vertical_y_val

#plotting normal distribution (using base package)

zvalue<-seq(-4,4,0.1)
yvalue=dnorm(zvalue)
plot(x=zvalue,y=yvalue,type="l")

#plotting normal distribution (using VISUALIZE package)

install.packages("visualize")
library(visualize)

# zvalue
visualize.norm(-2)
visualize.norm(-3)

#beyond 3 sigma
#default mu=0 and sd=1
visualize.norm(c(3,-3),section="tails")
visualize.norm(3,sd=3,section="upper")
visualize.norm(c(3,5),sd=5,section="bounded")

