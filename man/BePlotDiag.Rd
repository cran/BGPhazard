\name{BePlotDiag}

\alias{BePlotDiag}

\title{Diagnosis plots for Pi, u, c and epsilon}

\description{
Informative plots for hazard rate (Pi), latent variable (u), dependence variable (c) and parameter of the hierarchical model (epsilon).
}

\usage{
BePlotDiag(M, variable = "Pi", pos = 1)
}

\arguments{
  \item{M}{List. Contains the information given for Pi and u by \code{BeMRes}}
  \item{variable}{Either "Pi", "u", "c" or "epsilon". Variable for which informative plot will be shown.}
  \item{pos}{Positive integer. Position of the selected \code{variable} to be plotted.}
}

\details{
This function returns a diagnosis plot for the chain of the selected variable. The diagnosis includes trace, ergodic mean, autocorrelation function and histogram.
}

\references{
- Nieto-Barajas, L. E. & Walker, S. G. (2002). Markov beta and gamma processes for modelling hazard rates. \emph{Scandinavian Journal of Statistics} \strong{29}: 413-424.
}

\seealso{\link{BeMRes}}

\examples{
## Simulations may be time intensive. Be patient.

## Example 1
#  data(psych)
#  timesP <- psych$time
#  deltaP <- psych$death
#  BEX1 <- BeMRes(timesP, deltaP, iterations = 3000)
#  BePlotDiag(BEX1, variable = "Pi", pos = 2)
#  BePlotDiag(BEX1, variable = "u", pos = 3)

## Example 2
#  data(gehan)
#  timesG <- gehan$time[gehan$treat == "control"]
#  deltaG <- gehan$cens[gehan$treat == "control"]
#  BEX2 <- BeMRes(timesG, deltaG, type.c = 2, c.r = rep(50, 22))
#  BePlotDiag(BEX2, variable = "Pi", pos = 5)
#  BePlotDiag(BEX2, variable = "u", pos = 4)
}