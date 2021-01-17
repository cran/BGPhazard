## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width=8,
  fig.height=6,
  fig.align = "center"
)

## ----setup--------------------------------------------------------------------
library(BGPhazard)
library(dplyr)
library(ggplot2)

## -----------------------------------------------------------------------------
KIDNEY

## -----------------------------------------------------------------------------
bsb_init <- BSBInit(
  KIDNEY,
  alpha = 0.001,
  beta = 0.001,
  c = 1000,
  part_len = 10,
  seed = 42
  )

summary(bsb_init)

## -----------------------------------------------------------------------------
samples <- BSBHaz(
  bsb_init,
  iter = 100,
  burn_in = 10,
  gamma_d = 0.6, 
  theta_d = 0.3, 
  seed = 42
)

print(samples)

## -----------------------------------------------------------------------------
BSBSumm(samples, "omega1")
BSBSumm(samples, "lambda1")

## -----------------------------------------------------------------------------
BSBPlotSumm(samples, "lambda1")
BSBPlotSumm(samples, "lambda2")

## -----------------------------------------------------------------------------
BSBPlotSumm(samples, "s1")
BSBPlotSumm(samples, "s2")

## -----------------------------------------------------------------------------
BSBPlotDiag(samples, "omega1", type = "traceplot")
BSBPlotDiag(samples, "omega1", type = "ergodic_means")

