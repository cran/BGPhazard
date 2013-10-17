PlotTheta <-
function(M, i = 1, plot.all = TRUE) {
  K <- M$K
  p <- M$p
  MS <- M$summary
  b <- 0
  c <- 1
  d <- p
  if(length(MS[, 1]) == 3 * K - 1 + p){
    b <- 1
  }
  if (plot.all == FALSE) {
    c <- d <- i
  }
  for(s in c:d){
    X <- MS[3 * K - 2 + b + s, ]
    hist(X, prob=TRUE, main = paste("Histogram and density for theta_", s, 
                                    sep = ""), 
         xlab = paste("theta_", s, sep = ""), col = "skyblue")
    lines(density(X), lwd=2)
    legend(x = "topright", legend = c("Histogram", "Density"), lty = c(0, 0), 
           col = c("skyblue", "white"), bty = "n", cex = 0.8, 
           fill = c("skyblue", 1))
    if(s < d) {
      par(mfrow = c(1, 1), ask = TRUE)
    }
  }
  par(mfrow = c(1, 1), ask = FALSE)
}
