load("./r_code/dados/resulteadi001.Rda")
resulteadi <-result
load("./r_code/dados/resulteuler10k001.Rda")
resulteuler <-result
load("./r_code/dados/resultkj001.Rda")
resultkj <-result
load("./r_code/dados/eaBK1000.Rda")
resulteabkj <-result2
rm(result)
 
cfhest = c(14.176)
par(mfrow= c(4,1), oma=c(0,0,0,0), mar=c(3,4,1,2))
hist(resulteuler, breaks = 100, main = "", col = "grey", las=1, xlab = "Euler")
abline(v=cfhest, col='red')
box()
mtext("Euler", cex = 0.6)
hist(resultkj, breaks = 100, main = "", col = "grey", las=1, xlab = "KJ", cex = 0.6)
abline(v=cfhest, col='red')
box()
mtext("KJ", cex = 0.6)
hist(resulteadi, breaks = 100, main = "", col = "grey", las=1, xlab = "EA-DI")
abline(v=cfhest, col='red')
box()
mtext("EA-DI", cex = 0.6)
hist(resulteabkj, breaks = 100, main = "", col = "grey", las=1, xlab = "EA-BK")
abline(v=cfhest, col='red')
box()
mtext("EA-BK", cex = 0.6)
