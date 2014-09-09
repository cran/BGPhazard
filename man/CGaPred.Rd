\name{CGaPred}
\alias{CGaPred}
\title{Predictive hazard function}
\description{Estimates the hazard function for a given vector of covariates.}
\usage{CGaPred(M, xf = "median", confidence = 0.95)}

\arguments{
  \item{M}{List. Contains the information given for lambda and u by \code{CGaMRes}.}
  \item{xf}{Vector. Varying covariates that are used to generate the predictive hazard function estimate.}
  \item{confidence}{Numeric. Confidence band width.}
}
\details{
If no vector of varying covariates is specified, a vector of medians of each covariate will be taken.
}
\value{
\item{theta.summary}{Numeric matrix. Summary for the regression coefficients.}
\item{h.xf}{Numeric vector. Estimate for the hazard function given covariates vector \code{xf}.}
\item{S.xf}{Numeric vector. Estimate for the survival function given covariates vector \code{xf}.}
}
\references{
1. Nieto-Barajas, L. E. & Walker, S. G. (2002). Markov beta and gamma processes for modelling hazard rates. Scandinavian Journal of Statistics 29, 413-424.

2. Nieto-Barajas, L. E. (2003). Discrete time Markov gamma processes and time dependent covariates in survival analysis. Bulletin of the International Statistical Institute 54th Session. Berlin. (CD-ROM)
}

\seealso{
\code{\link{CGaMRes}}, \code{\link{CLambdaSumm}}
}

\examples{
## Simulations may be time intensive. Be patient.
## leukemia1 <- read.table("http://allman.rhon.itam.mx/~lnieto/index_archivos/Leucemia.txt",
## header = TRUE)
## leukemia1 <- as.matrix(cbind(leukemia1[, 1:3], log(leukemia1[, 4])))
## EX <- CGaMRes(data = leukemia1, K = 10, iterations = 3000)
## CGaPred(EX)
}