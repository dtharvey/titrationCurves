% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/triwb_sa.R
\name{triwb_sa}
\alias{triwb_sa}
\title{Titration Curve for a Triprotic Weak Base}
\usage{
triwb_sa(conc.base = 0.1, conc.acid = 0.1, pka1 = 4, pka2 = 7,
  pka3 = 10, pkw = 14, vol.base = 50, plot = TRUE, eqpt = FALSE,
  overlay = FALSE, ...)
}
\arguments{
\item{conc.base}{Molar concentration of the triprotic weak base
analyte; defaults to 0.10 M.}

\item{conc.acid}{Molar concentration of the strong acid titrant;
defaults to 0.10 M.}

\item{pka1}{The pKa1 value for the triprotic weak base analyte's
conjugat weak acid; defaults to a pKa1 of 4, or a pKb3 of 10.}

\item{pka2}{The pKa2 value for the triprotic weak base analyte's
conjugat weak acid; defaults to a pKa2 of 7, or a pKb2 of 7}

\item{pka3}{The pKa3 value for the triprotic weak base analyte's
conjugat weak acid; defaults to a pKa3 of 10, or a pKb1 of 4.}

\item{pkw}{The pKw (or pKs) value for the solvent; defaults to water
as a solvent with a pKw of 14.}

\item{vol.base}{The iniital volume, in mL, of the solution that 
contains the weak acid analyte; defaults to 50.00 mL.}

\item{plot}{Logical; if TRUE, plots the titration curve.}

\item{eqpt}{Logical; if TRUE, draws a vertical line at the titration
curve's equivalence point.}

\item{overlay}{Logical; if TRUE, adds the current titration curve
to the existing titration curve.}

\item{\dots}{Additional arguments to pass to \code{plot()} function.}
}
\value{
A two-column data frame that contains the volume of titrant
in the first column and the solution's pH in the second column. Also
produces a plot of the titration curve with options to display the
equivalence point and to overlay titration curves.
}
\description{
This function calculates and plots the titration curve for a 
triprotic weak base analyte using a monoprotic strong acid as 
the titrant. The calculation uses a single master equation
that finds the volume of titrant needed to achieve a fixed pH, 
as outlined in R. de Levie's \emph{Principles of Quantitative 
Chemical Analysis} (McGraw-Hill, 1997).
}
\examples{
### Simple titration curve with equivalence points
ex8 = triwb_sa(eqpt = TRUE)
head(ex8)

### Overlay titration curves using different pKa1 and pKa2 values
triwb_sa(pka1 = 4, pka2 = 7, pka3 = 10, eqpt = TRUE)
triwb_sa(pka1 = 3, pka2 = 7, pka3 = 11, overlay = TRUE)
triwb_sa(pka1 = 5, pka2 = 7, pka3 = 9, overlay = TRUE)
}
\author{
David T. Harvey, DePauw University. \email{harvey@depauw.edu}
}

