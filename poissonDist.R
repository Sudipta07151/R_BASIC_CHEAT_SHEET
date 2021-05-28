#POISSON PROBABILITY DISTRIBUTION

#on a booking counter, on the average 3.6 people coming every 10 minutes on weekend.
#what is the probability of getting 7 people in 10 minutes

dpois(x=7,lambda=3.6)

#gives probability to the left
#7 people or less
ppois(q=7,lambda=3.6)
#6people or below
ppois(q=6,lambda=3.6)

#excatly 7 people
ppois(q=7,lambda=3.6)-ppois(q=6,lambda=3.6)
