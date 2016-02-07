# precipitation titration displayed as pTitrant vs. volume titrant
ppt_titrant = function(conc.analyte = 0.025, conc.titrant = 0.05, 
                       vol.analyte = 50, pksp = 16.08, eqpt = FALSE, 
                       overlay = FALSE, ...) {
  veq = conc.analyte * vol.analyte/conc.titrant
  ksp = 10^-pksp
  p.titrant = seq(1, pksp, 0.01)
  titrant = (10^-p.titrant)
  analyte = ksp/titrant
  volume = vol.analyte * (conc.analyte - analyte + titrant)/
    (conc.titrant + analyte - titrant)
  df = data.frame(volume, p.titrant)
  df = df[df$volume > 0 & df$volume < 2 * veq, ]
  rownames(df) = 1:nrow(df)
  if (overlay == FALSE) {
    plot(df$volume, df$p.titrant, type = "l", lwd = 2, 
         xlim = c(0, 1.5 * veq), ylim = c(0, pksp), 
         xlab = "volume of titrant (ml)", ylab = "pTitrant",
         xaxs = "i", yaxs = "i", ...)
  } else {
    lines(df$volume, df$p.titrant, type = "l", lwd = 2, 
          xlim = c(0, 1.5 * veq), ylim = c(0, pksp), 
          xlab = "volume of titrant (ml)",
          ylab = "pAnalyte")
  }
  if (eqpt == TRUE) {
    x = c(veq, veq)
    y = c(-1, pksp + 1)
    lines(x, y, type = "l", lty = 2, col = "red")
  }
  invisible(df)
}