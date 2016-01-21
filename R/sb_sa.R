# titration of strong base with strong acid
sb_sa = function(conc.base = 0.1, conc.acid = 0.1, pkw = 14, 
                 vol.base = 50, overlay = FALSE, eqpt = FALSE, ...) {
  veq = conc.base * vol.base / conc.acid
  kw = 10 ^ -pkw
  ph = seq(pkw, 1,-0.01)
  h = 10 ^ -ph
  oh = kw / h
  delta = h - oh
  volume = vol.base * (conc.base + delta) / (conc.acid - delta)
  df = data.frame(volume, ph)
  df = df[df$volume > 0 & df$volume <2 * veq, ]
  rownames(df) = 1:nrow(df)
  if (overlay == FALSE) {
    plot(df$volume, df$ph, type = "l", lwd = 2, xlim =
         c(0, 1.5 * veq), ylim = c(0, pkw), 
       xlab = "volume of strong acid (mL)", ylab = "pH", 
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