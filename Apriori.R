#ASSOCIATION RULE MINING WITH TITANIC DATASET

install.packages("arules")
library(tm)
library(arules)

data("Titanic")
data<-Titanic
str(data)
data<-data.frame(data)
raw.titanic=NULL

for(i in 1:4)
{
  raw.titanic=cbind(raw.titanic,
                    rep(as.character((data[,i]),data$Freq))
                    )
}

raw.titanic=as.data.frame(raw.titanic)
raw.titanic
names(raw.titanic)=names(data[1:4])
str(raw.titanic)

summary(raw.titanic)

#APPLYING APRIORI ALGORITHM
all.rules<-apriori(raw.titanic)

quality(all.rules)<-round(quality(all.rules),digits=3)
all.rules
arules::inspect(all.rules)
rhs<-c("Survived=No","Survived=Yes")
rules<-apriori(raw.titanic,control=list(verbose=F),
               parameter=list(minlen=2,supp=0.005,conf=0.8),
               appearance = list(rhs=c("Survived=No","Survived=Yes"),
                                 default="lhs"))
rules
quality(rules)<-round(quality(rules),digits = 3)
rules.sorted<-sort(rules,by="lift")
arules::inspect(rules.sorted)


#------------------REMOVE REDUNDANCY-------------

subset.matrix<-is.subset(rules.sorted)
subset.matrix[lower.tri(subset.matrix,diag-T)]=NA


#remove the redundant rules
rules.pruned=rules.sorted[!redundant]

arules::inspect(rules.pruned)

rules<-apriori(raw.titanic,parameter=list(minlen=3),
               supp=0.002,conf=0.8,
               appearance = list(rhs=c("Survived=Yes"),
                lhs=c("Class=1st","Class=2nd","Class=3rd","Age=Child",default="none"),))

#visualizing the association rules
install.packages("arulesViz")
library(arulesViz)
plot(all,rules)
plot(all.rules,method="graph")
