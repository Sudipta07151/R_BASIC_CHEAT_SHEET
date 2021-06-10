library(dplyr)
library(rvest)
library(stringr)

link='https://www.imdb.com/search/title/?groups=top_250&sort=user_rating'
page_data<-read_html(link)

#str_trim()  removes all extra unwanter whitespaces and new line

name<-page_data%>%html_nodes('.lister-item-header a')%>%html_text()
genre<-page_data%>%html_nodes('.genre')%>%html_text()%>%str_trim()
ratings<-page_data%>%html_nodes('.ratings-imdb-rating strong')%>%html_text()
synopsis<-page_data%>%html_nodes('.ratings-bar+ .text-muted')%>%html_text()

movies.data<-data.frame(name,genre,ratings,synopsis)
View(movies.data)
write.csv(movies.data,'movies_data.csv')

#to find if its done
getwd()
list.files(pattern = '.csv')


