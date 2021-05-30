mouse.data <- data.frame(
  size = c(1.4, 2.6, 1.0, 3.7, 5.5, 3.2, 3.0, 4.9, 6.3),
  weight = c(0.9, 1.8, 2.4, 3.5, 3.9, 4.4, 5.1, 5.6, 6.3),
  tail = c(0.7, 1.3, 0.7, 2.0, 3.6, 3.0, 2.9, 3.9, 4.0))

mouse.data

plot(x=mouse.data$size,y=mouse.data$weight,type="p")

simple.regression<-lm(size~weight,data=mouse.data)
abline(simple.regression)
summary(simple.regression)


plot(mouse.data)
multiple.regression<-lm(data=mouse.data,size~weight+tail)
summary(multiple.regression)
