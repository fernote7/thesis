load("./r_code/dados/resulteadi10k.Rda")
resulteadi <-result
load("./r_code/dados/resulteuler10k.Rda")
resulteuler <-result
load("./r_code/dados/resultkj10k.Rda")
resultkj <-result
rm(result)

load("./r_code/dados/timmingeadi10k.Rda")
timmingeadi <-timming
load("./r_code/dados/timmingeuler10k.Rda")
timmingeuler <-timming
load("./r_code/dados/timmingkj10k.Rda")
timmingkj <-timming
rm(timming)

cfhest = c(14.176)

b1 <- mean(resulteuler) - cfhest
b2 <- mean(resultkj) - cfhest
b3 <- mean(resulteadi) - cfhest

var1 <- mean((resulteuler - mean(resulteuler))^2)
var2 <- mean((resultkj - mean(resultkj))^2)
var3 <- mean((resulteadi - mean(resulteadi))^2)

rmse1 <- sqrt(b1^2 + var1)
rmse2 <- sqrt(b2^2 + var2)
rmse3 <- sqrt(b3^2 + var3)

t1 <- sum(timmingeuler)
t2 <- sum(timmingkj)
t3 <- sum(timmingeadi)
t4 <- 0 

DF <- data.frame(euler = c(b1, sqrt(var1), rmse1, t1), 
                 kj = c(b2, sqrt(var2), rmse2, t2),
                 eabk = c(0,sqrt(0), 0, 0),
                 eadi = c(b3,sqrt(var3),rmse3, t3))

row.names(DF) <- c("bias", "sd", "RMSE", "time")

options("scipen"=100, "digits"=4, xtable.comment = FALSE)

addtorow <- list()
addtorow$pos <- list()
addtorow$pos[[2]] <- c(nrow(DF))
addtorow$pos[[1]] <- c(-1, 0)
addtorow$command <- c("\\hline \n",
                      paste0('\\hline \n', '\\multicolumn{5}{l}{\\scriptsize{Note: Simulations performed with 20 steps, except the EA BK}} \n'))
names(DF) <- c("Euler", "KJ", "EA-BK", "EA-DI")
tabela <- xtable::xtable(DF, caption = "Results", label = "res")
xtable::align(tabela) <- 'lrrrr'

print(tabela, 
      add.to.row = addtorow, include.rownames = TRUE,
      hline.after = NULL)
 