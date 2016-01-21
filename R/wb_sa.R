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
  volume = vol.base * (conc.base * alpha + delta)/(conc.acid - delta)
  df = data.frame(volume, ph)
  df = df[df$volume > 0 & df$volume < 2 * veq, ]
  rownames(df) = 1:nrow(df)
  if (overlay == FALSE) {
    plot(df$volume, df$ph, type = "l", lwd = 2,
         xlim = c(0, 1.5 * veq), ylim = c(0, pkw), 
         xlab = "volume of strong acid (mL)",
       ylab = "pH", xaxs = "i", yaxs = "i", ...)
  } else {
    lines(df$volume, df$ph, type = "l", lwd = 2, ...)
  }
  if (eqpt == TRUE) {
    x = c(veq, veq)
    y = c(0, pkw + 1)
    lines(x, y, type = "l", lty = 2, col = "red")
  }
  invisible(df)
}