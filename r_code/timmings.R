timming1 <- data.frame("Simulations" = c("1,000", "10,000", "100,000"), "Euler" = c(0.010, 0.049, 0.457), "Kahl" = c(0.012, 0.053, 0.451), "EA_BK" = c(58.564, 572.829, 5704.569), "mod_EA" = c(0.017, 0.044, 0.335), row.names = NULL)
# options("scipen"=100, "digits"=4)
# print(timming1)
# print(knitr::kable(timming1))


addtorow <- list()
addtorow$pos <- list()
addtorow$pos[[2]] <- c(nrow(timming1))
addtorow$pos[[1]] <- c(-1, 0)
addtorow$command <- c("\\hline \n",
                      paste0('\\hline \n', '\\multicolumn{5}{l}{\\scriptsize{Note: Simulations were performed with 100 timesteps, except the EA BK}} \n'))
names(timming1) <- c("Simulations", "Euler", "KJ", "EA-BK", "EA-DI")
print(xtable::xtable(timming1, caption = "Computing time (sec.)", label = "timming"), 
      add.to.row = addtorow, include.rownames = FALSE,
      hline.after = NULL)