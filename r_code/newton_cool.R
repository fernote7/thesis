euler <- function(f, y0, a, b, h)
{
  t <- a
  y <- y0
  result <- c(t,y)
  
    # browser()
  
  while (t < b)
  {
    t <- t + h
    y <- y + h*f(t, y)
    result = c(result,cbind(t,y))
  }
  result = matrix(result, ncol=2, byrow = TRUE) 
  
  return(result)
}

newtoncooling <- function(time, temp)
  return(-0.07*(temp-20))


h2=euler(newtoncooling, 100, 0, 600, 2)
h5=euler(newtoncooling, 100, 0, 100, 5)
h10=euler(newtoncooling, 100, 0, 100, 10)
h15=euler(newtoncooling, 100, 0, 100, 15)
h20=euler(newtoncooling, 100, 0, 600, 20)
h25=euler(newtoncooling, 100, 0, 600, 25)
plot(h5, type = 'b')
lines(h10, type = 'b', col='red')
lines(h15, type = 'b', col='blue')
lines(h20, type = 'b', col='green')
lines(h25, type = 'b', col='cyan')
lines(analytical)
lines(h2, type = 'b', col = "orange")
