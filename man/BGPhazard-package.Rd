\name{BGPhazard-package}

\alias{BGPhazard-package}

\alias{BGPhazard}

\docType{package}

\title{Markov beta and gamma processes for modelling hazard rates}

\description{Computes the hazard rate estimate as described by Nieto-Barajas, L. E. & Walker, S. G. (2002) and Nieto (2003).}

\details{
  \tabular{ll}{
    Package: \tab BGPhazard\cr
    Type: \tab Package\cr
    Version: \tab 0.9.1\cr
    Date: \tab 2013-10-15\cr
    License: \tab GLP-2\cr
  }

}

\author{
Garcia Bueno, J. A. & Nieto-Barajas, L. E.

Maintainer: Jose Antonio Garcia Bueno <joseagbueno@gmail.com>
}

\references{
1. Nieto-Barajas, L. E. & Walker, S. G. (2002). Markov beta and gamma processes for modelling hazard rates. Scandinavian Journal of Statistics 29, 413-424.

2. Nieto-Barajas, L. E. (2003). Discrete time Markov gamma processes and time dependent covariates in survival analysis. Bulletin of the International Statistical Institute 54th Session. Berlin. (CD-ROM)
}

\keyword{ package }

\examples{
## Examples are computing intensive. Be patient.
## require(KMsurv)
## data(psych)
## times <- psych[, 3]
## delta <- psych[, 4]
## EX <- BeMRes(times, delta)
## GaPloth(EX, confint = FALSE)
}