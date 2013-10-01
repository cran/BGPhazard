\name{BGPhazard-package}

\alias{BGPhazard-package}

\alias{BGPhazard}

\docType{package}

\title{
Markov beta, gamma processes for modelling hazard rates
}

\description{
Computes the hazard rate estimate as described by Nieto-Barajas, L.E. & Walker, S.G. (2002) and by Nieto (2003).
}

\details{
  \tabular{ll}{
    Package: \tab BGPhazard\cr
    Type: \tab Package\cr
    Version: \tab 0.9.0\cr
    Date: \tab 2013-10-01\cr
    License: \tab GLP-2\cr
  }
Tests. Preview.
}

\author{
Garcia-Bueno, J.A. & Nieto-Barajas, L.E.

Maintainer: Garcia-Bueno, J.A. <joseagbueno@gmail.com>
}

\references{
1. Nieto-Barajas, L. E. & Walker, S. G. (2002). Markov beta and gamma processes for modelling hazard rates. Scandinavian Journal of Statistics 29, 413-424.

2. Nieto-Barajas, L. E. (2003). Discrete time Markov gamma processes and time dependent covariates in survival analysis. Bulletin of the International Statistical Institute 54th Session. Berlin. (CD-ROM)
}

\keyword{ package }

\examples{
require(MASS)
data1 <- gehan[gehan[,4] == "6-MP", 2:3]
times <- data1[, 1]; delta <- data1[, 2]
EX <- GaMRes(times, delta)
BePloth(EX, confint = FALSE)
}