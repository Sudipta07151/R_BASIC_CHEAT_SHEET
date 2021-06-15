#SCATTER PLOT

a<-c(10,13,14,10,12,17)
b<-c(15,17,19,13,13,19)

#REFINE SCATTER PLOT
plot(a,b,col=rainbow(2),main="a vs b",xlab="a",ylab="b")
#regression line
abline(lm(b~a))

#data nycflights13

install.packages("nycflights13")
library(nycflights13)

flights<-nycflights13::flights
View(flights)
head(flights)     
attach(flights)

fit<-lm(dep_delay~arr_delay)
summary(fit)
cor(arr_delay,dep_delay)
#see if arrival delay affects departure
plot(arr_delay,dep_delay)
abline(fit,col="red")
#another line with 0 slope 200 intercept
abline(0,200)


#change the plot characteristics
#pch=
#1 circle
#2 triangle
#3 plus
#4 cross
#5 diamond
#6 reverse triangle
#7 box and crossed

plot(arr_delay,dep_delay,
     pch=3)
abline(fit,col="red")

#or we can give any character

#plot(arr_delay,dep_delay,
#pch="s")
#abline(fit,col="red")


#filter data
plot(arr_delay[carrier=='UA'],dep_delay[carrier=='UA'],pch=3,col="Red")
points(arr_delay[carrier=='AA'],dep_delay[carrier=='AA'],pch=2,col="Blue")

#TWO PLOTS ON ONE PAGE [same scale ,side by side]

par(mfrow=c(2,2))

plot(arr_delay[carrier=='UA'],dep_delay[carrier=='UA'],
     pch=3,col="Red",main="UA",
     xlim=c(0,1000),ylim=c(0,1000)
)

plot(arr_delay[carrier=='AA'],dep_delay[carrier=='AA'],
     pch=2,col="Blue",main="AA",
     xlim=c(0,1000),ylim=c(0,1000)
     )

#clean plots
dev.off() 

par(mfrow=c(1,1))

#ADDING TEXT TO PLOT
plot(arr_delay[carrier=='UA'],dep_delay[carrier=='UA'],
     pch=3,col="Red",main="ARRIVAL VS DEPARTURE UA",
     xlim=c(0,1000),ylim=c(0,1000),
)

#inside graph text
text(x=100,y=100,label="United Airways")
text(x=400,y=0,adj=1,label="Sandeep")

#outside box text
mtext("UNITED AIRWAYS",side=3)
mtext("minutes",side=2,adj=1)

#abline horizontal lines
abline(h=250)
#abline vertival lines
abline(v=250)

#COLOR & TEXT ATTRIBUTES

plot(arr_delay[carrier=='UA'],dep_delay[carrier=='UA'],
     cex=0.5,col="blue",pch=6,
     main="UA vs AA",
     col.main="magenta",col.lab="green",font.lab=4)
 
points(arr_delay[carrier=='AA'],dep_delay[carrier=='AA'],
     cex=0.5,col="yellow",pch=3)

#------MULTIPLE PAIRS OF SCATTER GRAMS-------

pairs(~arr_delay+dep_delay)
pairs(~arr_delay+dep_delay+distance+air_time)

dev.off()

#TIME SERIES PLOTS
#?data()
wdata<-weather
str(wdata)
plot(wdata$temp,type="l")


#HISTOGRAMS
hist(distance)

#change num of bars
hist(distance,breaks=10)
hist(distance[carrier=="UA"])


#BOX AND WHISKER PLOT

boxplot(distance)
boxplot(distance[carrier=='UA'])

#box and whisker plot of all airlines
boxplot(distance~carrier)
