library(datasets)
iris=iris
plot(iris)

summary(iris)
#detach("package:datasets",unload=TRUE) //clears all base packages
dev.off()

install.packages("pacman")
require(pacman)
pacman::p_load(pacman,lubridate,ggplot2,shiny,tidyr,stringr)

#p_unload(all) //clears all packages

head(iris)

plot(iris$Species)
plot(iris$Petal.Length)
plot(iris$Species,iris$Petal.Width)

plot(
     iris$Sepal.Length,iris$Petal.Width,
     col="#cc0000",
     pch=19, #for solid circle
     main="PETAL VS WIDTH",
     xlab="Petal Length",
     ylab="Petal Width"
) 

plot(
  dnorm,-3,+3,
  col="#ccc000",
  lwd=5, #line width
  main="Normal Distribution",
  xlab="z-scores",
  ylab="Density"
)

#BAR CHARTS

?mtcars
head(mtcars)  

cylinders<-table(mtcars$cyl)
barplot(cylinders)
plot(cylinders)
dev.off()

#HISTOGRAM

head(iris)
summary(iris)
hist(iris$Sepal.Length)
hist(iris$Sepal.Width)
hist(iris$Petal.Length)


#HISTOGRAM BY GROUPS

#PUT GRAPHS IN 3 ROWS AND 1 COLUMN
par(mfrow=c(3,1)) # c(no of rows, no of columns) 

hist(
  iris$Petal.Width[iris$Species=="setosa"],
  xlim=c(0,3),
  xlab = "",
  breaks=9
)

hist(
  iris$Petal.Width[iris$Species=="versicolor"],
  xlim=c(0,3),
  xlab = "",
  breaks=9
)

hist(
  iris$Petal.Width[iris$Species=="virginica"],
  xlim=c(0,3),
  xlab = "",
  breaks=9
)

rowSpe=iris$Sepal.Length[iris$Species=="setosa"]
#selecting sepal length where row is setosa

par(mfrow=c(1,1))


#PLOTS

#X-Y PLOTS

plot(mtcars$wt,mtcars$mpg)


#ADD OPTIONS

plot(mtcars$wt,mtcars$mpg,
     pch=19, #solid cirlce 
     cex=1.5,# make 150% size
     col="#cc0000",# RED
     main="MPG as a Func of Weight Of Cars",
     xlab="Weight",
     ylab="MPG"
)

 
#OVERLAYING PLOTS(ONE PLOT OVER ANOTHER)

head(lynx)
hist(lynx)
#View(lynx)

hist(
  lynx,
  breaks=15,
  freq=FALSE,
  main="HISTOGRAM",
  col="yellow",
  xlab="Number Of Lynx Trapped"
)

#ADD A OVERLAYING PLOT
#here normal distribution

curve(
  dnorm(x,mean=mean(lynx),sd=sd(lynx)),
  col="red", 
  lwd=2,
  add=TRUE
)

#?dnorm

#ADD TWO KERNEL DENSITY ESTIMATORS

lines(density(lynx),col="blue",lwd=2)


#SUMMARY

summary(iris$Species)
summary(iris$Sepal.Length)

summary(iris)

#PACKAGE

pacman::p_load(psych)
#p_help(psych,web=F)
describe(iris$Petal.Length)
describe(iris)

hist(iris$Sepal.Length[iris$Species=='versicolor'])
hist(iris$Sepal.Width[iris$Species=='versicolor'])

#LOGICAL QUERIES
hist(iris$Sepal.Width[iris$Species=="versicolor" & iris$Sepal.Width>2])
head(iris)
setosa.data<-iris[iris$Species=='setosa',]
setosa.data
hist(setosa.data$Sepal.Length)
summary(setosa.data)


#-----------DATA TYPES-------------

#VECTOR 

v1<-c(1,4,5,6,2)
v1
v2<-rep(c(2,3),3)
v2
v3<-letters
v3




#ARRAY
#give data, then dimensions (rows,col,tables)
a1<-array(c(1:24),c(4,3,2))
a1

#LIST
a<-c("a","b","c")
b<-c(1,2,3)
c<-c(F,F,F)

l1=list(a,b,c)
l1
l2=list(a,b,c,l1)
l2

#MATRIX

m1=matrix(c(1,2,3,4,5,6,7,8),nrow=4,byrow=T)
m1
m1[2,2]
  

#DATA_FRAME

vNum=c(1,2,3)
vChar=letters[1:3]
vLog=c(T,T,F)

#converts everything into character
df1<-cbind(vNum,vChar,vLog)
df1

df2<-as.data.frame(cbind(vNum,vChar,vLog))
df2

#Goes to least restrictive data type

(coerce<-c(1,"b",T))
as.numeric(c("1","2","3"))


mat=matrix(c(1:9),byrow = T,nrow=3)
mat 

mat_to_df<-as.data.frame(mat)
mat_to_df
typeof(mat_to_df)
is.data.frame(mat_to_df)
mat_to_df$V1


#-----------FACTORS--------------

x1<-1:3
x1
y1<-1:9

df2<-data.frame(cbind(x1,y1))
df2

x2<-as.factor(c(1:3))
x2
df3<-cbind.data.frame(x2,y1)
df3
typeof(df3)
str(df3)

x4<-c(1:3)
df4<-cbind.data.frame(x4,y1)
df4$x4<-factor(
              df4$x4,
              levels = c(1,2,3),
              labels=c("IOS","WINDOWS","ANDROID"))
df4

x5<-c(1,2,3)
df5<-cbind.data.frame(x5,y1)
df5$x5<-factor(
  df5$x5,
  levels=c(2,1,3),
  labels=c("No","Maybe","Yes")
)
df5

#getting a particular factor

data.no=df5[df5$x5=="Yes",]
data.no


#ASSIGN DATA 

num<-1:10
num
num<-10:1
num

#seq

num<-seq(30,0,by=-3)
num

#c

num<-c(1,10,43,231,112)
num


#rep

num<-rep(c(1,7),5)
num

num<-rep(c(T,F),each=5)
num

#scan

x6<-scan()
x6=sum(x6)
x6
#or
x6<-scan(n=3)
x6


#importing data
install.packages("rio")
library(rio)
#CSV FILE
rio_csv<-import('C:/Users/SUDIPTA ADAK/Desktop/drive-download-20210518T084044Z-001/ImportingData_Datasets/mbb.csv')
rio_csv
head(rio_csv)

#TEXT FILE
rio_text<-import('C:/Users/SUDIPTA ADAK/Desktop/drive-download-20210518T084044Z-001/ImportingData_Datasets/mbb.txt')
rio_text

#XLS FILE
rio_xls<-import('C:/Users/SUDIPTA ADAK/Desktop/drive-download-20210518T084044Z-001/ImportingData_Datasets/mbb.xlsx')
rio_xls
rio_xls["Mozart"]

vaccine_data<-import('C:/Users/SUDIPTA ADAK/Desktop/drive-download-20210518T084044Z-001/vaccination_tweets.csv')
head(vaccine_data)
summary(vaccine_data)
vaccine_data$hashtags

head(mtcars)
mtcars_new<-mtcars[,c(1:4,6:7,9:11)]
mtcars_new

hc<-mtcars_new%>%dist%>%hclust
plot(hc)


cars_n<-mtcars[,c(1:4,6:7,9:11)]
pc<-prcomp(cars_n,center=TRUE,scale=TRUE)
pc

summary(pc)
plot(pc)

predict(pc)%>%round(2)

biplot(pc)


#REGRESSION


?USJudgeRatings
head(USJudgeRatings)
j_data<-USJudgeRatings
x<-as.matrix(j_data[-12])
m_data
y<-j_data[,12]
y


#REGRRSION WITH SIMULTANEOUS ENTRY

reg1<-lm(y~x)
reg1
summary(reg1)
coef(reg1)
confint(reg1)
resid(reg1)
hist(residuals(reg1))
