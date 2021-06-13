library(BSDA)
library(readr)
data<-read_csv("PerfumeVolumes2.csv")
View(data)

#q)from two machines 100samples each were
#drawn Machine 1: mean=151.2 sd=2.1
#drawn Machine 1: mean=151.9 sd=2.2
#is there difference in 2 machines
#check at 95% conf level

#H0: mu1=mu2
#Ha: mu1!=mu2 [two tailed test]

#TWO SAMPLE z test
z.test(x=data$`Machine 1`,
       y=data$`Machine 2`,
       sigma.x=2.1,
       sigma.y=2.2,
       conf.level = 0.95,
       alternative = "two.sided"
       )

#p is low[p-value = 0.001272 <0.05] so null must go
#we reject null hypothesis

#-------two sample z test-----with different means------

#--------------------------------------------

#q)from two machines 100samples each were
#drawn Machine 1: mean=151.2 sd=2.1
#drawn Machine 1: mean=151.9 sd=2.2
#is there difference in 2 machines
#check at 95% conf level

#H0: mu1=mu2
#Ha: mu1!=mu2 [two tailed test]

#we put mu= -0.03 as the difference in mean

z.test(x=data$`Machine 1`,
       y=data$`Machine 2`,
       sigma.x=sd(data$`Machine 1`),
       sigma.y=sd(data$`Machine 2`),
       conf.level = 0.95,
       mu=-0.03,
       alternative = "greater"
)

# p is high so null fly
# p-value = 0.9998> 0.05
# we fail to reject null hypothesis
