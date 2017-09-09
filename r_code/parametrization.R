source("./r_code/parameters.R")
options("scipen"=100, "digits"=4)
a <- mget(c("dt","k","r","rho","S","sigma","t","tau","theta","v","X"))
# print(a)
aa <- data.frame(variables = names(a), values = unlist(a), row.names = NULL)
print(knitr::kable(aa))


