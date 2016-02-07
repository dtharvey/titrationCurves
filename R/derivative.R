# plots derivative titration curves using two-column data frame 
# returned by other titration functions
derivative = function(df, ...) {
  n = length(df[ , 1])
  x = df[ , 1]
  y = df[ , 2]
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
  plot(x1, y1, type = "l", col = "blue", lwd = 2, 
       xlab = "volume of titrant (mL)", ylab = "first derivative",
       xaxs = "i", ...)
  plot(x2, y2, type = "l", col = "blue", lwd = 2, 
       xlab = "volume of titrant (mL)", ylab = "second derivative", 
       xaxs = "i",  ...)
  par(opt)
  df.f = data.frame(x1,y1)
  df.s = data.frame(x2,y2)
  obj.ret = list("first_deriv" =df.f,"second_deriv"=df.s)
  invisible(obj.ret)
}

