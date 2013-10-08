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
Nieto-Barajas, L. E. & Walker, S. G. (2002). Markov beta and gamma processes for modelling hazard rates. Scandinavian Journal of Statistics 29, 413-424.
}

\author{
Garcia-Bueno, J.A. & Nieto-Barajas, L.E.
}

\seealso{\link{BeMRes}}

\examples{
## Examples are be computing intensive. Be patient.
## require(KMsurv)
## data(psych)
## times <- psych[, 3]
## delta <- psych[, 4]
## EX <- BeMRes(times, delta)
## BePlotDiag(EX, variable = "Pi", pos = 2)
## BePlotDiag(EX, variable = "u", pos = 3)
## BePlotDiag(EX, variable = "epsilon", pos = 1)
}