set.seed(10)
n=1
homo.wiener <- array(0, c(1000, n))
for (j in 1:n) {
  for (i in 2:nrow(homo.wiener)) {
    homo.wiener[i,j] <-  homo.wiener[ i - 1, j] + rnorm(1)
  }}

matplot( homo.wiener, axes = FALSE,
         type = "l", col = rgb(.1,.1,.1,.6),
         ylim=c(min(homo.wiener),max(homo.wiener)), ylab = expression("W"[t]),
         xaxs="i", xlim = c(0,1000), xlab = "time")
axis(side = 1, las=1, at = c(0,200,400,600,800,1000), labels = c("0","20","40","60","80","100"))
axis(side = 2, las=1)

grid()
box()