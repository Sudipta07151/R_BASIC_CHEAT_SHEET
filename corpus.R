library(tm)
library(wordcloud2)
install.packages("RColorBrewer")
library(RColorBrewer)
#to show all txt files in a folder
list.files(path=getwd(),pattern="*.txt")

monkey.data<-paste(readLines('monkeysPaw.txt'),collapse =" ")
onesummer.data<-paste(readLines('oneSummer.txt'),collapse =" ")
bodySnatcher.data<-paste(readLines('bodySnatcher.txt'),collapse =" ")


#clean data 
#from punctuations and spaces
monkey.data

listAllData=as.list(c(monkey.data,onesummer.data,bodySnatcher.data))
listAllData


#for doing individually
#monkey.data<-gsub(monkey.data,pattern="\\W",replace=" ") 
#monkey.data

data<-lapply(listAllData,FUN=gsub,pattern="\\W",replace=" ")
data<-lapply(data,FUN=gsub,pattern="\\d",replace=" ")
data<-tolower(data)

#remove stopwords
data<-removeWords(data,stopwords("english"))

#remove spaces and single letter words
data<-gsub(data,pattern="\\b[A-z]\\b{1}",replace=" ")
data

#remove spaces
data<-stripWhitespace(data)
data<-paste(data,collapse = " ")
data
wordcloud(data,min.freq =1,max.words=Inf,scale=c(1,1),random.order =F)
?wordcloud
