\name{BeNM}
\alias{BeNM}
\title{n and m vectors for the beta process}
\description{Computes n and m vectors as described by Nieto and Walker (2002).}
\usage{BeNM(times, delta)}
\references{Nieto-Barajas, L. E. & Walker, S. G. (2002). Markov beta and gamma processes for modelling hazard rates. Scandinavian Journal of Statistics 29, 413-424.}
\value{
\item{n}{Numeric vector. Reflects how observations are distributed by interval.}
\item{m}{Numeric vector. Returns a \emph{cummulative lifetime} of the observations that fall into the corresponding interval.}
\item{tao}{Numeric vector. Time axis partition.}
\item{K}{Partition length.}
\item{t.unc}{Numeric vector. Uncensored times sorted ascendengly.} 
}
\keyword{ internal }