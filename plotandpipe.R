install.packages("statsr")

library(dplyr)
library(ggplot2)
library(statsr)


dataA<-arbuthnot
data
dataA$boys

ggplot(data=dataA,aes(x=boys,y=girls))+geom_point()

dataA<-arbuthnot%>%mutate(total=boys+girls)
dataA


ggplot(data=dataA,aes(x=year,y=total))+geom_point()
ggplot(data=dataA,aes(x=year,y=total))+geom_line()
ggplot(data=dataA,aes(x=year,y=total))+geom_line()+geom_point()

greaterBoys<-dataA[dataA$boys>dataA$girls,]
greaterBoys

gBoys<-dataA%>%mutate(more_boys=boys>girls)
gBoys

#second dataset

dataB<-present
dataB

mean(dataA$boys)

#cal.proportion

boys_prop<-dataB$boys/(dataB$boys+dataB$girls)
boys_prop
?plot()

plot(x=dataB$year,y=boys_prop,type="l",ylim=c(0.5,0.53))
plot(x=dataB$year,y=dataB$girls,type="l",xlab="year",ylab="girls",main="year-girls",col="red")
ggplot(data=dataB,aes(x=year,y=girls))+geom_line()




#ASSIGNMENT
View(dataB)

dataB<-dataB%>%mutate(total_birth=dataB$boys+dataB$girls)
dataB
dataB<-dataB%>%mutate(prop_boys=(dataB$boys/dataB$total_birth))
dataB

#PLOT
plot(x=dataB$year,y=dataB$prop_boys,type="l")
#GGPLOT
ggplot(dataB,aes(year,prop_boys))+geom_line()


#ASSIGNMENT 2

dataB<-dataB%>%mutate(prop_boys_to_girls=dataB$boys/dataB$girls)
View(dataB)

plot(y=dataB$year,x=dataB$prop_boys_to_girls,type="b")
plot


#3rd dataset

dataC<-kobe_basket
View(dataC)
streak<-calc_streak(dataC$shot)
ggplot(data=dataC,aes(x=quater))+geom_histogram(binwidth =1)


#simulations in R

coin_outcomes<-c("heads","tails")
sample(coin_outcomes,size=1,replace=TRUE)
sim_fair_coin<-sample(coin_outcomes,size=10,replace=TRUE)
sim_fair_coin

#unfair simulation

sim_unfair_coin<-sample(coin_outcomes,size=10,replace=TRUE,prob=c(0.3,0.7))
sim_unfair_coin
table(sim_unfair_coin)


#ludo sampling

dice_outcomes<-c(1,2,3,4,5,6)
sim_outcomes<-sample(dice_outcomes,size=10,replace=TRUE)
sim_outcomes

#DATA4

dataE<-nycflights
dataE
ggplot(data=dataE,aes(x=dep_delay))+geom_histogram(binwidth=10)

new_filtered_flights<-dataE%>%filter(dest=="RDU")
View(new_filtered_flights)

ggplot(data=new_filtered_flights,aes(x=dep_delay))+geom_histogram(bins=200)

summary(dataE)
summarise(dataE)

dataE%>%summarise(mean_dd=mean(dep_delay),sd_dd=sd(dep_delay),n=n())
dataE

dateF<-nycflights
View(nycflights)
feb_flights<-dataE%>%filter(origin=="LGA",month==2)
View(feb_flights)
