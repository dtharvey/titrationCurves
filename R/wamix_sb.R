# titration of two monoprotic weak acids with strong base
wamix_sb = function(conc.acid1 = 0.1, conc.acid2 = 0.1, 
                    conc.base = 0.1, pka1 = 5, pka2 = 8, pkw = 14, 
                    vol.acid = 50, eqpt = FALSE, 
                    overlay = FALSE, ...) {
  veq1 = conc.acid1 * vol.acid/conc.base
  veq2 = conc.acid2 * vol.acid/conc.base
  ka1 = 10^-pka1
  ka2 = 10^-pka2
  kw = 10^-pkw
  ph = seq(1, pkw, 0.01)
  h = 10^-ph
  oh = kw/h
  delta = h - oh
  alpha1 = ka1/(ka1 + h)
  alpha2 = ka2/(ka2 + h)
  volume = vol.acid * 
    (conc.acid1 * alpha1 + conc.acid2 * alpha2 - delta)/(conc.base + delta)
  df = data.frame(volume, ph)
  df = df[df$volume > 0 & df$volume < 2 * (veq1 + veq2), ]
  rownames(df) = 1:nrow(df)
  if (overlay == FALSE){
    plot(df$volume, df$ph, type = "l", lwd = 2, 
         xlim = c(0, 1.5 * (veq1 + veq2)), ylim = c(0, pkw), 
         xlab = "volume of strong base (mL)", ylab = "pH",
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