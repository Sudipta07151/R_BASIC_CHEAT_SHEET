#----------paired t test----------

bp.before=c(120,122,143,100,109)
bp.after=c(122,120,141,109,109)

bp.df<-data.frame(bp.before,bp.after)
row.names(bp.df)<-c("p1","p2","p3","p4","p5")

View(bp.df)

t.test(x=bp.df$bp.before,y=bp.df$bp.after,
       paired=T,conf.level = 0.95)

#H0:after=before
#H0:after!=before

#p is high null must fly
#p-value = 0.5302 >0.05
#so we fail to reject null hypothesis

#plot
bp.diff=bp.df$bp.before-bp.df$bp.after
bp.diff
boxplot(bp.diff)
