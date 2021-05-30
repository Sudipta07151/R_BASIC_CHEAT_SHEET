data<-mtcars

fit<-lm(data=data,mpg~wt)
fit
plot(x=mtcars$wt,y=mtcars$mpg)
abline(fit)

summary(fit)

co<-coef(summary(fit))
co[,1]

predict(fit)

newcar=data.frame(wt=c(4.5,2,4,56,67))
newcar
predict(fit,newcar)
library(ggplot2)
ggplot(mtcars,aes(x=wt,y=mpg))+geom_point()+geom_smooth(method="lm")
