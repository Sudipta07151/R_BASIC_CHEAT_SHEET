library(dplyr)
library(rvest)
library(tm)

link='https://www.imdb.com/search/title/?title_type=feature&sort=num_votes,desc'

html<-read_html(link)
nodes<-html_nodes(html,'.lister-item-header a')
name<-html_text(nodes)
nodes<-html_nodes(html,'.text-muted.unbold')
year<-html_text(nodes)
synopsis<-html%>%html_nodes(".ratings-bar+ .text-muted")%>%html_text()
rating<-html%>%html_nodes(".ratings-imdb-rating")%>%html_text()

#the (.) in paste is important 
movie_links<-html%>%html_nodes('.lister-item-header a')%>%
  html_attr("href")%>%gsub("\\?.*","fullcredits/?ref_=tt_cl_sm")%>%
  paste('https://www.imdb.com',.,sep="")

#get_cast=function(movie_link){
  #movie_page=read_html(movie_link)
  #movie_cast=movie_page%>%
    #return(movie_link)
#}
#cast=sapply(movie_links,FUN=get_cast)


#removed puctuations
year<-removePunctuation(year)
year

movies<-data.frame(name,year,synopsis,rating,
                   stringAsFactors=F)
View(movies)
str(movies)


fullcredits/?ref_=tt_cl_sm