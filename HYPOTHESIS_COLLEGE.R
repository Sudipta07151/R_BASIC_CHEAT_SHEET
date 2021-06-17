#example 1-----------------------------

#a person tosses a coin 200 times 
#and obtains head 190 times.If it is claimed 
#that the coin is an unbaised one will it 
#be acceptable?

#H0: coin is unbaised p==0.5
#Ha: coin is biased[two tailed test] p!=0.5

#200-190=10 more heads out of 200

binom.test(10,200,
  conf.level=0.95,p=0.5,
  alternative = c("two.sided"))

#p is low null must go
#we reject the null hypothesis
#coin is biased

#example2-------------------------

#an existing model of a car is known for break 
#downs 1.4 times a year on an average. 
#The manufacturer intoduces an upgraded
#model and claims that the model is less likely to
#break down. To test the claim a data scientist
#selects 15 cars of the newly introduced model
#randomly and found 12 break downs in the lot in the first year.
#It is required to test the 
#validity of the manufacturer claim


#expected value of break down=1.4*15=21
#actual value of break down=12

#lambda=1.4
#h0: lambda>=1.4
#ha: lambda<1.4 [lower.tailed.test]

#expected number 
ppois(12,21,lower.tail = T)

#0.02<0.05 so, p is low null must go
#so we reject the null hypotheis

poisson.test(12)


#example 3

no_of_cases=c(41,15)
no_of_years=c(28011,19025)
poisson.test(no_of_cases,no_of_years)

#h0:no difference between exposed grp and 
#comparison grp

#ha:the exposed grp is more prone to cancer

#p is low null must go
#so we reject null hypotheis


#example 4--------------------

#test wheteher data set is normally distributed or not

id=c(1234,1239,2345,2956,2876,3122,2976,
     2765,2986,2786,4352,4976,2678,3279,1389)

age=c(19,20,19,21,22,21,19,20,19,21,20,21,20,21,23)

students=data.frame(id,age)

shapiro.test(students$age)
#as the pvalue is above 0.05 the data
#happens to form a normal population

sorted_students=students[order(students$age),]
shapiro.test(sorted_students$age)

hist(sorted_students$age)

#example 4-------------------------------

#the ceo of a large company claims that 90 percent oh his 
#2,500,000 customers are very satisfied with 
#the service they recieve. To test this claim the local 
#newspaper surveyed 1000 customers, using simple random 
#sampling. AMong the sampled customers , 73 percent
#say that they are very satisfied.

#ceo's hypothesis 90% of the customers are very 
#satisfied at alpha=0.05 or 95% conf.level

#H0:satified!=90%
#Ha:satisfied==90%[two tailed test]

# sd=p*(1-p)/n
s=(0.9*(1-0.9))/1000
s=sqrt(s)
s
#z= (p-P)/s
z=(0.73-0.90)/s
z
p=dnorm(z)

#as p is mush more less than 0.05 ,so we 
#reject the null hypothesis

CI1=(0.73+1.96)*(sqrt((0.73*0.27)/1000))
CI2=(0.73-1.96)*(sqrt((0.73*0.27)/1000))             
CI2


#a company wants to determine the average time to
#complete a certain job. The past records
#show that the sd of the completion for all workers in the company
# has beed 10 days and there is no reason to believe that this would
#have changed.

#however the company fells that because of the procedural
#changes, the mean would have changed. 
#Determine the sample size so that the company 
#may be 95% confident that the sample average 
#remains within 2 days of the population mean

sd=10 #of population
samp.mean=2 #of sample


#---------CORRELATION & REGRESSION--------

brand.name=c("k","b","bu","t","h",
             "c","m","ca","hy","ho","wh","sn",
             "bre","kno","kal","del") 
per.alcohol=c(8,7,6.5,4.6,5,4.5,4.6,
              5,7,4.9,4.9,67.5,4.8,8,7.8,8.5)

cal.released=c(395,250,212,149,155,159,162,
               153.7,249.75,179,177.95,2900,176,394,375,565)
df.beer=data.frame(brand.name,per.alcohol,cal.released)
str(df.beer)
#H0:rho<=0
#Ha:rho>0 [greater]

cor.test(df.beer$per.alcohol,df.beer$cal.released,
         alternative = "greater",conf.level = 0.95)


#p is low null must go
#so we reject null hypothesis

cor(df.beer$per.alcohol,df.beer$cal.released)
plot(df.beer$per.alcohol,df.beer$cal.released)
abline(lm(df.beer$cal.released~df.beer$per.alcohol))

model=lm(df.beer$cal.released~df.beer$per.alcohol)
summary(model)

#predict 
#it is required to find a 95% prediction interval for the number of
#calories when the alcohol content is 6.5% using a random sample
#taken from beers alcohol content an calories

alcohol.content=6.5
pred<-predict(model,newdata =data.frame(per.alcohol=alcohol.content),
        interval = "prediction",
        level=0.95)

pred        

#example 5-----------------------------
elevation<-c(7000,4000,6000,3000,7000,4500,
             5000)
temp<-c(50,60,48,70,55,55,60)

#is there enough evidence to show negative correlation
#between temp and elevation

model<-lm(temp~elevation)

#H0: rho>=0
#Ha: rho<0 [lesser]

cor.test(elevation,temp,conf.level =0.90,alternative = "less")
#p is low  p-value = 0.01285<0.05 null must go
#we reject null hypothesis

#-----------HYPOTHESIS TESTING OF SAMPLING DISTRIBUTION--------------

#let us consider a grocery store that sells
#packet of lays potato chips weighing 30gms each
#The company that makes the chips claims that the average weigh of a packet is 30gms.
#To test the validity of the claim, we collect
#10 such packets of chips and the weigh of each
#of the packets is noted down, the weights
#being 29,29.8,29.7,29.9,30,31,28.9,27.9,30.2,27.5
#show the testing of the company claim

#H0:mean>=30
#Ha:mean<30[lower.tail]

mu=30
sample=c(29,29.8,29.7,29.9,30,31,28.9,27.9,30.2,27.5)
sample.mean=mean(x=sample,mu=)

t.test(sample,mu=30,conf.level = 0.95,alternative = "less")

#p value p-value = 0.05264>0.05
#p is high null must fly
#so we fail to reject null hypothesis

#example 7--------------------------------------
#Expert Marketing Services reported that a typical Indian spends a mean of
#144 minutes (2.4 hours) per day accessing the Internet via a smart phone.
#To test the validity of this statement, we select a sample of 30 friends and
#family. The result for the time spent per day accessing the Internet via a
#smart phone (in minutes) are stored in Mobile net Time.csv file.
#It is required to determine whether there is any evidence that the popula-
#tions mean time spent per day accessing the Internet via a mobile device
#is different from 144 minutes. Use the p-value approach and a level of
#significance of 0.05. What assumption about the population distribution is
#needed to conduct the test?

net_use=c(1,2,3,4,5,6,7,8,9,10,11,
          12,13,14,15,16,17,18,19,20,21,22,
          23,24,25,26,27,28,29,30)

minutes_spent=c(28,76,79,145,123,25,30,56,30,80,90,95,86,89,67,125,122,235,280,560,365,320,65,70,85,120,210,220,300,290)

df<-data.frame(id=net_use,minutes_spent)
df

mu=144
n=30

#H0:mean==144
#Ha:mean!=144

#as population sd is not known so t_test else z_test

t.test(x=df$minutes_spent,mu=144,alternative ="two.sided" )

#p-value = 0.8309 >0.05
#p is high null must fly
#so we fail to reject null hypothesis
