cfhest = c(14.176)
euler = c(15.00167, 14.26577, 14.19202)
kj = c(14.56955, 13.86159, 14.14824)
ea_bk = c(14.71165, 14.44851,14.20904)
ea_mod = c(14.5106, 14.31572, 14.21126)
options("scipen"=100, "digits"=4, xtable.comment = FALSE)
result1 <- data.frame("Simulations" = c("1,000", "10,000", "100,000"),
                      "Euler" = euler, "Kahl" = kj, "EA_BK" = ea_bk, 
                      "EA_mod" = ea_mod, row.names = NULL)



plot(result1[,2], lty = 1, pch = 1, type='b', axes=F, xlab = 'Simulations', 
     ylab = 'Option value', col='blue', cex=0.5, ylim = c(min(result1[,2:5]), 
                                              max(result1[,2:5])))
lines(result1[,3], lty = 2, pch = 1, type='b', col='red', cex = 0.5)
lines(result1[,4], lty = 3, pch = 1, type='b', col='darkgreen', cex = 0.5)
lines(result1[,5], lty = 4, pch = 1, type='b', col='brown', cex = 0.5)
abline(h=cfhest)


axis(side = 1, at = c(1,2,3), labels = result1[,1])
axis(side = 2, las=1)
box()
leg.txt = c("euler", "kj", "ea-bk", "ea-di")
legend("topright", leg.txt,col=c("blue", "red", "darkgreen", "brown"),
       lwd=c(1,1,1,1),lty=c(1,2,3,4), pch = c(1,1,1,1), seg.len=c(3,3,3,3),
       bty="n", cex = 0.5, ncol = 2)
text(x = 1.15, y = 14.25, "True option price", cex=0.5)
