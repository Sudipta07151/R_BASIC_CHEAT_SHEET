a<-c(1,2,3,3)
is.numeric(a)
class(a)

b<-c(1,2,"a")
class(b)

d<-c(T,F,T,T)
d<-as.numeric(d)
d<-as.logical(d)
d


num<-c(1:10)
class(num)
num2<-c(num,2:20)
num2

num.d<-seq(1,10,by=4)
num.d
class(num.d)


#VECTOR
char.c<-letters[1:10]
char5<-char.c[1:5]
vec<-c(1:5)
names(vec)<-char5
vec
vec["a"]


s.height<-c(100,106,109,111,119,115)
mean(s.height)
summary(s.height)
airports<-c('DEL',"KOL",'NYC','DEL','DEL','DEN')
summary(airports)

#FACTORS

#nominal (no-order)
airports<-as.factor(airports)
summary(airports)
str(airports)


#ordinal data(ordered data)

birth.month<-c(month.abb[1:5],month.abb[2:7],month.abb[6:12])
birth.month.fact<-factor(birth.month,ordered=T,levels=month.abb)
summary(birth.month.fact)
table(birth.month.fact)

#LISTS

a<-c(1,4,6)
b<-c('Red','Green')
c<-"Welcome"
my.list=list(a,b,c)
my.list
summary(my.list)
names(my.list)<-c("x","y","z")
my.list$y[1]

#MATRIX

stu.hrs<-c(20,24,46,62,22,37,65)
stu.marks<-c(40,55,69,83,27,44,61)

stu.matrix<-matrix(stu.hrs)
stu.matrix<-c(stu.hrs,stu.marks)
stu.matrix<-as.matrix(stu.matrix)
stu.matrix<-matrix(stu.matrix,nrow=7)
stu.matrix
stu.data<-cbind(stu.hrs,stu.marks)
rownames(stu.data)<-c(1:7)
stu.data
stu.data[1,]
write.csv(stu.data,"stu.data.csv")

list.files(pattern=".csv")


#DATA_FRAME
stu.name<-c('Mr1','Mr2','Ms1','Mr3','Ms2','Mr3','Mr4')
stu.hrs<-c(20,23,13,24,11,10,8)
stu.marks<-c(40,55,67,42,56,87,67)
stu.male<-c(T,T,F,T,F,T,T)
stu.data<-data.frame(stu.name,stu.hrs,stu.marks,stu.male)
stu.data$stu.male<-factor(stu.data$stu.male)
str(stu.data)
summary(stu.data$stu.male)
summary(stu.data)
stu.data[2,]
stu.data[,4]
   