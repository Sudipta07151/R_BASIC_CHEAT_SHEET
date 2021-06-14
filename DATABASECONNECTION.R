install.packages("DBI")
install.packages("RODBC")
install.packages("odbc")
library(DBI)
library(RODBC)
library(odbc)

#see all available tables
#SELECT table_name FROM user_tables;

myconn=odbcConnect("oracle",uid="hr",pwd="11101997")
stdata<-sqlFetch(myconn,"EMPLOYEES")
empdata<-sqlQuery(myconn,"select * from EMPLOYEES")
empdata
View(stdata)
#to remove na
stdata<-na.omit(stdata)
dbListFields()


#-------------------USING RMySQL------------------
install.packages("RMySQL")
library(RMySQL)

mydb=dbConnect(MySQL(),
               user="root",
               password='11101997',
               host="localhost",
               dbname="student")

dbListTables(mydb)
rs=dbGetQuery(mydb,"select * from studentlist;");

#n for fetching number of records
#n=-1 means all records
rs

re=dbGetQuery(mydb,"select ID,cfess-paid as DUES from studentlist;")
re

re=dbGetQuery(mydb,"insert into 
              studentlist(ID,course,cfess,paid)
              values 
              (3,'BCA',200000,100000),
              (4,'MCA',40000,12000)")

re=dbGetQuery(mydb,"select * from studentlist")
re

re=dbGetQuery(mydb,"select id from studentlist
              where paid>24000")
re

re=dbGetQuery(mydb,"select id from studentlist
              where course='BCA'")
re
