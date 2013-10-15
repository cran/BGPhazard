\name{BeMRes}

\alias{BeMRes}

\title{Markov Beta Model Summary}

\description{
Summary for the full Bayesian non-parametric Markov beta survival analysis.
}

\usage{
BeMRes(times, delta = rep(1, length(times)), alpha = rep(1e-04, K), 
beta = rep(1e-04, K), c.r = rep(0, K), type.c = 4, epsilon = 1, 
iterations = 1000, burn.in = floor(iterations * 0.2), thinning = TRUE, 
thpar = 5, printtime = TRUE)
}

\arguments{
  \item{times}{Numeric positive vector. Failure times.}
  \item{delta}{Logical vector. Status indicator. \code{TRUE} (1) indicates exact lifetime is known, \code{FALSE} (0) indicates that the corresponding failure time is right censored.}
  \item{alpha}{Nonnegative vector. Small entries are recommended in order to specify a non-informative prior distribution.}
  \item{beta}{Nonnegative vector. Small entries are recommended in order to specify a non-informative prior distribution.}
  \item{c.r}{Nonnegative vector. The higher te entries, the higher te correlation of two consecutive intervals.}
  \item{type.c}{Integer. 1=defines \code{c.r} as a zero-entry vector; 2=lets the user define \code{c.r} feeely; 3=defines \code{c.r} by computing an exponential distribution with mean 1; 4=defines \code{c.r} by computing an exponential distribution with mean \code{epsilon}.}
  \item{epsilon}{Double. Mean of the exponential distribution assigned to \code{c.r} when \code{type.c}=4.}
  \item{iterations}{Integer. Number of iterations incluiding the \code{burn.in} to be computed by the model.}
  \item{burn.in}{Integer. Length of the burn-in period for the Markov chain.}
  \item{thinning}{Logical. \code{TRUE} thins the Markov chain to reduce autocorrelation.}
  \item{thpar}{Integer. Factor by which the chain will be thinned if \code{thinning}=\code{TRUE}.}
  \item{printtime}{Logical. If \code{TRUE}, prints out the execution time.}
}

\details{
Computes the Gibbs sampler given by the full conditional distributions of u and Pi (Nieto-Barajas & Walker, 2002), and arranges the resulting Markov chain into a matrix which can be useful to obtain posterior summaries.
}

\value{
  \item{times}{Numeric vector. Failure times.}
  \item{delta}{Numeric vector. Status indicator.}
  \item{tao}{Numeric vector. Partition for hazard function's support.}
  \item{K}{Integer. Partition length.}
  \item{t.unc}{Numeric vector. Uncensored failure times sorted ascendingly.}
  \item{iterations}{Integer.}
  \item{summary}{Numeric matrix. Contains the resulting Markov chain for Pi, u, c.r and epsilon (if applicable).}
  \item{S}{Numeric matrix. Survival estimates for each state of the chain.}
}

\references{
Nieto-Barajas, L. E. & Walker, S. G. (2002). Markov beta and gamma processes for modelling hazard rates. Scandinavian Journal of Statistics 29, 413-424.
}

\note{
It is recommended to verify chain's stationarity. This can be done by checking each partition element individually. See \code{\link{BePlotDiag}}.
}

\seealso{ 
\link{BePlotDiag}, \link{BePloth}
}

\examples{
## Examples are be computing intensive. Be patient.
## require(KMsurv)
## data(psych)
## times <- psych[, 3]
## delta <- psych[, 4]
## EX <- BeMRes(times, delta)
## EX <- BeMRes(times, delta, type.c = 2, alpha = rep(0.0001, 40),
## beta = rep(0.0001, 40), c.r = rep(10, 39))
}