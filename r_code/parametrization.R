source("./r_code/parameters.R")
options("scipen"=100, "digits"=2, xtable.comment = FALSE)
a <- mget(c("dt","k","r","rho","S","sigma","t","tau","theta","v","X"))
# print(a)
aa <- data.frame(Variables = names(a), Values = unlist(a), row.names = NULL)
# print(knitr::kable(aa))
ab <- xtable::xtable(aa)
# cat(ab[1:18],"\\footnotesize{teste}", ab[19:20])



addtorow <- list()
addtorow$pos <- list()
addtorow$pos[[2]] <- c(nrow(ab))
addtorow$pos[[1]] <- c(-1, 0)
addtorow$command <- c("\\hline \n",
                      paste0('\\hline \n'))
print(xtable::xtable(ab, caption = "Model Parameters", label = "param"), 
      add.to.row = addtorow, include.rownames = FALSE,
      hline.after = NULL, size="\\fontsize{11pt}{13pt}\\selectfont")


# , size="\\fontsize{14pt}{14pt}\\selectfont"

# print(xtable(a, caption = "\\textbf{Inflation Expectation of Brazilian Consumers, 2005-2016}", 
#              label = "summaryiebc"
# ),sanitize.text.function=function(x){x},
# caption.placement="top")
# 
# 
# cat("\\begin{table}[!htbp] \\centering ", "\\caption{ECM interannual}", 
# "\\resizebox*{!}{\\dimexpr\\textheight-12\\baselineskip\\relax}{%", 
# star2[6:(length(star2)-1)],  "} \\end{table}", sep="\n")

# add.to.row <- list(pos = list(0), command = NULL)
# command <- paste0("\\hline\n\\endhead\n",
#                   "\\hline\n",
#                   "\\multicolumn{", dim(aa)[2] + 1, "}{l}",
#                   "{\\footnotesize Continued on next page}\n",
#                   "\\endfoot\n",
#                   "\\endlastfoot\n")
# add.to.row$command <- command
# print(xtable::xtable(aa), include.rownames = FALSE,add.to.row = add.to.row)


