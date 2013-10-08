\name{CoxGammaSummary}
\alias{CoxGammaSummary}
\title{Theta summary}
\description{
Return a summary for the regression coefficient theta for the Gamma process with time dependent covariates.
}
\usage{
CoxGammaSummary(M, s = 1, i = 1, confidence = 0.95, xf = "median")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{M}{List. Contains the information given by \code{BeMRres}.}
  \item{s}{Integer. Covariate for which plots will be shown.}
  \item{i}{Integer. Observation used to generate predictive distribution.}
  \item{confidence}{Confidence level}
  \item{xf}{Vector.}
}
\details{
***DETALLAR
}
\value{
\item{theta.summary}{DET}
\item{h.i}{DET}
\item{S.i}{DET}
\item{h.xf}{DET}
\item{S.xf}{DET}
}

\references{
1. Nieto-Barajas, L. E. & Walker, S. G. (2002). Markov beta and gamma processes for modelling hazard rates. Scandinavian Journal of Statistics 29, 413-424.

2. Nieto-Barajas, L. E. (2003). Discrete time Markov gamma processes and time dependent covariates in survival analysis. Bulletin of the International Statistical Institute 54th Session. Berlin. (CD-ROM)
}

\author{Garcia-Bueno, J. A. and Nieto-Barajas, L. E.}

\seealso{
\code{\link{CGaMRes}}, \code{\link{CGaPlotDiag}}
}
\examples{
1*1
}