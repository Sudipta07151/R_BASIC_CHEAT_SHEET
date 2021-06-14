install.packages("babynames")
install.packages("sqldf")
library(sqldf)
library(babynames)
library(tm)
detach("package:RMySQL", unload=TRUE)


str(babynames)
data<-babynames
mtcarsData<-mtcars
View(data)
all_select<-sqldf("select * from babynames")
head(all_select)
#get all names from table with number of occurances
names<-matrix(all_select$name)
head(table(names))

#or we can use
name_count<-sqldf("select name,count(name) as times 
                  from babynames group by name")
print(name_count)
View(name_count)

#babyname count greater than 200 top 5 

two_hundred_count<-sqldf("select name,count(name) as times 
                  from babynames group by name 
                   having count(name)>200 ORDER BY count(name) DESC limit 5")

two_hundred_count

#sort names (first 20)

babyname.sorted=sqldf("select distinct name from babynames 
                      where ORDER BY name desc limit 20")
babyname.sorted


#---------------------EXAMPLE 2---------------#

library(readr)
orders<-read_csv('orders.csv')
products<-read_csv('products.csv')
View(orders)
View(products)
str(orders)
str(products)

#left_join 

items<-sqldf("SELECT * from orders o LEFT JOIN
      products p on o.`Item Name`=p.`Item Name` LIMIT 100" )
View(items)

