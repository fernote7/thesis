source("./r_code/parameters.R")
options("scipen"=100, "digits"=2)
a <- mget(c("dt","k","r","rho","S","sigma","t","tau","theta","v","X"))
# print(a)
aa <- data.frame(Variables = names(a), Values = unlist(a), row.names = NULL)
print(knitr::kable(aa))


