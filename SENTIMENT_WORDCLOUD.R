#fetch data
tweet_data<-read.csv("apple.csv")
str(tweet_data)

#BUILD CORPUS
library(tm)

corpus<-iconv(tweet_data$text,to="UTF-8")

#EACH INDIVIDUAL TWEET WILL BE 
#TREATED AS DOCUMENT

corpus<-Corpus(VectorSource(corpus))
corpus

#INSPECT CORPUS
inspect(corpus[1:5])

#CLEAN DATA/TEXT

#------------functions used--------
#tolower
#removePunctuation
#removeNumbers
#stripWhitespace
#------------functions used--------

#convert to lowercase
corpus<-tm_map(corpus,tolower)
inspect(corpus[1:5])

#remove punctuations
corpus<-tm_map(corpus,removePunctuation)
inspect(corpus[1:5])

#remove numbers/digits
corpus<-tm_map(corpus,removeNumbers)
inspect(corpus[1:5])

#remove stopwords
corpus<-tm_map(corpus,removeWords,stopwords("english"))
corpus<-tm_map(corpus,removeWords,stopwords("SMART"))
inspect(corpus[1:5])

#remove https
removeURL<-function(text){
  gsub('https[[:alnum:]]*','',text)
}

removeHash<-function(text){
  gsub('\\*','',text)
}

corpus<-tm_map(corpus,content_transformer(removeURL))
inspect(corpus[1:5])

corpus<-tm_map(corpus,content_transformer(removeHash))
inspect(corpus[1:5])

#remove our own user defined words we want
corpus<-tm_map(corpus,removeWords,c('aapl','apple'))

#remove whitespaces
corpus<-tm_map(corpus,stripWhitespace)
inspect(corpus[1:5])

#ASSIGNING TO A NEW VARIABLE
cleanset<-corpus

#TERM DOCUMENT MATRIX
tdm<-TermDocumentMatrix(cleanset)
tdm
tdm<-as.matrix(tdm)
tdm[1:10,1:20]

#FIND HOW OFTER EACH WORD OCCURS IN DOCUMENT

#FIND WORD COUNT GRATER THAN 25
wordCount<-rowSums(tdm)
wordCountGreaterThan25<-subset(wordCount,wordCount>=25)
wordCountGreaterThan25

#BARPLOT
barplot(wordCountGreaterThan25,
        las=2,
        col=rainbow(50))

#WORDCLOUD
library(wordcloud)
set.seed(222)
wordcloud(words=names(wordCount),
          freq=wordCount,
          max.words=150,
          random.order = F,
          min.freq=5,
          colors=brewer.pal(8,'Dark2'),
          scale=c(5,0.3),
          rot.pre=0.4)

#WORDCLOUD2
library(wordcloud2)

wordcount.df<-data.frame(names(wordCount),wordCount)
View(wordcount.df)

#DIFF SHAPE
wordcloud2(wordcount.df,size=0.8,shape='circle')

wordcloud2(wordcount.df,size=0.8,shape='star')

#LETTER CLOUD
letterCloud(wordcount.df,
            word="apple",
            size=2)

#--------SENTIMENT ANALYSIS--------#

library(syuzhet)
library(lubridate)
library(ggplot2)
library(scales)
library(reshape2)
library(dplyr)

tweets<-read.csv("apple.csv")
tweets<-iconv(tweet_data$text,to="UTF-8")

s<-get_nrc_sentiment(tweets)
print(s)

#BARPLOT
barplot(colSums(s),las=2,ylab='Count',col=rainbow(10))
