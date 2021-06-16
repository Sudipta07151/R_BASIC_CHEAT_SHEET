#multiple linear regression

vehicle<-read.csv("vehicle.csv")
head(vehicle)
str(vehicle)

#plot to see correlations
library(GGally)
pairs(vehicle[3:5])
ggpairs(vehicle[3:5])

#multiple linear regression
result<-lm(lc~Mileage+lh,data=vehicle)
result

#lc=1.375-0.0000875+73.55 lh

summary(result)
#mileage has no stars so it is not at all significant
#whereas lm is significant(with 3 stars)

#reduced model by removing mileage as 
#it is not significant
model<-lm(lc~lh,data=vehicle)

#predict at 95%(default) conf level

#level=0.90 makes it to 90% conf interval
pred<-predict(model,data.frame(lh=10),
              interval="confidence",
              level=0.90)
summary(pred)
