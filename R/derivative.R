derivative = function(titration.df) {
  n = length(titration.df[ , 1])
  x = titration.df[ , 1]
  y = titration.df[ , 2]
  x1 = seq(1,n-1)
  x2 = seq(1,n-2)
  y1 = seq(1,n-1)
  y2 = seq(1,n-2)
  for (i in 1:(n-1)) {
    x1[i] = (x[i] + x[i+1])/2
    y1[i] = (y[i+1] - y[i])/(x[i+1] - x[i])
  }
  for (j in 1:(n-2)) {
    x2[j] = (x1[j] + x1[j+1])/2
    y2[j] = (y1[j+1] - y1[j])/(x1[j+1] - x1[j])
  }
  opt = par(mfrow = c(1,2))
  plot(x1, y1, type = "l", col = "blue", lwd = 2, xlab = "volume of
       titrant (mL)", ylab = "first derivative")
  plot(x2, y2, type = "l", col = "blue", lwd = 2, xlab = "volume of
       titrant (mL)", ylab = "second derivative")
  par(opt)
  df.f = data.frame(x1,y1)
  df.s = data.frame(x2,y2)
  obj.ret = list("first_deriv" =df.f,"second_deriv"=df.s)
  invisible(obj.ret)
}

