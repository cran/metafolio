% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generate_env_ts.R
\name{generate_env_ts}
\alias{generate_env_ts}
\title{Create an environmental time series.}
\usage{
generate_env_ts(
  n_t,
  type = c("sine", "arma", "regime", "linear", "linear_arma", "constant"),
  sine_params = list(amplitude = 1, ang_frequency = 0.2, phase = 0, mean_value = 0, slope
    = 0, sigma_env = 0.02),
  arma_params = list(mean_value = 0, sigma_env = 0.5, ar = 0.4, ma = 0),
  regime_params = list(break_pts = c(25, 75), break_vals = c(-1, 0, 1)),
  linear_params = list(min_value = -1, max_value = 1, sigma_env = 0.1, start_t = 1),
  linear_arma_params = list(min_value = -1, max_value = 1, sigma_env = 0.1, start_t = 1,
    ar = 0.4, ma = 0),
  constant_params = list(value = 0)
)
}
\arguments{
\item{n_t}{Length of time series.}

\item{type}{Type of time series to produce.}

\item{sine_params}{Parameters controlling sine wave time series.}

\item{arma_params}{Parameters controlling ARMA time series.}

\item{regime_params}{Parameters controlling regime-shift time series.}

\item{linear_params}{Parameters controlling warming or cooling time series.
Minimum environmental value, maximum environmental value, environmental
standard deviation, and the year to start the linear trend (useful if
you're going to throw out the early years as burn in).}

\item{linear_arma_params}{A combination of \code{arma_params} and 
\code{linear_params}.}

\item{constant_params}{Parameter controlling constant time series.}
}
\description{
Generate various types of environmental time series.
}
\examples{
types <- c("sine", "arma", "regime", "linear", "linear_arma", "constant")
x <- list()
for(i in 1:6) x[[i]] <- generate_env_ts(n_t = 100, type = types[i])
op <- par(mfrow = c(5, 1), mar = c(3,3,1,0), cex = 0.7)
for(i in 1:6) plot(x[[i]], type = "o", main = types[i])
par(op)
}
