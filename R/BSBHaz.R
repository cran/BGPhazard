#' BSBHaz posterior samples using Gibbs Sampler
#'
#' \code{BSBHaz} samples posterior observations from the bivariate survival
#' model (BSBHaz model) proposed by Nieto-Barajas & Walker (2007).
#'
#' BSBHaz (Nieto-Barajas & Walker, 2007) is a bayesian semiparametric model for
#' bivariate survival data. The marginal densities are nonparametric survival
#' models and the joint density is constructed via a mixture. Dependence between
#' failure times is modeled using two frailties, and the dependence between
#' these frailties is modeled with a copula.
#'
#' This command obtains posterior samples from model parameters. The samples
#' from omega, gamma, and theta are obtained using the Metropolis-Hastings
#' algorithm. The proposal distributions are uniform for the three parameters.
#' The parameters \code{omega_d}, \code{gamma_d} and \code{theta_d} modify the
#' intervals from which the uniform proposals are sampled. If these parameters
#' are too large, the acceptance rates will decrease and the chains will get
#' stuck. On the other hand, if these parameters are small, the acceptance rates
#' will be too high and the chains will not explore the posterior support
#' effectively.
#'
#' @param bsb_init An object of class 'BSBinit' created by
#'   \code{\link{BSBInit}}.
#' @param iter A positive integer. Number of samples generated by the Gibbs
#'   Sampler.
#' @param burn_in A positive integer. Number of iterations that should be
#'   discarded as burn in period.
#' @param omega_d A positive double. This parameter defines the interval used in
#'   the Metropolis-Hastings algorithm to sample proposals for omega. See
#'   details.
#' @param gamma_d A positive double. This parameter defines the interval used in
#'   the Metropolis-Hastings algorithm to sample proposals for gamma. See
#'   details.
#' @param theta_d A positive double. This parameter defines the interval used in
#'   the Metropolis-Hastings algorithm to sample proposals for theta. See
#'   details.
#' @param seed Random seed used in sampling.
#'
#' @return An object of class '\code{BSBHaz}' containing the samples from the
#'   variables of interest.
#' @export
#'
#' @examples
#' t1 <- survival::Surv(c(1, 2, 3))
#' t2 <- survival::Surv(c(1, 2, 3))
#'
#' init <- BSBInit(t1 = t1, t2 = t2, seed = 0)
#' samples <- BSBHaz(init, iter = 10, omega_d = 2,
#' gamma_d = 10, seed = 10)
BSBHaz <- function(bsb_init,
                   iter,
                   burn_in = 0,
                   omega_d = NULL,
                   gamma_d = NULL,
                   theta_d = NULL,
                   seed = 42){
  
  stopifnot(iter > burn_in)
  stopifnot(is.double(omega_d) & omega_d > 0)
  stopifnot(is.double(gamma_d) & gamma_d > 0)
  stopifnot(is.double(theta_d) & theta_d > 0)
  stopifnot(is.double(seed))
  if (!inherits(bsb_init, "BSBinit")) {
    stop("'bsb_init' must be an object created by BSBInit")
  }
  
  t1 <- bsb_init$t1
  t2 <- bsb_init$t2
  delta1 <- bsb_init$delta1
  delta2 <- bsb_init$delta2
  omega1 <- bsb_init$omega1
  omega2 <- bsb_init$omega2
  pred_matrix <- bsb_init$pred_matrix
  theta <- bsb_init$theta
  t_part <- bsb_init$t_part
  lambda1 <- bsb_init$lambda1
  lambda2 <- bsb_init$lambda2
  omega1 <- pmax(
    omega1, cum_h(t1, t_part, lambda1) * exp(pred_matrix %*% theta) + 1e-5
    )
  omega2 <- pmax(
    omega2, cum_h(t2, t_part, lambda2) * exp(pred_matrix %*% theta) + 1e-5
    )
  y <- bsb_init$y
  gamma <- bsb_init$gamma
  u1 <- bsb_init$u1
  u2 <- bsb_init$u2
  alpha <- bsb_init$alpha
  beta <- bsb_init$beta
  c <- bsb_init$c
  int_len <- t_part[[2]] - t_part[[1]]
  n_obs <- attr(bsb_init, "individuals")
  n_intervals <- attr(bsb_init, "intervals")
  has_predictors <- attr(bsb_init, "has_predictors")
  x <- list()
  for (i in 1:nrow(pred_matrix)) {
    x[[i]] <- pred_matrix[i, ]
  }
  
  # Outputs
  n_sim <- iter - burn_in
  omega1_mat <- matrix(rep(0, times = n_sim * n_obs), nrow = n_obs)
  omega2_mat <- matrix(rep(0, times = n_sim * n_obs), nrow = n_obs)
  lambda1_mat <- matrix(rep(0, times = n_sim * n_intervals), nrow = n_intervals)
  lambda2_mat <- matrix(rep(0, times = n_sim * n_intervals), nrow = n_intervals)
  gamma_mat <- matrix(rep(0, times = n_sim), nrow = 1)
  t1_mat <- matrix(rep(0, times = n_sim * n_obs), nrow = n_obs)
  t2_mat <- matrix(rep(0, times = n_sim * n_obs), nrow = n_obs)
  s1_mat <- matrix(rep(0, times = n_sim * (n_intervals + 1)), ncol = n_sim)
  s2_mat <- matrix(rep(0, times = n_sim * (n_intervals + 1)), ncol = n_sim)
  rownames(s1_mat) <- t_part
  rownames(s2_mat) <- t_part
  if (has_predictors) {
    theta_mat <-
      matrix(rep(0, times = n_sim * ncol(pred_matrix)), nrow = ncol(pred_matrix))
    rownames(theta_mat) <- colnames(pred_matrix)
  }
  
  p.bar <- progress::progress_bar$new(
    format = "[:bar] :current/:total (:percent)",
    total = iter
  )
  p.bar$tick(0)
  t1_current <- t1
  t2_current <- t2
  
  # Simulations
  set.seed(seed)
  for (i in 1:iter) {
    p.bar$tick(1)
    cum_h1 <- cum_h(t1_current, t_part, lambda1)
    cum_h2 <- cum_h(t2_current, t_part, lambda2)
    part_count1 <- partition_count(t1_current, t_part)
    part_count2 <- partition_count(t2_current, t_part)
    part_loc1 <- partition_location(t1_current, t_part)
    part_loc2 <- partition_location(t2_current, t_part)
    
    omega1 <-
      purrr::pmap_dbl(
        list(omega1, y, cum_h1, x),
        function(omega, y, cum_h, x) {
          sample_omega(omega, y, cum_h, x, theta, gamma, omega_d)
        }
      )
    omega2 <-
      purrr::pmap_dbl(
        list(omega2, y, cum_h2, x),
        function(omega, y, cum_h, x) {
          sample_omega(omega, y, cum_h, x, theta, gamma, omega_d)
        }
      )
    y <- purrr::map2_dbl(omega1, omega2, ~sample_y(.x, .y, gamma))
    
    t_part_low1 <- purrr::map_dbl(part_loc1, ~t_part[.])
    t_part_low2 <- purrr::map_dbl(part_loc2, ~t_part[.])
    u1_1 <- u1
    u1_2 <- c(0, u1[1:(length(u1) - 1)])
    u2_1 <- u2
    u2_2 <- c(0, u2[1:(length(u2) - 1)])
    c1 <- rep(c, times = length(lambda1))
    c2 <- c(0, c1[1:(length(c1) - 1)])
    
    for (j in seq_along(lambda1)) {
      bound1 <- get_min_bound(t1_current,
                              omega1,
                              x,
                              part_loc1,
                              t_part_low1,
                              j,
                              theta,
                              lambda1,
                              int_len)
      bound2 <- get_min_bound(t2_current,
                              omega2,
                              x,
                              part_loc2,
                              t_part_low2,
                              j,
                              theta,
                              lambda2,
                              int_len)
      lambda1[[j]] <- sample_lambda(
        u1_1[[j]], u1_2[[j]], alpha, beta, c1[[j]], c2[[j]], bound1,
        part_count1[[j]]
        )
      lambda2[[j]] <- sample_lambda(
        u2_1[[j]], u2_2[[j]], alpha, beta, c1[[j]], c2[[j]], bound2,
        part_count2[[j]]
      )
    }
    
    index_indicator <- c(rep(1, times = (length(u1) - 1)), 0)
    lambda1_lag <- c(lambda1[2:length(lambda1)], 1)
    lambda2_lag <- c(lambda2[2:length(lambda2)], 1)
    u1 <- purrr::pmap_dbl(
      list(lambda1, lambda1_lag, index_indicator),
      function(l, l1, index_indicator) {
        sample_u(l, l1, alpha, beta, c, index_indicator)
      }
    )
    u2 <- purrr::pmap_dbl(
      list(lambda2, lambda2_lag, index_indicator),
      function(l, l1, index_indicator) {
        sample_u(l, l1, alpha, beta, c, index_indicator)
      }
    )
    
    gamma <- sample_gamma(gamma, omega1, omega2, y, gamma_d)
    
    if (has_predictors) {
      for (j in seq_along(theta)) {
        bound1 <- get_min_bound_theta(j, t1_current, omega1, cum_h1, x, theta)
        bound2 <- get_min_bound_theta(j, t2_current, omega2, cum_h2, x, theta)
        bound <- min(bound1, bound2)
        theta[[j]] <- sample_theta(
          bound, colSums(pred_matrix)[[j]], theta[[j]], theta_d
          )
      }
    }
    
    t1_current <- purrr::pmap_dbl(
      list(t1, t1_current, omega1, delta1, x),
      function(t_orig, t_prev, omega, delta, x) {
        sample_t(t_orig, t_prev, omega, delta, max(t_part), x, theta, t_part, lambda1)
      }
    )
    t2_current <- purrr::pmap_dbl(
      list(t2, t2_current, omega2, delta2, x),
      function(t_orig, t_prev, omega, delta, x) {
        sample_t(t_orig, t_prev, omega, delta, max(t_part), x, theta, t_part, lambda2)
      }
    )
    
    # Outputs
    if (i > burn_in) {
      omega1_mat[, i - burn_in] <- omega1
      omega2_mat[, i - burn_in] <- omega2
      lambda1_mat[, i - burn_in] <- lambda1
      lambda2_mat[, i - burn_in] <- lambda2
      gamma_mat[, i - burn_in] <- gamma
      t1_mat[, i - burn_in] <- t1_current
      t2_mat[, i - burn_in] <- t2_current
      s1_mat[, i - burn_in] <- exp(-cum_h(t_part, t_part, lambda1))
      s2_mat[, i - burn_in] <- exp(-cum_h(t_part, t_part, lambda2))
      if (has_predictors) theta_mat[, i - burn_in] <- theta
    }
    
  }
  
  l <- list("omega1" = omega1_mat, "omega2" = omega2_mat,
            "lambda1" = lambda1_mat, "lambda2" = lambda2_mat,
            "gamma" = gamma_mat, "t1" = t1_mat, "t2" = t2_mat,
            "s1" = s1_mat, "s2" = s2_mat)
  
  if (has_predictors) l$theta <- theta_mat
  
  out <- new_BSBHaz(
    l,
    individuals = as.integer(n_obs),
    intervals = as.integer(n_intervals),
    has_predictors = has_predictors,
    samples = as.integer(iter - burn_in),
    int_len = as.double(int_len)
    )
  
  return(out)
  
}
