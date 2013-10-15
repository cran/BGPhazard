\name{PlotTheta}
\alias{PlotTheta}
\title{Plots for the varying covariates}
\description{Plots density and histogram for one or all varying covariates.}
\usage{PlotTheta(M, i = 1, plot.all = TRUE)}

\arguments{
    \item{M}{List. Contains the information given for lambda and u by \code{CGaMRes}}
  \item{i}{Integer. If \code{plot.all == FALSE}, only the ith position is plot}
  \item{plot.all}{Logical. If \code{TRUE} plots all \code{p} varying covariates}
}

\references{
1. Nieto-Barajas, L. E. & Walker, S. G. (2002). Markov beta and gamma processes for modelling hazard rates. Scandinavian Journal of Statistics 29, 413-424.

2. Nieto-Barajas, L. E. (2003). Discrete time Markov gamma processes and time dependent covariates in survival analysis. Bulletin of the International Statistical Institute 54th Session. Berlin. (CD-ROM)
}

\seealso{\link{CGaMRes}}


\examples{
# leukemia1 <- read.table("http://allman.rhon.itam.mx/~lnieto/index_archivos/Leucemia.txt",
# header = TRUE)
# leukemia1 <- as.matrix(cbind(leukemia1[, 1:3], log(leukemia1[, 4])))
# M <- CGaMRes(data = leukemia1, K = 10)
# PlotTheta(M)
}
