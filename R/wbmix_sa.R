# titration of two monoprotic weak base with strong acid
wbmix_sa = function(conc.base1 = 0.1, conc.base2 = 0.1, 
                    conc.acid = 0.1, pka1 = 6, pka2 = 9, pkw = 14, 
                    vol.base = 50, eqpt = FALSE, overlay = FALSE, ...) {
  veq1 = conc.base1 * vol.base/conc.acid
  veq2 = conc.base2 * vol.base/conc.acid
  ka1 = 10^-pka1
  ka2 = 10^-pka2
  kw = 10^-pkw
  ph = seq(pkw, 1, -0.01)
  h = 10^-ph
  oh = kw/h
  delta = h - oh
  alpha1 = h/(ka1 + h)
  alpha2 = h/(ka2 + h)
  volume = vol.base * 
    (conc.base1 * alpha1 + conc.base2 * alpha2 + delta)/(conc.acid - delta)
  df = data.frame(volume, ph)
  df = df[df$volume > 0 & df$volume < 2 * (veq1 + veq2), ]
  rownames(df) = 1:nrow(df)
  if (overlay == FALSE){
    plot(df$volume, df$ph, type = "l", lwd = 2,  
         xlim = c(0, 1.5 * (veq1 + veq2)), ylim = c(0, pkw), 
         xlab = "volume of strong acid (mL)", ylab = "pH",
         xaxs = "i", yaxs = "i", ...)
  }else{
    lines(df$volume, df$ph, type = "l", lwd = 2, ...)
  }
  if (eqpt == TRUE) {
    x1 = c(veq1, veq1)
    x2 = c(veq1 + veq2, veq1 + veq2)
    y = c(0, pkw + 1)
    lines(x1, y, type = "l", lty = 2, col = "red")
    lines(x2, y, type = "l", lty = 2, col = "red")
  }
  invisible(df)
}