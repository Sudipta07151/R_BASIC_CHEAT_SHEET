getwd()

#data<-readLines("game.txt")

#collapse= to make all lines merge to one
data<-paste(readLines("game.txt"),collapse =" ")
data

#without collapse 5 words
vecData<-c("Hello","I","am","Sudipta")

#collapsing makes it into one sentence
vecData<-paste(vecData,collapse =" ")
vecData


#gsub(pattern="\\W",replace=" ",applyData)
#\\w ->look for spaces and punctuations
data<-gsub(pattern="\\W",replace =" ",data)
data

#remove numbers from data(remove digits)
data<-gsub(pattern="\\d",replace="",data)
data

#lowercase everything
data<-tolower(data)
data

#install package for TEXT MINING 
#tm

install.packages("tm")
library(tm)

#remove stopwards [add,the,or,that,etc]

#removeWords(data,c("and","or)) ->i.e to remove your word choice

#or use stopwords to remove every stopwords present in the data
data<-removeWords(data,stopwords())

#remove single letters
data<-gsub(pattern ="\\b[A-z]\\b{1}",replace=" ",data)
data

#clean extra spaces between
data<-stripWhitespace(data)
data

#to extends R capability to work with string 
install.packages("stringr")
#create wordcloud
install.packages("wordcloud2")
library(wordcloud2) 
library(stringr)

#to split a sentence to words

# "\\+s"  -> for any no of spaces (1 or more spaces in between)
split.data=str_split(vecData,pattern="\\s+")
str(split.data)

#now split the whole text(data)

split.text=str_split(data,pattern = "\\s+")
split.text

#to check type
str(split.text)

split.text<-unlist(split.text)
str(split.text)

#read in positive and negative lexicons

positive.data<-readLines("positive.txt")
negative.data<-readLines("negative.txt")

#GET NO OF POSTIVE TERMS
pos.term<-sum(!is.na(match(split.text,positive.data)))

#GET NO OF NEGATIVE TERMS
neg.term<-sum(!is.na(match(split.text,negative.data)))

net.result<-pos.term-neg.term
wordcloud(split.text,min.freq=20,max.words = Inf,color=rainbow(3),random.order=FALSE)
