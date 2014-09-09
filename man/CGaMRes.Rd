\name{CGaMRes}

\alias{CGaMRes}

\title{Markov Gamma Model with Time Dependent Covariates Summary}

\description{
Summary of the full Bayesian non-parametric Markov gamma with time dependent covariates survival analysis.
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
  \item{type.c}{1=defines \code{c.r} as a zero-entry vector; 2=lets the user define \code{c.r} feeely; 3=defines \code{c.r} by computing an exponential distribution with mean 1; 4=defines \code{c.r} by computing an exponential distribution with mean \code{epsilon}.}
  \item{epsilon}{Double. Mean of the exponential distribution assigned to \code{c.r} when \code{type.c}=4.}
  \item{iterations}{Integer. Number of iterations including the \code{burn.in} to be computed by the model.}
  \item{burn.in}{Integer. Length of the burn-in period for the Markov chain.}
  \item{thinning}{Logical. \code{TRUE} thins the Markov chain to reduce autocorrelation.}
  \item{thpar}{Integer. Factor by which the chain will be thinned if \code{thinning}=\code{TRUE}.}
  \item{printtime}{Logical. If \code{TRUE}, prints out the execution time.}
}

\details{Computes the Gibbs sampler given by the full conditional distributions of h, lambda and theta (Nieto-Barajas, 2003) and arranges the resulting Markov chain into a matrix which can be used to obtain posterior summaries.
}

\value{
  \item{times}{Numeric vector. Failure times.}
  \item{delta}{Numeric vector. Status indicator.}
  \item{covar}{Numeric matrix. Matrix of time dependent covariates.}
  \item{type.t}{Integer.}
  \item{tao}{Numeric vector. Partition for hazard function's support.}
  \item{K}{Integer. Partition length.}
  \item{t.unc}{Numeric vector. Uncensored failure times sorted ascendingly.}
  \item{iterations}{Integer.}
  \item{summary}{Numeric matrix. Contains the resulting Markov chain for lambda, u, c.r and epsilon (if applicable).}
  \item{S}{Numeric matrix. Survival estimates for each state of the chain.}
  \item{H}{Numeric matrix. Cummulative hazard rate estimates for each state of the chain.}
  \item{p}{Integer. Number of dependent covariates for the data set given.}
}

\references{
1. Nieto-Barajas, L. E. & Walker, S. G. (2002). Markov beta and gamma processes for modelling hazard rates. Scandinavian Journal of Statistics 29, 413-424.

2. Nieto-Barajas, L. E. (2003). Discrete time Markov gamma processes and time dependent covariates in survival analysis. Bulletin of the International Statistical Institute 54th Session. Berlin. (CD-ROM)
}

\note{
It is recommended to verify chain's stationarity. This can be done by checking each partition element individually. See \code{\link{CGaPlotDiag}}.
}

\seealso{
\link{CGaPlotDiag}, \link{CGaPloth}
}

\examples{
## Simulations may be time intensive. Be patient.
## leukemia1 <- read.table("http://allman.rhon.itam.mx/~lnieto/index_archivos/Leucemia.txt",
## header = TRUE)
## leukemia1 <- as.matrix(cbind(leukemia1[, 1:3], log(leukemia1[, 4])))
## EX <- CGaMRes(data = leukemia1, K = 10, iterations = 3000)
}