load("./r_code/dados/resulteadi10k.Rda")
resulteadi <-result
load("./r_code/dados/resulteuler10k.Rda")
resulteuler <-result
load("./r_code/dados/resultkj10k.Rda")
resultkj <-result
rm(result)

cfhest = c(14.176)
par(mfrow= c(3,1), oma=c(0,0,0,0), mar=c(3,4,1,2))
hist(resulteuler, breaks = 100, main = "", col = "grey", las=1, xlab = "Euler")
abline(v=cfhest, col='red')
box()
mtext("Euler", cex = 0.6)
hist(resultkj, breaks = 100, main = "", col = "grey", las=1, xlab = "KJ")
abline(v=cfhest, col='red')
box()
mtext("KJ", cex = 0.6)
hist(resulteadi, breaks = 100, main = "", col = "grey", las=1, xlab = "EA-DI")
abline(v=cfhest, col='red')
box()
mtext("EA-DI", cex = 0.6)

