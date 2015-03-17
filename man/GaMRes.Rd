\name{GaMRes}

\alias{GaMRes}

\title{Markov Gamma Model}

\description{
Posterior inference for the Bayesian non-parametric Markov gamma model in survival analysis.
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
  \item{type.t}{Integer. 1=uniformly-dense intervals; 2=unitary length intervals and 3=computes same length intervals.}
  \item{K}{Integer. Partition length for the hazard function if \code{type.t}=1 or \code{type.t}=3.} 
  \item{alpha}{Nonnegative entry vector. Small entries are recommended in order to specify a non-informative prior distribution.}
  \item{beta}{Nonnegative entry vector. Small entries are recommended in order to specify a non-informative prior distribution.}
  \item{c.r}{Correlation vector. Its entries must be nonnegative integers.}
  \item{type.c}{1=defines \code{c.r} as a zero-entry vector; 2=lets the user define \code{c.r} feeely; 3=defines \code{c.r} by computing an exponential distribution with mean 1; 4=defines \code{c.r} by computing an exponential distribution with mean \code{epsilon} which has assigned a Ga(0.01, 0.01) distribution.}
  \item{epsilon}{Double. Mean of the exponential distribution assigned to \code{c.r} when
\code{type.c = 3}. When \code{type.c = 4}, \code{epsilon} is assigned a Ga(0.01,0.01) distribution.}
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
- Nieto-Barajas, L. E. & Walker, S. G. (2002). Markov beta and gamma processes for modelling hazard rates. \emph{Scandinavian Journal of Statistics} \strong{29}: 413-424.
}

\note{
It is recommended to verify chain's stationarity. This can be done by checking each partition element individually. See \code{\link{GaPlotDiag}}.
}

\seealso{
\link{GaPlotDiag}, \link{GaPloth}
}

\examples{
## Simulations may be time intensive. Be patient.

## Example 1
#  data(gehan)
#  timesG <- gehan$time[gehan$treat == "6-MP"]
#  deltaG <- gehan$cens[gehan$treat == "6-MP"]
#  GEX1 <- GaMRes(timesG, deltaG, K = 8, iterations = 3000)

## Example 2
#  data(leukemiaFZ)
#  timesFZ <- leukemiaFZ$time
#  deltaFZ <- leukemiaFZ$delta
#  GEX2 <- GaMRes(timesFZ, deltaFZ, type.c = 4)
}