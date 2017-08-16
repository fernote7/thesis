x = c()
x[1] <- (-10)^2

for (i in 2:21){
  
  x[i] <- (i-11)^2
  
  
}

print(x)
plot(x, type='l', axes=FALSE, xlim = c(-3,28), ylim = c(-90,170), xlab = "Spot Price",
     ylab = "implied Volatility")
segments(x0=11,y0=-100,x1=11,y1=0,lty=2, col = 'red')
mtext("ATM", side = 1, col = 'red', cex = 0.8, lwd=10)
box()
arrows(x0=10,y0=-20,x1=7,y1=-20, col = 'black', length = 0.1)
arrows(x0=15,y0=-20,x1=12,y1=-20, col = 'black', length = 0.1, code = 1)
text("Out of the money Calls", x = 6.5, y = -30, col = 'black', cex = 0.6)
text("In the money Calls", x = 15, y = -30, col = 'black', cex = 0.6)

