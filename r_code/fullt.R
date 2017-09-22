mat <- matrix(c("Reflection", "$\\mid V \\mid$", "$\\mid V \\mid$", "$\\mid V \\mid$",
                "Partial Truncation", "$V$", "$V$", "$V^+$",
                "Full Truncation", "$V$", "$V^+$", "$V^+$"), nrow = 3, ncol = 4, byrow = TRUE)
colnames(mat) <- c("Scheme", "$f_1(V_{t})$", "$f_2(V_{t})$", "$f_3(V_{t})$")
#align(mat) <- c("|c","c","c|")
#print(mat, sanitize.text.function = function(x) {x})

# print(knitr::kable(mat, caption = 'Truncation schemes', align = c('l','c', 'c', 'c'),
#                    longtable = TRUE, booktabs = TRUE, escape = FALSE))


options("scipen"=100, "digits"=2, xtable.comment = FALSE)
addtorow <- list()
addtorow$pos <- list()
addtorow$pos[[1]] <- c(-1, 0, nrow(mat))
addtorow$command <- c("\\hline \n")
tabela <- xtable::xtable(mat, caption = "Truncation schemes", label = "box")
xtable::align(tabela) <- c("l", "c", "c", 'c', 'c')
print(tabela, 
      add.to.row = addtorow, include.rownames = FALSE,
      hline.after = NULL, sanitize.text.function = function(x) {x})


