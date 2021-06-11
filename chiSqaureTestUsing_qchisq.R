#A sample of 25 bottles was selected.
#The variance of these 25 bottles as 5cc.
#Has it increased from established 4cc?
#95% confidence level

#Ha: S^2>sigma^2
#H0: s^2<=sigma^2


#chi2=((n-1)pow(S,2))/pow(sigma,2)
calChisq=((25-1)*5)/(4)


#5% significance(or 95% confidence)
criticalValue=qchisq(p=0.05,df=24,lower.tail = F)

#so failed to reject null hypothesis

