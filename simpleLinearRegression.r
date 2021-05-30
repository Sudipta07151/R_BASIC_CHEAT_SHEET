library(ggplot2)
mouse.data <- data.frame(
  weight=c(0.9, 1.8, 2.4, 3.5, 3.9, 4.4, 5.1, 5.6, 6.3),
  size=c(1.4, 2.6, 1.0, 3.7, 5.5, 3.2, 3.0, 4.9, 6.3))
)
#ggplot(mouse.data,aes(x=weight,y=size))+geom_point()
#?ggplot(data=mouse.regression)+geom_abline()
#?ggplot()


plot(x=mouse.data$weight,y=mouse.data$size)

mouse.regression<-lm(data=mouse.data,size~weight)
abline(mouse.regression, col="blue")

summary(mouse.regression)
