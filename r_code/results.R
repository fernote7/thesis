

cfhest = c(14.176)
# cfhsens=c(23.023,22.345,21.679,21.025,20.384,19.755,19.140,18.537,17.946,17.369,16.805,
# 16.253,15.715,15.189,14.676,14.176,13.689,13.214,12.752,12.302,11.864,11.438,
# 11.025,10.623,10.233,9.854,9.487,9.131,8.786,8.452,8.128)

euler = c(13.2758, 14.16424, 14.11025)
# N=1000 ("  user  system elapsed   0.273   0.010   0.280 ")
# N=10000 ("  user  system elapsed   2.090   0.049   2.141 ")
# N=100000("   user  system elapsed  21.086   0.457  21.603 ")

kj = c(13.05, 13.86, 13.83)
# N=1000 ("   user  system elapsed 0.454   0.012   0.459 ")
# N=10000 ("  user  system elapsed  2.870   0.053   2.929 ")
# N=100000("   user  system elapsed  26.744   0.451  27.286 ")


ea_bk = c(14.71165, 14.44851,14.20904)
# N=1000 ("user  system elapsed 58.272    0.126   58.564")
# N=10000 ("user system elapsed 572.829   0.169  574.715")
# N=100000("user system  elapsed 5704.569 1.203 5723.664 ")



ea_mod = c(14.74, 14.38, 14.16)
# N=1000 ("   user  system elapsed   0.553   0.017   0.564 ")
# N=10000 ("  user  system elapsed  4.463   0.044   4.510 ")
# N=100000("user  system elapsed 44.418   0.335  44.847 ")



# result1 <- data.frame(Method = c("euler", "Kahl", "EA", "mod EA"), "1,000" = c(13.2758, 13.05, 14.71165, 14.74), "10,000" = c(14.16424, 13.86, 14.44851, 14.38), "100,000" = c(14.11025, 13.83, 14.20904, 14.16), row.names = NULL)
# print(knitr::kable(result1))

options("scipen"=100, "digits"=4, xtable.comment = FALSE)
result1 <- data.frame("Simulations" = c("1,000", "10,000", "100,000"), "Euler" = euler, "Kahl" = kj, "EA_BK" = ea_bk, "EA_mod" = ea_mod, row.names = NULL)
# print(knitr::kable(result1), longtable = TRUE, booktabs = TRUE, escape = FALSE,
#       align = c('l','r', 'r', 'r', 'r'))
# print(xtable::xtable(result1), include.rownames = FALSE)


addtorow <- list()
addtorow$pos <- list()
addtorow$pos[[2]] <- c(nrow(result1))
addtorow$pos[[1]] <- c(-1, 0)
addtorow$command <- c("\\hline \n",
                      paste0('\\hline \n', '\\multicolumn{5}{l}{\\scriptsize{Note: Simulations performed with 20 steps, except the EA BK}} \n'))
names(result1) <- c("Simulations", "Euler", "KJ", "EA-BK", "EA-DI")
print(xtable::xtable(result1, caption = "Results", label = "res"), 
      add.to.row = addtorow, include.rownames = FALSE,
      hline.after = NULL)
