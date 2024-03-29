% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_conserv_plans_mv.R
\name{get_conserv_plans_mv}
\alias{get_conserv_plans_mv}
\title{Run simulation for conservation schemes}
\usage{
get_conserv_plans_mv(
  weights,
  reps = 150,
  assess_freq = 5,
  burn = 1:30,
  risk_fn = var,
  ...
)
}
\arguments{
\item{weights}{A matrix of habitat weights. Each row corresponds to another
scenario. Each column is a different habitat location.}

\item{reps}{Number of portfolios to simulate.}

\item{assess_freq}{The frequency (in generations) of spawner-recruit
re-assessment. Passed to \code{\link{meta_sim}}.}

\item{burn}{Cycles to throw out as burn in.}

\item{risk_fn}{Type of variance or risk metric. By default takes the variance.
Instead you can supply any function that takes a numeric vector and returns
some single numeric value. E.g. CVaR.}

\item{...}{Other values to pass to \code{\link{meta_sim}}.}
}
\value{
Returns the portfolio mean and variance values and the simulation runs.
}
\description{
Run the metapopulation simulation for various conservation prioritization
schemes.
}
