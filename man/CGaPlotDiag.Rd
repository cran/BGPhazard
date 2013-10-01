\name{CGaPlotDiag}

\alias{CGaPlotDiag}

\title{Diagnosis plots for lambda, u, c, epsilon and theta}

\description{
Informative plots for hazard rate (Pi), latent variable (u), dependence variable (c), parameter of the hierarchical model (epsilon) and regression coefficients (theta).
}

\usage{
CGaPlotDiag(M, variable = "lambda", pos = 1)
}

\arguments{
  \item{M}{List. Contains the information given for lambda and u by \code{CGaMRes}}
  \item{variable}{Either "lambda", "u", "c", "epsilon" or "theta". Variable for which informative plot will be shown.}
  \item{pos}{Positive integer. Position of the selected \code{variable} to be plotted.}
}

\details{This function returns a diagnosis plot for which the chain for the selected variable can be monitored. Diagnosis includes trace, ergodic mean, autocorrelation function and histogram.
}

\references{
1. Nieto-Barajas, L. E. & Walker, S. G. (2002). Markov beta and gamma processes for modelling hazard rates. Scandinavian Journal of Statistics 29, 413-424.

2. Nieto-Barajas, L. E. (2003). Discrete time Markov gamma processes and time dependent covariates in survival analysis. Bulletin of the International Statistical Institute 54th Session. Berlin. (CD-ROM)
}

\author{
Garcia-Bueno, J.A. & Nieto-Barajas, L.E.
}

\seealso{\link{CGaMRes}}

\examples{ 
## Examples are be computing intensive. Be patient.
## ACTUALIZAR
## require(MASS)
## data1 <- gehan[gehan[,4] == "6-MP", 2:3]
## times <- data1[, 1]; delta <- data1[, 2]
## EX <- GaMRes(times, delta)
## GaPlotDiag(EX, variable = "lambda", pos = 2)
## GaPlotDiag(EX, variable = "u", pos = 3)
## GaPlotDiag(EX, variable = "epsilon", pos = 1)
}