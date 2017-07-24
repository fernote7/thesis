mat <- matrix(c(0, 0, 0, "$dt$"), nrow = 2, ncol = 2)
rownames(mat) <- c("$dt$", "$dW_t$")
colnames(mat) <- c("$dt$", "$dW_t$")
#align(mat) <- c("|c","c","c|")
#print(mat, sanitize.text.function = function(x) {x})

print(knitr::kable(mat, caption = 'Box calculus', align = c('l','r', 'r'),
             longtable = TRUE, booktabs = TRUE, escape = FALSE))