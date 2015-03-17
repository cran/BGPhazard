\name{CGaPlotDiag}

\alias{CGaPlotDiag}

\title{Diagnosis plots for lambda, u, c, epsilon and theta}

\description{
Informative plots for hazard rate (Pi), latent variable (u), dependence variable (c), parameter of the hierarchical model (epsilon) and regression coefficients (theta).
}

\usage{
CGaPlotDiag(M, variable = "lambda", pos = 1)
}

\arguments{
  \item{M}{List. Contains the information given for lambda and u by \code{CGaMRes}}
  \item{variable}{Either "lambda", "u", "c", "epsilon" or "theta". Variable for which informative plot will be shown.}
  \item{pos}{Positive integer. Position of the selected \code{variable} to be plotted.}
}

\details{This function returns a diagnosis plot for which the chain for the selected variable can be monitored. Diagnosis includes trace, ergodic mean, autocorrelation function and histogram.
}

\references{
- Nieto-Barajas, L. E. (2003). Discrete time Markov gamma processes and time dependent covariates in survival analysis. \emph{Bulletin of the International Statistical Institute 54th Session}. Berlin. (CD-ROM).

- Nieto-Barajas, L. E. & Walker, S. G. (2002). Markov beta and gamma processes for modelling hazard rates. \emph{Scandinavian Journal of Statistics} \strong{29}: 413-424.
}

\seealso{\link{CGaMRes}}

\examples{ 
## Simulations may be time intensive. Be patient.

## Example 1
#  data(leukemiaFZ)
#  leukemia1 <- leukemiaFZ
#  leukemia1$wbc <- log(leukemiaFZ$wbc)
#  CGEX1 <- CGaMRes(data = leukemia1, K = 10, iterations = 10000, thpar = 10)
#  CGaPlotDiag(CGEX1, variable = "lambda", pos = 2)
#  CGaPlotDiag(CGEX1, variable = "u", pos = 3)
}