euler = matrix(data= c(100.00000,100.00000, 
59.72682, 57.63416,
39.72776, 37.70413, 
29.79651, 28.32850,
24.86481, 23.91795, 
22.41579, 21.84311, 
21.19965, 20.86705, 
20.59573, 20.40788, 
20.29583, 20.19188, 
20.14690, 20.09027, 
20.07295, 20.04246), ncol = 2, byrow = TRUE) 

plot(euler[,1], lty = 1, pch = 1, type='b', axes=F, xlab = 'time in seconds', ylab = 'Temperature', col='blue', cex=0.5)
lines(euler[,2], lty = 2, pch = 20, type='b', col='red', cex = 0.5)
axis(side = 1, at = c(1,3,5,7,9,11), labels = c("0","20","40","60","80","100"))
axis(side = 2, las = 1)
box()
leg.txt = c("analytical", "euler")
legend("topright", leg.txt,col=c("blue", "red"),lwd=c(1,1),lty=c(1,2), pch = c(1,20),seg.len=2,bty="n", cex = 0.75)
