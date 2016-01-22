# Functions for Generating and Plotting Titration Curves

Gathered here are functions for generating and plotting normal 
titration curves using R, including acid-base titrations, complexation
titrations, redox titrations, and precipitation titrations.

## Acid-Base Titrations

The following functions are available for the titration of acids and bases.

function | analyte(s)                           | titrant 
-------- | ------------------------------------ | ------- 
sa_sb    | monoprotic strong acid               | strong base 
sb_sa    | monoprotic strong base               | strong acid 
wa_sb    | monoprotic weak acid                 | strong base
wb_sa    | monoprotic weak base                 | strong acid
diwa_sb  | diprotic weak acid                   | strong base
diwb_sa  | diprotic weak base                   | strong acid
triwa_sb | triprotic weak acid                  | strong base
triwb_sa | triprotic weak base                  | strong acid
wamix_sb | mixture of two monoprotic weak acids | strong base
wbmix_sa | mixture of two monoprotic weak bases | strong acid

These functions use the general approach outlined in _Principles of 
Quantitative Analysis_ by Robert de Levie (McGraw-Hill, 1997) in which 
a single master equation is used to calculate the progress of a 
titration. 

Each function calculates the volume of titrant over a range of pH values
that extends from a pH of 1 to a pH equal to the solvent's pKw value. 
Because some of the calculated volumes are negative---equivalent to 
adding a strong acid to achieve a pH less than that of the original 
solution---and some of the calculate values are quite large, the function 
removes all negative volumes and all volumes greater than twice the volume of 
the titration curve's last equivalence point. 

Calling the function returns a data frame with the volumes of titrant
and the pH, and produces a plot of the titration curve.

## Complexation Titrations

coming soon...

## Redox Titrations

coming soon...

## Precipitation Titrations

coming soon...


