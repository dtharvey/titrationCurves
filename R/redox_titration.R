# redox titration using an oxidizing agent as the titrant
redox_titration = function(conc.analyte = 0.01, vol.analyte = 25, 
                         pot.analyte = 0.77, elec.analyte = 1, 
                         conc.titrant = 0.01, pot.titrant = 1.7, 
                         elec.titrant = 1, eqpt = FALSE,
                         overlay = FALSE, ...) {
  veq = (elec.analyte * conc.analyte * vol.analyte)/
    (elec.titrant * conc.titrant)
  k.analyte = 10^-(pot.analyte/0.05916)
  k.titrant = 10^-(pot.titrant/0.05916)
  potential = seq(-3, 3, 0.01)
  h = 10^-(potential/0.05916)
  alpha.analyte = (k.analyte^elec.analyte)/
    (h^elec.analyte + k.analyte^elec.analyte)
  alpha.titrant = (h^elec.titrant)/
    (h^elec.titrant + k.titrant^elec.titrant)
  volume = vol.analyte * 
    (elec.analyte * conc.analyte * alpha.analyte)/
    (elec.titrant * conc.titrant * alpha.titrant)
  df = data.frame(volume, potential)
  df = df[df$volume > 0.1 & df$volume < 2 * veq, ]
  rownames(df) = 1:nrow(df)
  if (overlay == FALSE) {
    plot(df$volume, df$potential, type = "l", lwd = 2,
         xlim = c(0, 1.5 * veq), 
         ylim = c(pot.analyte - 0.5, 1.2 * pot.titrant), 
         xlab = "volume of titrant (ml)", ylab = "potential (V)",
         xaxs = "i", ...)
  } else {
    lines(df$volume, df$potential, type = "l", lwd = 2, ...)
  }
  if (eqpt == TRUE) {
    x = c(veq, veq)
    y = c(-3, 3)
    lines(x, y, type = "l", lty = 2, col = "red")
  }
  invisible(df)
}
