\name{CGaM}
\alias{CGaM}
\title{n vector for the gamma process with time dependent covariates}
\description{Computes m vector as described by Nieto-Barajas (2003).}
\usage{CGaM(times, delta, type.t, K, covar, theta)}
\references{
1. Nieto-Barajas, L. E. & Walker, S. G. (2002). Markov beta and gamma processes for modelling hazard rates. Scandinavian Journal of Statistics 29, 413-424.

2. Nieto-Barajas, L. E. (2003). Discrete time Markov gamma processes and time dependent covariates in survival analysis. Bulletin of the International Statistical Institute 54th Session. Berlin. (CD-ROM)}
\value{
\item{n}{Numeric vector. Reflects how observations are distributed by interval.}
\item{m}{Numeric vector. Returns a \emph{cummulative lifetime} of the observations that falls into the corresponding interval.}
\item{tao}{Numeric vector. Time axis partition.}
\item{t.unc}{Numeric vector. Uncensored times sorted ascendengly.}
\item{covar}{Matrix of time dependent covariates.}
}
\keyword{internal}