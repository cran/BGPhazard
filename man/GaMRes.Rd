\name{GaMRes}

\alias{GaMRes}

\title{Markov Gamma Model Summary}

\description{
Summary of the full Bayesian non-parametric Markov gamma survival analysis.
}

\usage{
GaMRes(times, delta = rep(1, length(times)), type.t = 1, K = 5, 
alpha = rep(0.0001, K.aux), beta = rep(1e-04, K.aux),
c.r = rep(0, (K.aux - 1)), type.c = 4, epsilon = 1, iterations = 1000,
burn.in = floor(iterations * 0.2), thinning = TRUE, thpar = 5, printtime = TRUE)
}

\arguments{
  \item{times}{Numeric positive vector. Failure times.}
  \item{delta}{Logical vector. Status indicator. \code{TRUE} (1) indicates exact lifetime is known, \code{FALSE} (0) indicates that the corresponding failure time is right censored.}
  \item{type.t}{Integer. 1=computes same length intervals; 2=unitary length intervals and 3=uniformly-dense intervals.}
  \item{K}{Integer. Partition length for the hazard function if \code{type.t}=1 or \code{type.t}=3.} 
  \item{alpha}{Nonnegative entry vector. Small entries are recommended in order to specify a non-informative prior distribution.}
  \item{beta}{Nonnegative entry vector. Small entries are recommended in order to specify a non-informative prior distribution.}
  \item{c.r}{Correlation vector. Its entries must be nonnegative integers.}
  \item{type.c}{1=defines \code{c.r} as a zero-entry vector; 2=lets the user define \code{c.r} feeely; 3=defines \code{c.r} by computing an exponential distribution with mean 1; 4=defines \code{c.r} by computing an exponential distribution with mean \code{epsilon}.}
  \item{epsilon}{Double. Mean of the exponential distribution assigned to \code{c.r} when \code{type.c}=4.}
  \item{iterations}{Integer. Number of iterations including the \code{burn.in} to be computed by the model.}
  \item{burn.in}{Integer. Length of the burn-in period for the Markov chain.}
  \item{thinning}{Logical. \code{TRUE} thins the Markov chain to reduce autocorrelation.}
  \item{thpar}{Integer. Factor by which the chain will be thinned if \code{thinning}=\code{TRUE}.}
  \item{printtime}{Logical. If \code{TRUE}, prints out the execution time.}
}

\details{Computes the Gibbs sampler given by the full conditional distributions of u and lambda (Nieto-Barajas & Walker, 2002) and arranges the resulting Markov chain into a matrix which can be used to obtain posterior summaries.
}

\value{
  \item{times}{Numeric vector. Failure times.}
  \item{delta}{Numeric vector. Status indicator.}
  \item{type.t}{Integer.}
  \item{tao}{Numeric vector. Partition for hazard function's support.}
  \item{K}{Integer. Partition length.}
  \item{t.unc}{Numeric vector. Uncensored failure times sorted ascendingly.}
  \item{iterations}{Integer.}
  \item{summary}{Numeric matrix. Contains the resulting Markov chain for lambda, u, c.r and epsilon (if applicable).}
  \item{S}{Numeric matrix. Survival estimates for each state of the chain.}
}

\references{
Nieto-Barajas, L. E. & Walker, S. G. (2002). Markov beta and gamma processes for modelling hazard rates. Scandinavian Journal of Statistics 29, 413-424.
}

\note{
It is recommended to verify chain's stationarity. This can be done by checking each partition element individually. See \code{\link{GaPlotDiag}}.
}

\seealso{
\link{GaPlotDiag}, \link{GaPloth}
}

\examples{
## Computing examples is time intensive. Be patient.
## require(MASS)
## data1 <- gehan[gehan[,4] == "6-MP", 2:3]
## times <- data1[, 1]
## delta <- data1[, 2]
## EX <- GaMRes(times, delta, K = 8, iterations = 3000)
## EX <- GaMRes(times, delta, type.t = 2, type.c = 2, K=35, 
## alpha = rep(0.0001, 35), beta=rep(0.0001, 35), c.r = rep(10, 34),
## iterations = 3000)
}