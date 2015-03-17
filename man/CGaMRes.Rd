\name{CGaMRes}

\alias{CGaMRes}

\title{Markov Gamma Model with Covariates}

\description{
Posterior inference for the Bayesian non-parametric Markov gamma model
with covariates in survival analysis.
}

\usage{
CGaMRes(data, type.t = 1, K = 5, alpha = rep(0.001, K.aux), 
beta = rep(1e-04, K.aux), c.r = rep(0, K.aux - 1), type.c = 4, 
epsilon = 1, iterations = 1000, burn.in = floor(iterations * 0.2), 
thinning = TRUE, thpar = 3, printtime = TRUE)
}

\arguments{
  \item{data}{Numeric matrix. Contains failure times in the first column, status indicator in the second, and, from the third to the last column, the varying covariate(s).}
  \item{type.t}{Integer. 1=computes uniformly-dense intervals; 2=unitary length intervals and 3=same length intervals.}
  \item{K}{Integer. Partition length for the hazard function if \code{type.t}=1 or \code{type.t}=3.} 
  \item{alpha}{Nonnegative entry vector. Small entries are recommended in order to specify a non-informative prior distribution.}
  \item{beta}{Nonnegative entry vector. Small entries are recommended in order to specify a non-informative prior distribution.}
  \item{c.r}{Correlation vector. Its entries must be nonnegative integers.}
  \item{type.c}{1=defines \code{c.r} as a zero-entry vector; 2=lets the user define \code{c.r} feeely; 3=defines \code{c.r} by computing an exponential distribution with mean 1; 4=defines \code{c.r} by computing an exponential distribution with mean \code{epsilon} which has assigned a Ga(0.01, 0.01) distribution.}
  \item{epsilon}{Double. Mean of the exponential distribution assigned to \code{c.r} when
\code{type.c = 3}. When \code{type.c = 4}, epsilon is assigned a Ga(0.01,0.01) distribution.}
  \item{iterations}{Integer. Number of iterations including the \code{burn.in} to be computed by the model.}
  \item{burn.in}{Integer. Length of the burn-in period for the Markov chain.}
  \item{thinning}{Logical. \code{TRUE} thins the Markov chain to reduce autocorrelation.}
  \item{thpar}{Integer. Factor by which the chain will be thinned if \code{thinning}=\code{TRUE}.}
  \item{printtime}{Logical. If \code{TRUE}, prints out the execution time.}
}

\details{Computes the Gibbs sampler given by the full conditional distributions of h, lambda and theta (Nieto-Barajas, 2003) and arranges the resulting Markov chain into a matrix which can be used to obtain posterior summaries. Prior distributions for the coefficients (theta) are assumend independent normals with zero mean and standard deviation 10.
}

\value{
  \item{times}{Numeric vector. Failure times.}
  \item{delta}{Numeric vector. Status indicator.}
  \item{covar}{Numeric matrix. Matrix of covariates.}
  \item{type.t}{Integer.}
  \item{tao}{Numeric vector. Partition for hazard function's support.}
  \item{K}{Integer. Partition length.}
  \item{t.unc}{Numeric vector. Uncensored failure times sorted ascendingly.}
  \item{iterations}{Integer.}
  \item{summary}{Numeric matrix. Contains the resulting Markov chain for lambda, u, c.r, epsilon (if applicable) and the coefficients.}
  \item{S}{Numeric matrix. Survival estimates for each state of the chain.}
  \item{H}{Numeric matrix. Cummulative hazard rate estimates for each state of the chain.}
  \item{p}{Integer. Number of covariates for the data set given.}
}

\references{
- Nieto-Barajas, L. E. (2003). Discrete time Markov gamma processes and time dependent covariates in survival analysis. \emph{Bulletin of the International Statistical Institute 54th Session}. Berlin. (CD-ROM).

- Nieto-Barajas, L. E. & Walker, S. G. (2002). Markov beta and gamma processes for modelling hazard rates. \emph{Scandinavian Journal of Statistics} \strong{29}: 413-424.
}

\note{
It is recommended to verify chain's stationarity. This can be done by checking each partition element individually. See \code{\link{CGaPlotDiag}} To obtain posterior summaries of the coefficients use function \code{\link{PlotTheta}}.
}

\seealso{
 \link{PlotTheta}, \link{CGaPlotDiag}, \link{CGaPloth}
}

\examples{
## Simulations may be time intensive. Be patient.

## Example 1
#  data(leukemiaFZ)
#  leukemia1 <- leukemiaFZ
#  leukemia1$wbc <- log(leukemiaFZ$wbc)
#  CGEX1 <- CGaMRes(data = leukemia1, K = 10, iterations = 10000, thpar = 10)

## Example 2. Refer to "Cox-gamma model example" section in package vignette for details.
#  SampWeibull <- function(n, a = 10, b = 1, beta = c(1, 1)) {
#    M <- matrix(0, ncol = 7, nrow = n)
#    for(i in 1:n){
#      M[i, 1] <- i
#      M[i, 2] <- x1 <- runif(1)
#      M[i, 3] <- x2 <- runif(1)
#      M[i, 4] <- rweibull(1, shape = b, 
#                          scale = 1 / (a * exp(cbind(x1, x2) %*% beta)))
#      M[i, 5] <- rexp(1)
#      M[i, 6] <- M[i, 4] > M[i, 5]
#      M[i, 7] <- min(M[i, 4], M[i, 5])
#      }
#    colnames(M) <- c("i", "x_i1", "x_i2", "t_i", "c_i", "delta", "min{c_i, d_i}")
#    return(M)
#  }
#  dat <- SampWeibull(100, 0.1, 1, c(1, 1))
#  dat <- cbind(dat[, c(4, 6)], dat[, c(2, 3)])
#  CG <- CGaMRes(dat, K = 10, iterations = 3000, thpar = 10)
}