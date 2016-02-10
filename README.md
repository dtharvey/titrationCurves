# Functions for Generating and Plotting Titration Curves

Gathered here are functions for generating and plotting normal, first derivative, and second derivative titration curves for acid-base titrations, complexation titrations, redox titrations, and precipitation titrations.

All functions for normal titration curves use the general approach outlined in _Principles of Quantitative Chemical Analysis_ by Robert de Levie (McGraw-Hill, 1997) in which a single master equation is used to calculate the progress of a titration. Each function returns a two-column data frame with volumes of titrant in the first column and, depending on the type of titration, values for  pH, pMetal, pAnalyte, pTitrant, or solution potential in the second column. By default, each function returns a plot of the titration curve with options to add a vertical line at the equivalence point and/or to overlay two or more titration curves; automatic plotting can be disabled. An additional function is included to construct first derivative and second derivative titration curves using the output from the other functions. 

See the package vignette for a more detailed description and examples.

To install package from Github using R, use the following commands:

```
install.packages("devtools")
library("devtools")
install_github(repo = "dtharvey/titrationCurves")
library("titrationCurves")
```