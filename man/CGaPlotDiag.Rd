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

\seealso{\link{CGaMRes}}

\examples{ 
## Simulations may be time intensive. Be patient.
## leukemia1 <- read.table("http://allman.rhon.itam.mx/~lnieto/index_archivos/Leucemia.txt",
## header = TRUE)
## leukemia1 <- as.matrix(cbind(leukemia1[, 1:3], log(leukemia1[, 4])))
## EX <- CGaMRes(data = leukemia1, K = 10, iterations = 3000)
## CGaPlotDiag(EX, variable = "lambda", pos = 2)
## CGaPlotDiag(EX, variable = "u", pos = 3)
}