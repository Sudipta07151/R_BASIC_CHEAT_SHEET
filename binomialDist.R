#BINOMIAL PROBABILITY DISTRIBUTION

install.packages("visualize")
library(visualize)
#probability of head -----in single coin flip
probability=1/2
success=5
trials=10

#probability of getting 5 heads or less
visualize.binom(stat = success,size=trials,prob=probability)

#probability of head in single coin flip(1 coin 10 time)
rbinom(10,1,0.5)

#probability of head in 10 coin coin flip
rbinom(10,10,0.5)

#5 heads or less in 10 trials
pbinom(5,10,0.5,lower.tail=FALSE)
#5 or less head , 10 trials , probability of head(in H & T), lower.tail=FALSE for 5 or greater
#lower.tail=TRUE for 5 or less


#getting exactly 5 heads
pbinom(5,10,0.5)-pbinom(4,10,0.5)


#in qbinom() we give probability and get quantile value(we will get the no of successes)
qbinom(0.5,10,0.5)

#dbinom() will give the height of a particular value iof success
#get probability of exactly 5 heads
dbinom(5,10,0.5)
