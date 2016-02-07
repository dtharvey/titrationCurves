# titration of diprotic weak base with strong acid
diwb_sa = function(conc.base = 0.1, conc.acid = 0.1, pka1 = 5, 
                   pka2 = 9, pkw = 14, vol.base = 50, 
                   eqpt = FALSE, overlay = FALSE, ...) {
  veq1 = conc.base * vol.base/conc.acid
  ka1 = 10^-pka1
  ka2 = 10^-pka2
  kw = 10^-pkw
  ph = seq(pkw, 1, -0.01)
  h = 10^-ph
  oh = kw/h
  delta = h - oh
  alpha1 = (ka1 * h)/(ka1 * ka2 + ka1 * h + h^2)
  alpha2 = h^2/(ka1 * ka2 + ka1 * h + h^2)
  volume = vol.base * 
    (conc.base * alpha1 + 2 * conc.base * alpha2 + delta)/
    (conc.acid - delta)
  df = data.frame(volume, ph)
  df = df[df$volume > 0 & df$volume < 4 * veq1, ]
  rownames(df) = 1:nrow(df)
  if (overlay == FALSE) {
    plot(df$volume, df$ph, type = "l", lwd = 2,
         xlim = c(0, 1.5 * (2 * veq1)), ylim = c(0, pkw), 
         xlab = "volume of strong acid (mL)",
       ylab = "pH", xaxs = "i", yaxs = "i", ...)
  } else {
    lines(df$volume, df$ph, type = "l", lwd = 2, ...)
  }
  if (eqpt == TRUE){
    x1 = c(veq1, veq1)
    x2 = c(2 * veq1, 2 * veq1)
    y = c(0, pkw + 1)
    lines(x1, y, type = "l", lty = 2, col = "red")
    lines(x2, y, type = "l", lty = 2, col = "red")
  }
  invisible(df)
}