CUpdTheta <-
function(theta, lambda.r, times, delta, type.t, K, covar) {
  p <- length(theta)
  theta.r <- theta
  for(s in 1:p){
    theta.str <- theta.r
    theta.str[s] <- rnorm(n = 1, mean = theta[s], sd = sqrt(2)) 
    a <- Cftheta(theta.str, lambda.r, times, delta, type.t, K, covar)
    b <- Cftheta(theta.r, lambda.r, times, delta, type.t, K, covar)
    pr <- min(1,  a / b)
    if(runif(1) <= pr) {
      theta[s] <- theta.str[s]
    }
  }
  return(theta)
}
