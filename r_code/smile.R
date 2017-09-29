x = c(100, 81, 64, 49, 36, 25, 16,  9,  4,  1,  
      0,  1,  4,  9, 16, 25, 36, 49, 64, 81, 100)
cex = 0.4

plot(x, type='l', axes=FALSE, xlim = c(-3,28), ylim = c(-90,170), xlab = "Strike Price",
     ylab = "Implied Volatility")
segments(x0=11,y0=-100,x1=11,y1=0,lty=2, col = 'red')
mtext("At-the-money Calls", side = 1, col = 'red', cex = 0.6, lwd=10, at=11)
box()
arrows(x0=10,y0=-17,x1=7,y1=-17, col = 'black', length = 0.07)
arrows(x0=15,y0=-17,x1=12,y1=-17, col = 'black', length = 0.07, code = 1)
text("Out-of-the-money Calls", x = 7, y = -33, col = 'black', cex = cex)
text("In-the-money Calls", x = 15, y = -33, col = 'black', cex = cex)

text("Volatility increases as the option becomes \n increasingly in-the-money or out-of-the-money", x = 11.5, y = 75, col = 'black', cex = cex)
arrows(x0=9,y0=55,x1=7,y1=35, col = 'red', length = 0.07)
arrows(x0=13,y0=55,x1=15,y1=35, col = 'red', length = 0.07, code = 2)
points(x=11, y = 0, pch = 19, col = 'black', cex=0.5)
