#DISCRETE 
#BINOMIAL PROBABILITY THEOREM

#Fixed number of trials
#for each trial there are two possible outcomes
#probability of success remains same for all trials
#trials are independent of each other
#probability of x(no of success is n trails)

#random binom generation

#10 random generation-----rbinom()
#coin 1 
#chance of success(getting head)
rbinom(10,1,0.5)


#10 times(trials)
#10 coins
#prob of getting head
rbinom(10,10,0.5)



#pbinom() from finding probability
#probibility of 5 or less no of heads

#q=5 or less no of heads
#size=10 (10 coins)
#prob of head =0.5

pbinom(5,10,0.5)

#exaclty 5 heads

pbinom(5,10,0.5)-pbinom(4,10,0.5)

#probability of head in single coin flip

pbinom(1,1,0.5)

#probability of head in 10 coin flip

1-pbinom(1,10,0.5)

#probability of 5 heads or less when 
#coin flipped for 10 times

pbinom(5,10,0.5)


#given probability find sucesses qbinom()
#find prob of 50% success of getting heads form 10 coin trials
#probability of 50% success or 0.5
#10 coins
#prob of head 0.5

qbinom(0.5,10,0.5)


# height of a particular value of success ---dbinom()

#probability of 5 head in 10 coin flip 
dbinom(5,10,prob=0.5)

#probability of head in single coin flip
dbinom(1,1,0.5)
