
#' Random intercept logistic model
#'
#' @description Fit a varying intercept logistic regression. Uses a non centred
#' parameterisation. Samples from variance rather than sd.
#' Using gamma prior on variance.
#'
#' In addition to the data from brms::make_standata, the ld parameter requires
#' b0nu, b0mu, b0sig and b1nu, b1mu, b1sig.
#'
#' @export
#' @param ld list of data for logistic (as per brms::make_standata)
#' @param ... Arguments passed to `rstan::sampling` (e.g. iter, chains).
#' @return An object of class `stanfit` returned by `rstan::sampling`
#'
logistic_01 <- function(ld,...) {

  out <- rstan::sampling(stanmodels$logistic_01, data = ld, ...)

  return(out)
}
