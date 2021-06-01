library(rio)
install.packages("ggplot2")
library(ggplot2)
adv<-read.csv('C:/Users/SUDIPTA ADAK/Desktop/advertising.csv')
TV<-adv$TV
Sales<-adv$Sales

#using PLOT 
plot(TV,Sales,pch=16,cex=1,col="Red")
regression<-lm(Sales~TV)
attributes(regression)
abline(regression)

##USING GGPLOT we require to give slope and intercept
coef(regression)
c<-coef(regression)[1]
s<-coef(regression)[2]
ggplot(adv,aes(x=TV,y=Sales))+geom_point()+geom_abline(slope=s,intercept=c)

#?geom_abline()
#?ggplot()

#OR using geom_smooth()
ggplot(adv,aes(x=TV,y=Sales))+geom_point()+geom_smooth(method = "lm")

#GETTING VALUES
sprintf('R squared: %f ',summary(regression)$r.squared)
sprintf('Correlations^2: %f ',cor(Sales,TV)^2)

plot(adv$Radio,adv$Sales,col="Red",pch=20)
RVS<-lm(adv$Sales~adv$Radio)
abline(RVS)

#USING geom_smooth()
ggplot(adv,aes(x=Radio,y=Sales))+geom_point()+geom_smooth(method = "lm")

