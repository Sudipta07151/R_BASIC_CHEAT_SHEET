#POISSON DISTRIBUTION

#the experiment results in outcomes that can be 
#classified as successes or failures

#the average number of successess that occur in 
#a region in a specified region is known

#outcomes are random.Occurance of one outcome does 
#not influence the chance of 
#another outcome of interest

#the outcomes of interest are rare 
#relative to the possible outcomes

#IMPORTANT
#mean and variance is equal

#on a booking counter on the average 3.6 people come
#every 10 minutes on weekends.What is 
#the probability of getting 7 people in 10 minutes

#time(length etc, units) should be made same
#here(10 minutes)


#lambda =3.6 (occurance in a given time interval[here 10min])
mu=3.6
x=7

#what is the probability of 
#getting 7 people in 10 minutes

#getting the height (direct) ----dpois()
dpois(7,3.6) 

#ppois() gives prob to the left

#prob 7 or less
ppois(7,3.6,lower.tail = T)

#exaclty 7 people
#lower.tail= less than or equal to
ppois(7,3.6)-ppois(6,3.6)

#60% probability
qpois(0.6,3.6)


