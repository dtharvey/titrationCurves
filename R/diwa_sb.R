# titration of diprotic weak acid with strong base
diwa_sb = function(conc.acid = 0.1, conc.base = 0.1, pka1 = 5, 
                   pka2 = 9, pkw = 14, vol.acid = 50, eqpt = FALSE,
                   overlay = FALSE, ...) {
  veq1 = conc.acid * vol.acid/conc.base
  ka1 = 10^-pka1
  ka2 = 10^-pka2
  kw = 10^-pkw
  ph = seq(1, pkw, 0.01)
  h = 10^-ph
  oh = kw/h
  delta = h - oh
  alpha1 = (ka1 * h)/(ka1 * ka2 + ka1 * h + h^2)
  alpha2 = (ka1 * ka2)/(ka1 * ka2 + ka1 * h + h^2)
  vol.base = vol.acid * 
    (conc.acid * alpha1 + 2 * conc.acid * alpha2 - delta)/(conc.base + delta)
  df = data.frame(vol.base, ph)
  df = df[df$vol.base > 0 & df$vol.base < 4 * veq1, ]
  rownames(df) = 1:nrow(df)
  if (overlay == FALSE) {
    plot(df$vol.base, df$ph, type = "l", lwd = 2, 
         xlim = c(0, 1.5 * (2 * veq1)), ylim = c(0, pkw), 
         xlab = "volume of strong base (mL)",
       ylab = "pH", xaxs = "i", yaxs = "i", ...)
  } else {
    lines(df$vol.base, df$ph, type = "l", lwd = 2, ...)
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
