# titration of monoprotic weak acid with a monoprotic strong base
wa_sb = function(conc.acid = 0.1, conc.base = 0.1, pka = 5, pkw = 14, 
                 vol.acid = 50, eqpt = FALSE, overlay = FALSE, ...) {
  veq = conc.acid * vol.acid/conc.base
  ka = 10^-pka
  kw = 10^-pkw
  ph = seq(1, pkw, 0.01)
  h = 10^-ph
  oh = kw/h
  delta = h - oh
  alpha = ka/(ka + h)
  volume = vol.acid * (conc.acid * alpha - delta)/(conc.base + delta)
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