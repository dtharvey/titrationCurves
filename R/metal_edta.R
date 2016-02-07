# metal-ligand titration curve using EDTA as titrant an plotting
# pMetal vs. volume of EDTA
metal_edta = function(conc.metal = 0.1, conc.edta = 0.1, 
                      vol.metal = 50, ph = 10, logkf = 8.79, 
                      alpha.metal = 1, eqpt = TRUE, 
                      overlay = FALSE, ...) {
  ka1 = 1
  ka2 = 0.032
  ka3 = 0.01
  ka4 = 0.0022
  ka5 = 6.9e-07
  ka6 = 5.8e-11
  veq = conc.metal * vol.metal/conc.edta
  h = 10^-ph
  alpha.edta = (ka1 * ka2 * ka3 * ka4 * ka5 * ka6)/
    (h^6 + 
       ka1 * h^5 + 
       ka1 * ka2 * h^4 + 
       ka1 * ka2 * ka3 * h^3 + 
       ka1 * ka2 * ka3 * ka4 * h^2 + 
       ka1 * ka2 * ka3 * ka4 * ka5 * h + 
       ka1 * ka2 * ka3 * ka4 * ka5 * ka6
     )
  kf = 10^logkf
  kf.cond = alpha.edta * alpha.metal * kf
  p.metal = seq(0, logkf + 2, 0.01)
  metal = (10^-p.metal)/alpha.metal
  alpha.metal.edta = (kf.cond * metal)/(1 + kf.cond * metal)
  volume = vol.metal * (conc.metal - metal)/
    (alpha.metal.edta * conc.edta + metal)
  df = data.frame(volume, p.metal)
  df = df[df$volume > 0 & df$volume < 2 * veq, ]
  rownames(df) = 1:nrow(df)
  if (overlay == FALSE) {
    plot(df$volume, df$p.metal, type = "l", lwd = 2, 
         xlim = c(0, 1.5 * veq), ylim = c(0, logkf + 2), 
         xlab = "volume of titrant (ml)", ylab = "pMetal",
         xaxs = "i", yaxs = "i", ...)
  } else {
    lines(df$volume, df$p.metal, type = "l", lwd = 2, ...)
  }
  if (eqpt == TRUE) {
    x = c(veq, veq)
   y = c(-1, logkf + 3)
    lines(x, y, type = "l", lty = 2, col = "red")
  }
  invisible(df)
}