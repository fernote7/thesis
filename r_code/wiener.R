set.seed(10)
homo.wiener <- array(0, c(1000, 1))

t <- 0:1000  # time
sig2 <- 0.01
## first, simulate a set of random deviates
x <- rnorm(n = length(t) - 1, sd = sqrt(sig2))
## now compute their cumulative sum
homo.wiener <- c(0, cumsum(x))


matplot( homo.wiener, axes = FALSE,
         type = "l", col = rgb(.1,.1,.1,.6),
         ylim=c(min(homo.wiener),max(homo.wiener)), ylab = expression("W"[t]),
         xaxs="i", xlim = c(0,1000), xlab = "time")
axis(side = 1, las=1, at = c(0,200,400,600,800,1000), labels = c("0","20","40","60","80","100"))
axis(side = 2, las=1)

grid()
box()


