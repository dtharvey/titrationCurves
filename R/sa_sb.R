# titration of a monoprotic strong acid with a monoprotic strong base
sa_sb = function(conc.acid = 0.1, conc.base = 0.1, pkw = 14, 
                 vol.acid = 50, eqpt = FALSE, overlay = FALSE, ...) {
  veq = conc.acid * vol.acid/conc.base
  kw = 10^-pkw
  ph = seq(1, pkw, 0.01)
  h = 10^-ph
  oh = kw/h
  delta = h - oh
  volume = vol.acid * (conc.acid - delta)/(conc.base + delta)
  df = data.frame(volume, ph)
  df = df[df$volume > 0 & df$volume < 2 * veq, ]
  rownames(df) = 1:nrow(df)
  if (overlay == FALSE) {
  plot(df$volume, df$ph, type = "l", lwd = 2, xlim =
         c(0, 1.5 * veq), ylim = c(0, pkw), 
          xlab = "volume of strong base (mL)", ylab = "pH", 
       xaxs = "i", yaxs = "i", ...)
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
