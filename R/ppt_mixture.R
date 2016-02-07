# precipitation titration for a mixture of two analytes
ppt_mixture = function(conc.analyte1 = 0.05, conc.analyte2 = 0.05, 
                       vol.analyte = 25, conc.titrant = 0.05, 
                       pksp1 = 16.08, pksp2 = 11.97,
                       eqpt = FALSE, overlay = FALSE, ...) {
  veq1 = conc.analyte1 * vol.analyte/conc.titrant
  veq2 = conc.analyte2 * vol.analyte/conc.titrant
  veq = veq1 + veq2
  ksp1 = 10^-pksp1
  ksp2 = 10^-pksp2
  y.lim = max(c(pksp1, pksp2))
  p.titrant = seq(1, y.lim, 0.01)
  titrant = 10^-p.titrant
  analyte1 = ksp1/titrant
  analyte2 = ksp2/titrant
  volume1 = vol.analyte * (conc.analyte1 - analyte1 + titrant)/
    (conc.titrant + analyte1 - titrant)
  volume2 = vol.analyte * 
    (conc.analyte1 + conc.analyte2 - analyte1 - analyte2 + titrant)/
    (conc.titrant + analyte1 + analyte2 - titrant)
  df = data.frame(volume1, volume2)
  volume = apply(df, 1, max)
  df = data.frame(volume, p.titrant)
  df = df[df$volume > 0 & df$volume < 2 * veq, ]
  rownames(df) = 1:nrow(df)
  if (overlay == FALSE) {
    plot(df$volume, df$p.titrant, type = "l", lwd = 2, 
         xlim = c(0, 1.5 * veq), ylim = c(0, y.lim), 
         xlab = "volume of titrant (ml)", ylab = "pTitrant",
         xaxs = "i", yaxs = "i", ...)
  } else {
    lines(df$volume, df$p.titrant, type = "l", lwd = 2, ...)
  }
  if (eqpt == TRUE) {
    x1 = c(veq1, veq1)
    x2 = c(veq, veq)
    y = c(-1, y.lim + 1)
    lines(x1, y, type = "l", lty = 2, col = "red")
    lines(x2, y, type = "l", lty = 2, col = "red")
  }
  invisible(df)
}
