CoxGammaSummary <-
function(M, s = 1, i = 1, confidence = 0.95, xf = "median") {
  K <- M$K
  p <- M$p
  covar <- M$covar
  MS <- M$summary
  iterations <- M$iterations
  prob <- (1 - confidence) / 2
  SUM <- CLambdaSumm(M, confidence)
  h.0 <- SUM$SUM.h[, 2]
  S.0 <- SUM$SUM.S[, 2]
  H.0 <- SUM$SUM.H[, 2]
  b <- 0
  theta.summary <- matrix(0, ncol = 5, nrow = p)
  if(iterations == 3 * K - 1 + p){
    b <- 1
  }
  X <- MS[3 * K - 2 + b + s, ]
  hist(X, prob=TRUE, main = paste("Histogram and density for theta_", s, 
                                  sep = ""), 
       xlab = paste("theta_", s, sep = ""), col = "skyblue")
  lines(density(X), lwd=2)
  legend(x = "topright", legend = c("Histogram", "Density"), lty = c(0, 0), 
         col = c("skyblue", "white"), bty = "n", cex = 0.8, 
         fill = c("skyblue", 1))
  for(i in 1:p) {
    theta.summary[i, 1] <- mean(MS[3 * K - 2 + b + i, ])
    theta.summary[i, 2] <- quantile(MS[3 * K - 2 + b + i, ], probs = prob)
    theta.summary[i, 3] <- quantile(MS[3 * K - 2 + b + i, ], probs = 1 - prob)
    theta.summary[i, 4] <- median(MS[3 * K - 2 + b + i, ])
    theta.summary[i, 5] <- sd(MS[3 * K - 2 + b + i, ])
  }
  colnames(theta.summary) <- c("mean", prob, 1- prob, "median", "sd")
  theta <- theta.summary[, 1]
  x.i <- covar[i ,]
  if (xf == "median") {
    xf <- 0
    for (i in 1:p) {
      xf[i] <- median(covar[, i])  
    }
  }
  h.i <- h.0 * exp(theta %*% x.i)
  S.i <- exp(- H.0 * exp(theta %*% x.i))
  h.xf <- h.0 * exp(theta %*% xf)
  S.xf <- exp(- H.0 * exp(theta %*% xf))
  out <- list(theta.summary = theta.summary, h.i = h.i, S.i = S.i, h.xf = h.xf, 
              S.xf = S.xf)
  return(out)
}
