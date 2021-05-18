library(rio)
data=import('C:/Users/SUDIPTA ADAK/Downloads/weight-height.csv')
data
data<-as.data.frame(data)
data
head(data)

x=data$Height[1:50]
y=data$Weight[1:50]

plot(x,y)

plot(x,y,
    pch=19,
    xlab="HEIGHT",
    ylab="WEIGHT" ,
    main="HEIGHT VS WIEGHT"
)

#y as a function of x
abline(lm(y~x))

correlation=cor(y,x)
correlation

cor.test(y,x)

model<-lm(y~x)
model

summary(model)
