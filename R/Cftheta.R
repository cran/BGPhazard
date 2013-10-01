Cftheta <-
function(theta, lambda.r, times, delta, type.t, K, covar) {
  m <- CGaM(times, delta, type.t, K, covar, theta)
  p <- length(theta)
  theta <- rep(0, p)
  for(s in 1:p){
    theta[s] <- rnorm(n = 1, mean = 0, sd = sqrt(10)) + 
      exp(sum(covar[delta==1, s] * theta[s]) - sum(lambda.r * m))
  }
  return(theta)
}
