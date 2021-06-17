#TABLE SCRAPE

library(dplyr)
library(rvest)

link='https://www.patriotsoftware.com/blog/accounting/average-cost-living-by-state/'

page=read_html(link)

page_table=page%>%html_nodes('.wp-block-table')%>%
    html_table()%>%.[[1]]
View(page_table)


#as jquery is present we cant use above method

link2<-'https://en.wikipedia.org/wiki/List_of_apple_cultivars'

wiki_page=read_html(link2)
apple_table<-