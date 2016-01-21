# titration of monoprotic weak base with strong acid
wb_sa = function(conc.acid = 0.1, conc.base = 0.1, pka = 9, pkw = 14, 
                 vol.base = 50, eqpt = FALSE, overlay = FALSE, ...) {
  veq = conc.base * vol.base/conc.acid
  ka = 10^-pka
  kw = 10^-pkw
  ph = seq(pkw, 1, -0.01)
  h = 10^-ph
  oh = kw/h
  delta = h - oh
  alpha = h/(ka + h)
  vol.acid = vol.base * (conc.base * alpha + delta)/(conc.acid - delta)
  df = data.frame(vol.acid, ph)
  df = df[df$vol.acid > 0 & df$vol.acid < 2 * veq, ]
  rownames(df) = 1:nrow(df)
  if (overlay == FALSE) {
    plot(df$vol.acid, df$ph, type = "l", lwd = 2,
         xlim = c(0, 1.5 * veq), ylim = c(0, pkw), 
         xlab = "volume of strong acid (mL)",
       ylab = "pH", xaxs = "i", yaxs = "i", ...)
  } else {
    lines(df$vol.acid, df$ph, type = "l", lwd = 2, ...)
  }
  if (eqpt == TRUE) {
    x = c(veq, veq)
    y = c(0, pkw + 1)
    lines(x, y, type = "l", lty = 2, col = "red")
  }
  invisible(df)
}