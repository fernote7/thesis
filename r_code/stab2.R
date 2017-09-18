par(mfrow=c(1,2), xpd=FALSE, mar=c(2,4,2,2), oma=c(2,0,0,0))
z=10
plot(z, asp = 1, xlim = c(-2.5, 0), ylim = c(-1.5,1.5), axes = FALSE, ylab = "", xlab = "")
rect(-5,-5,2,2, density = 15, angle = 50)
draw.circle(-1, 0, 1, nv = 1000, border = NULL, lty = 1, lwd = 1, col = "white")
abline(h=0)
abline(v=0)

z=10
plot(z, asp = 1, xlim = c(-1, 1), ylim = c(-1,1), axes = FALSE, ylab = "", xlab = "")
rect(-0,-2,2,2, density = 15, angle = 50)
abline(h=0)
abline(v=0)
