mat <- matrix(c(0, 0, 0, "$dt$"), nrow = 2, ncol = 2)
rownames(mat) <- c("$dt$", "$dW_t$")
colnames(mat) <- c("$dt$", "$dW_t$")
#align(mat) <- c("|c","c","c|")
#print(mat, sanitize.text.function = function(x) {x})

# print(knitr::kable(mat, caption = 'Box calculus', align = c('l','r', 'r'),
#              longtable = TRUE, booktabs = TRUE, escape = FALSE))

options("scipen"=100, "digits"=2, xtable.comment = FALSE)
addtorow <- list()
addtorow$pos <- list()
addtorow$pos[[1]] <- c(-1, 0, nrow(mat))
addtorow$command <- c("\\hline \n")
tabela <- xtable::xtable(mat, caption = "Box calculus", label = "mat")
xtable::align(tabela) <- c("l", "l", "r")
print(tabela, 
      add.to.row = addtorow, include.rownames = TRUE,
      hline.after = NULL, sanitize.text.function = function(x) {x})
