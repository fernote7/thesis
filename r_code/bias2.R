load("./r_code/dados/resulteadi001.Rda")
resulteadi <-result
load("./r_code/dados/resulteuler10k001.Rda")
resulteuler <-result
load("./r_code/dados/resultkj001.Rda")
resultkj <-result
load("./r_code/dados/eaBK1000.Rda")
resulteabkj <-result2
rm(result, result2)

# load("./r_code/dados/timmingeadi10k.Rda")
# timmingeadi <-timming
# load("./r_code/dados/timmingeuler10k001.Rda")
# timmingeuler <-timming
# load("./r_code/dados/timmingkj10k001.Rda")
# timmingkj <-timming
# rm(timming)

cfhest = c(14.176)

b1 <- mean(resulteuler) - cfhest
b2 <- mean(resultkj) - cfhest
b3 <- mean(resulteadi) - cfhest
b4 <- mean(resulteabkj) - cfhest

var1 <- mean((resulteuler - mean(resulteuler))^2)
var2 <- mean((resultkj - mean(resultkj))^2)
var3 <- mean((resulteadi - mean(resulteadi))^2)
var4 <- mean((resulteabkj - mean(resulteabkj))^2)

rmse1 <- sqrt(b1^2 + var1)
rmse2 <- sqrt(b2^2 + var2)
rmse3 <- sqrt(b3^2 + var3)
rmse4 <- round(sqrt(b4^2 + var4),2)



DF <- data.frame(euler = c(b1, sqrt(var1), rmse1), 
                 kj = c(b2, sqrt(var2), rmse2),
                 eabk = c("-","-", rmse4),
                 eadi = c(b3,sqrt(var3),rmse3))

row.names(DF) <- c("bias", "sd", "RMSE")



addtorow <- list()
addtorow$pos <- list()
addtorow$pos[[2]] <- c(nrow(DF))
addtorow$pos[[1]] <- c(-1, 0)
addtorow$command <- c("\\hline \n",
                      paste0('\\hline \n', '\\multicolumn{5}{l}{\\scriptsize{Note: Simulations performed with 100 steps, except the EA BK}} \n')) 
names(DF) <- c("Euler", "KJ", "EA-BK", "EA-DI") 
tabela <- xtable::xtable(DF, caption = "Estimators", label = "res2")
xtable::align(tabela) <- 'lrrrr'
options("scipen"=100, "digits"=2, xtable.comment = FALSE)
print(tabela, 
      add.to.row = addtorow, include.rownames = TRUE,
      hline.after = NULL, table.placement = "t")
  