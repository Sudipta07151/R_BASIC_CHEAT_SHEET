install.packages("wordcloud2")
install.packages("tm")
install.packages("dplyr")
install.packages("rio")
install.packages("readr")
install.packages("wordcloud")
library(wordcloud2)
library(tm)
library(dplyr)
library(rio)
library(readr)
library(wordcloud)

#importing file
#medium_csv=import("medium_data.csv")

medium_csv=read_csv("medium_data.csv")
medium_csv
View(medium_csv)


#using wordcloud as comparison tool
#filter data(by publication or by any column)

medium_csv<-medium_csv%>%filter(publication=="UX Collective")

#medium_csv<-medium_csv%>%filter(publication=="Towards Data Science")



#to remove html tags (using gsub)
removeHTML <- function(htmlString) {
  return(gsub("<.*?>", "", htmlString))
}


#creating corpus 
medium.corpus=Corpus(VectorSource(medium_csv$title))
medium.corpus

#cleaning data
#remove htmlTags(user defined function)
#remove whitespace
#remoce punctuation,letters,stopwords

medium.corpus=medium.corpus%>%
  tm_map(content_transformer(removeHTML))%>%
  tm_map(removeNumbers)%>%
  tm_map(removePunctuation)%>%
  tm_map(stripWhitespace)%>%
  tm_map(content_transformer(tolower))%>%
  tm_map(removeWords,stopwords("english"))%>%
  tm_map(removeWords,stopwords("SMART"))

  


#create term document matrix(tdm) 
#a matrix in which
#row->represent words
#column-> represent document
#cell->represent freq of words 

#to convert to R matrix
tdm=TermDocumentMatrix(medium.corpus)%>%
  as.matrix()

View(tdm)

#to get the sum of all thw words from all documets(or lines)
#each line in vector is treated as document
words=sort(rowSums(tdm),decreasing = T)

df=data.frame(word=names(words),freq=words)
View(df)

#some more cleaning

df<-df%>%filter(nchar(as.character(word))>2)
View(df)

#crete worlcloud

?wordcloud2()
wordcloud2(df)



