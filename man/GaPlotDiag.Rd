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
Nieto-Barajas, L. E. & Walker, S. G. (2002). Markov beta and gamma processes for modelling hazard rates. Scandinavian Journal of Statistics 29, 413-424.
}

\seealso{\link{GaMRes}}

\examples{ 
## Computing examples is time intensive. Be patient.
## require(MASS)
## data1 <- gehan[gehan[,4] == "6-MP", 2:3]
## times <- data1[, 1]
## delta <- data1[, 2]
## EX <- GaMRes(times, delta, K = 8, iterations = 3000)
## GaPlotDiag(EX, variable = "lambda", pos = 2)
## GaPlotDiag(EX, variable = "u", pos = 5)
}