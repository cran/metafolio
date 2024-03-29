# Generated by using Rcpp::compileAttributes() -> do not edit by hand
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#' Get beta parameters from mean and variance
#'
#' @param mu Mean
#' @param var Variance
#'
est_beta_params <- function(mu, var) {
    .Call(`_metafolio_est_beta_params`, mu, var)
}

#' Add implementation error
#'
#' Add implementation error with a beta distribution.
#'
#' @param mu The mean
#' @param sigma_impl Implementation error standard deviation
#' @return
#' A single numeric values representing a sample from a beta
#' distribution with the specified mean and standard deviation.
#'
#' @export
#' @references
#' Morgan, M. G. & Henrion, M. (1990). Uncertainty: A Guide to Dealing
#' with Uncertainty in Quantitative Risk and Policy Analysis.
#' Cambridge University Press.
#'
#' Pestes, L. R., Peterman, R. M., Bradford, M. J., and Wood, C. C.
#' (2008). Bayesian decision analysis for evaluating management
#' options to promote recovery of a depleted salmon population.
#' 22(2):351-361.
#'
#' http://stats.stackexchange.com/questions/12232/calculating-the-parameters-of-a-beta-distribution-using-the-mean-and-variance
#'
#' @examples
#' y <- sapply(1:200, function(x) impl_error(0.5, 0.2))
#' hist(y)
#'
#' y <- sapply(1:200, function(x) impl_error(0.3, 0.1))
#' hist(y)
#'
impl_error <- function(mu, sigma_impl) {
    .Call(`_metafolio_impl_error`, mu, sigma_impl)
}

#' Ricker stock-recruit function with specified error
#'
#' @param spawners A single spawner abundance
#' @param a Ricker productivity parameter. Recruits are e^a at the origin.
#' @param b Ricker density dependent parameter.
#' @param d Depensation parameter. A value of 1 means no depensation. Larger
#'   values indicate depensation.
#' @param v_t A single residual on the curve. Will be exponentiated. Note that we are
#'   *not* bias correcting within this function (subtracting half the variance
#'   squared) and so the deviations will not be mean unbiased unless they were
#'   bias corrected previously.
#' @export
#' @return Returns a vector of recruits.
#' @examples
#' plot(1, 1, xlim = c(1, 100), ylim = c(0, 90), type = "n", xlab = "Spawners",
#'   ylab = "Returns")
#' for(i in 1:100) {
#' points(i, ricker_v_t(i, a = 1.1, b = 60, d = 1, v_t = rnorm(1, mean =
#'   -(0.1^2)/2, sd = 0.1)))
#' }
ricker_v_t <- function(spawners, a, b, d, v_t) {
    .Call(`_metafolio_ricker_v_t`, spawners, a, b, d, v_t)
}

#' Check if x is an element of y.
#'
#' @param x An integer to check
#' @param y A vector to check if \code{x} is an element of \code{y}.
#'
is_element <- function(x, y) {
    .Call(`_metafolio_is_element`, x, y)
}

#' Super fast linear regression
#'
#' @param yr Vector of y values
#' @param Xr Model matrix
#'
fastlm <- function(yr, Xr) {
    .Call(`_metafolio_fastlm`, yr, Xr)
}

#' Fit Ricker linear regression
#'
#' Fit a Ricker curve to spawner-recruit data and return the intercept (a) and
#' slope (b). The model is fit via the \pkg{RcppArmadillo} package for speed..
#'
#' @export
#' @param S Spawners as a numeric vector.
#' @param R Recruits or returns as a numeric vector.
#' @return
#' A named list with components \code{a} for the intercept and
#' \code{b} for the slope.
#' @examples
#' S <- seq(100, 1000, length.out = 100)
#' v_t <- rnorm(100, 0, 0.1)
#' R <- mapply(ricker_v_t, spawners = S, v_t = v_t, a = 1.9, b = 900, d = 1)
#' plot(S, log(R/S))
#' fit_ricker(S, R)
#'
fit_ricker <- function(S, R) {
    .Call(`_metafolio_fit_ricker`, S, R)
}

#' Assign a salmon escapement target based on a Ricker curve
#'
#' Sets escapement according to Hilborn and Walters (1992) p272, Table
#' 7.2. Smsy = b(0.5 - 0.07*a).
#'
#' @param a Ricker productivity parameter.
#' @param b Ricker density-dependent parameter.
#' @export
#' @references
#' Hilborn, R.W. and Walters, C. 1992. Quantitative fisheries stock
#' assessment: Choice, dynamics, and uncertainty. Chapman and Hall, London.
#' @examples
#' ricker_escapement(1.1, 1000)
#'
ricker_escapement <- function(a, b) {
    .Call(`_metafolio_ricker_escapement`, a, b)
}

#' Base-level metapopulation simulation function
#'
#' This is an Rcpp implementation of the main simulation. It is meant to be
#' called by \code{\link{meta_sim}}.
#' @param n_t The number of years.
#' @param n_pop Number of populations
#' @param spawners_0 A vector of spawner abundances at the start of the
#'   simulation. Length of the vector should equal the number of populations.
#' @param b Ricker density-dependent parameter. A vector with one numeric value
#'   per population.
#' @param epsilon_mat A matrix of recruitment deviations.
#' @param A_params A matrix of Ricker a parameters
#' @param add_straying Implement straying between populations?
#' @param stray_mat A straying matrix.
#' @param assess_years A vector of years to assess a and b in
#' @param r_escp_goals A matrix of escapement goals.
#' @param sigma_impl Implementation standard deviation for the implementation
#'   error beta distribution.
#' @param add_impl_error Add implementation error? Implementation error is
#'   derived using \code{\link{impl_error}}.
#' @param decrease_b A numeric value to decrease all streams by each generation.
#'   This is intended to be used to simulate habitat loss, for example though
#'   stream flow reduction with climate change.
#' @param debug Boolean. Should some debuging messages be turned on?
#'
#' @useDynLib metafolio, .registration = TRUE
#'
metasim_base <- function(n_pop, n_t, spawners_0, b, epsilon_mat, A_params, add_straying, stray_mat, assess_years, r_escp_goals, sigma_impl, add_impl_error, decrease_b, debug) {
    .Call(`_metafolio_metasim_base`, n_pop, n_t, spawners_0, b, epsilon_mat, A_params, add_straying, stray_mat, assess_years, r_escp_goals, sigma_impl, add_impl_error, decrease_b, debug)
}

