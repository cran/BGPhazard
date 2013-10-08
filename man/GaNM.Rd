\name{GaNM}
\alias{GaNM}
\title{n and m vectors for the gamma process}
\description{Computes n and m vectors as described by Nieto and Walker (2002).}
\usage{GaNM(times, delta, type.t, K)}
\references{Nieto-Barajas, L. E. & Walker, S. G. (2002). Markov beta and gamma processes for modelling hazard rates. Scandinavian Journal of Statistics 29, 413-424.}
\value{
\item{n}{Numeric vector. Reflects how observations are distributed by interval.}
\item{m}{Numeric vector. Returns a \emph{cummulative lifetime} of the observations that falls into the corresponding interval.}
\item{tao}{Numeric vector. Time axis partition.}
\item{t.unc}{Numeric vector. Uncensored times sorted ascendengly.} 
}
\keyword{ internal }