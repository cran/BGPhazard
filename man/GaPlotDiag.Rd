\name{GaPlotDiag}

\alias{GaPlotDiag}

\title{Diagnosis plots for lambda, u, c and epsilon}

\description{
Informative plots for hazard rate (lambda), latent variable (u), dependence variable (c) and the parameter of the hierarchical model epsilon.
}

\usage{
GaPlotDiag(M, variable = "lambda", pos = 1)
}

\arguments{
  \item{M}{List. Contains the information given for lambda and u by \code{GaMRes}.}
  \item{variable}{Either "lambda", "u", "c" or "epsilon". Variable for which informative plot will be shown.}
  \item{pos}{Positive integer. Position of the selected \code{variable} to be plotted.}
}

\details{This function returns a diagnosis plot for which the chain for the selected variable can be monitored. Diagnosis includes trace, ergodic mean, autocorrelation function and histogram.
}

\references{
- Nieto-Barajas, L. E. & Walker, S. G. (2002). Markov beta and gamma processes for modelling hazard rates. \emph{Scandinavian Journal of Statistics} \strong{29}: 413-424.
}

\seealso{\link{GaMRes}}

\examples{ 
## Simulations may be time intensive. Be patient.

## Example 1
#  data(gehan)
#  timesG <- gehan$time[gehan$treat == "6-MP"]
#  deltaG <- gehan$cens[gehan$treat == "6-MP"]
#  GEX1 <- GaMRes(timesG, deltaG, K = 8, iterations = 3000)
#  GaPlotDiag(GEX1, variable = "lambda", pos = 2)
#  GaPlotDiag(GEX1, variable = "u", pos = 5)

## Example 2
#  data(leukemiaFZ)
#  timesFZ <- leukemiaFZ$time
#  deltaFZ <- leukemiaFZ$delta
#  GEX2 <- GaMRes(timesFZ, deltaFZ, type.c = 4)
#  GaPlotDiag(GEX2, variable = "lambda", pos = 2)
#  GaPlotDiag(GEX2, variable = "u", pos = 3)
}