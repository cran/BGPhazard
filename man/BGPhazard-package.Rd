\name{BGPhazard-package}

\alias{BGPhazard-package}

\alias{BGPhazard}

\docType{package}

\title{Markov beta and gamma processes for modeling hazard rates}

\description{Computes the hazard rate estimate as described by Nieto-Barajas & Walker (2002) and Nieto-Barajas (2003).}

\details{
  \tabular{ll}{
    Package: \tab BGPhazard\cr
    Type: \tab Package\cr
    Version: \tab 0.9.2\cr
    Date: \tab 2013-11-25\cr
    License: \tab GPL version 2 or later\cr
  }
}

\author{
Garcia-Bueno, J. A. & Nieto-Barajas, L. E.

Maintainer: Jose Antonio Garcia Bueno <joseagbueno@gmail.com>
}

\references{
1. Nieto-Barajas, L. E. & Walker, S. G. (2002). Markov beta and gamma processes for modelling hazard rates. Scandinavian Journal of Statistics 29, 413-424.

2. Nieto-Barajas, L. E. (2003). Discrete time Markov gamma processes and time dependent covariates in survival analysis. Bulletin of the International Statistical Institute 54th Session. Berlin. (CD-ROM)
}

\keyword{ package }

\examples{
## Computing examples is time intensive. Be patient.
## require(MASS)
## data1 <- gehan[gehan[,4] == "6-MP", 2:3]
## times <- data1[, 1]
## delta <- data1[, 2]
## EX <-GaMRes(times, delta, type.t = 2, type.c = 3, K = 35, iterations = 3000)
## GaPloth(EX, confint = FALSE)
}