\name{BGPhazard-package}

\alias{BGPhazard-package}

\alias{BGPhazard}

\docType{package}

\title{Markov Beta and Gamma Processes for Modeling Hazard Rates}

\description{Computes the hazard rate estimate as described by Nieto-Barajas 
and Walker (2002) and Nieto-Barajas (2003).}

\details{
  \tabular{ll}{
    Package: \tab BGPhazard\cr
    Type: \tab Package\cr
    Version: \tab 1.2.3\cr
    Date: \tab 2016-02-11\cr
    License: \tab GPL version 2 or later\cr
  }
}

\author{
Garcia-Bueno, J. A. and Nieto-Barajas, L. E.

Maintainer: Jose Antonio Garcia Bueno <\email{joseagbueno@gmail.com}>
}

\references{

- Feigl, P. and Zelen, M. (1965). Estimation of Exponential Survival Probabilities with Concomitant Information. \emph{Biometrics} \strong{21}: 826-838.

- Freireich, E. J., et al. (1963). The effect of 6-mercaptopurine on the duration of steroid-induced remissions in acute leukemia: A model for evaluation of other potentially useful therapy. \emph{Blood}, \strong{21(6)}: 699-716.

- Klein, J. P., & Moeschberger, M. L. (2003). Survival analysis: techniques for censored and truncated data. Springer Science & Business Media. 

- Lawless, J.F. (2003). Statistical Models and Methods for Lifetime Data. Wiley: New Jersey.

- Nieto-Barajas, L. E. (2003). Discrete time Markov gamma processes and time dependent covariates in survival analysis. \emph{Bulletin of the International Statistical Institute 54th Session}. Berlin. (CD-ROM).

- Nieto-Barajas, L. E. & Walker, S. G. (2002). Markov beta and gamma processes for modelling hazard rates. \emph{Scandinavian Journal of Statistics} \strong{29}: 413-424.

- Tsuang, M. T. and Woolson, R. F. (1977). Mortality in Patients with Schizophrenia, Mania and
Depression. \emph{British Journal of Psychiatry}, \strong{130}: 162-166.

- Woolson, R. F. (1981). Rank Tests and a One-Sample Log Rank Test for Comparing Observed
Survival Data to a Standard Population. \emph{Biometrics} \strong{37}: 687-696.
}

\keyword{ package }

\examples{
## The list of active function is {BeMRes, BePlotDiag, BePloth, GaMRes, GaPlotDiag,
## GaPloth, CGaMRes, CGaPlotDiag, CGaPloth, CGaPred, PlotTheta}. The list of data sets
## is {gehan, psych and leukemiaFZ}.

## Simulations may be time intensive. Be patient.

## Example 1
#  data(leukemiaFZ)
#  timesFZ <- leukemiaFZ$time
#  deltaFZ <- leukemiaFZ$delta
#  GEX2 <- GaMRes(timesFZ, deltaFZ, type.c = 4)
#  GaPloth(GEX2, fun = "both", confint = TRUE)

## Example 2
#  data(gehan)
#  timesG <- gehan$time[gehan$treat == "control"]
#  deltaG <- gehan$cens[gehan$treat == "control"]
#  BEX2 <- BeMRes(timesG, deltaG, type.c = 2, c.r = rep(50, 22))
#  BePloth(BEX2, confint = TRUE, confidence = 0.95)

## Example 3
#  data(leukemiaFZ)
#  leukemia1 <- leukemiaFZ
#  leukemia1$wbc <- log(leukemiaFZ$wbc)
#  CGEX1 <- CGaMRes(data = leukemia1, K = 10, iterations = 10000, thpar = 10)
#  CGaPloth(CGEX1, fun = "both", confint = TRUE)
#  PlotTheta(CGEX1)

## Example 4. Refer to "Cox-gamma model example" section in package vignette for details.
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
#  CGaPloth(CG)
#  PlotTheta(CG)
#  CGaPred(CG)
}