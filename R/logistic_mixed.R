#' Random intercept logistic model
#'
#' @description Fit a varying intercept logistic regression. Uses a non centred
#' parameterisation. Samples from variance rather than sd.
#' Using gamma prior on variance.
#'
#' @export
#' @param ld parameters as required for logistic_mixed_09.stan
#' @param ... Arguments passed to `rstan::sampling` (e.g. iter, chains).
#' @return An object of class `stanfit` returned by `rstan::sampling`
#'
logistic_mixed_01 <- function(ld,...) {

  # standata <- list(
  #   N = length(y),
  #   y = y,
  #   K = K,
  #   arm = arm,
  #   N_clust = length(unique(clustid)),
  #   clustid = clustid,
  #   prior_only = prior_only,
  #   pri_mu_int = pri_mu_int,
  #   pri_sd_int = pri_sd_int,
  #   pri_mu_trt = pri_mu_trt,
  #   pri_sd_trt = pri_sd_trt,
  #   pri_var_nu = pri_var_nu,
  #   pri_var_sig = pri_var_sig
  # )

  out <- rstan::sampling(stanmodels$logistic_mixed_01, data = ld, ...)

  return(out)
}

#' Random intercept logistic model
#'
#' @description Fit a varying intercept logistic regression. Uses a non centred
#' parameterisation. Samples from variance rather than sd.
#' Using gamma prior on variance.
#'
#' @export
#' @param ld parameters as required for logistic_mixed_09.stan
#' @param ... Arguments passed to `rstan::sampling` (e.g. iter, chains).
#' @return An object of class `stanfit` returned by `rstan::sampling`
#'
logistic_mixed_09 <- function(ld,...) {

  # standata <- list(
  #   N = length(y),
  #   y = y,
  #   K = K,
  #   arm = arm,
  #   N_clust = length(unique(clustid)),
  #   clustid = clustid,
  #   prior_only = prior_only,
  #   pri_mu_int = pri_mu_int,
  #   pri_sd_int = pri_sd_int,
  #   pri_mu_trt = pri_mu_trt,
  #   pri_sd_trt = pri_sd_trt,
  #   pri_var_nu = pri_var_nu,
  #   pri_var_sig = pri_var_sig
  # )

  out <- rstan::sampling(stanmodels$logistic_mixed_09, data = ld, ...)

  return(out)
}





