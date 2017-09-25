set.seed(1)

X=Sim.DiffProc::GBM(N = 1000, M = 100, t0 = 0, T = 1)

  matplot(X, axes = FALSE,
           type = "l", col = rgb(.1,.1,.1,.6),
           ylim=c(min(X),max(X)), ylab = expression("GBM"),
           xaxs="i", xlim = c(0,1000), xlab = "time")
  axis(side = 1, las=1, at = c(0,200,400,600,800,1000), labels = c("0","20","40","60","80","100"))
  axis(side = 2, las=1)

  grid()
  box()


# GBMdrift<-function(x,mu=0.3) {mu*x}
# GBMvol<-function(x,sigma=0.2) {sigma*x}
# 
# Tmax<-10
# Nsim<-1000
# dt<-Tmax/Nsim
# tvector<-dt*0:Nsim
# dW<-sqrt(dt)*rnorm(Nsim)
# 
# X<-0:Nsim
# X[1]<-1  	#vectors in R are unit-offset
# 
# 
# 
# 
# 
#   
#   for(i in 1:Nsim) {
#     X[i+1]<-X[i]+GBMdrift(X[i],mu=0.15)*dt+GBMvol(X[i],sigma=0.2)*dW[i]
#   }
# 
#  
#   matplot(X, axes = FALSE,
#            type = "l", col = rgb(.1,.1,.1,.6),
#            ylim=c(min(X),max(X)), ylab = expression("GBM"),
#            xaxs="i", xlim = c(0,1000), xlab = "time")
#   axis(side = 1, las=1, at = c(0,200,400,600,800,1000), labels = c("0","20","40","60","80","100"))
#   axis(side = 2, las=1)
#   
#   grid()
#   box()
