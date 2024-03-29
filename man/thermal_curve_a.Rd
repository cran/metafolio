% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/thermal_curve_a.R
\name{thermal_curve_a}
\alias{thermal_curve_a}
\title{Create thermal tolerance curves.}
\usage{
thermal_curve_a(temp, optim_temp = 15, max_a = 1.4, width_param = 0.02)
}
\arguments{
\item{temp}{The input temperature value.}

\item{optim_temp}{The optimal temperature.}

\item{max_a}{The maximum productivity parameter `a` from a Ricker model (or
whatever the y-axis value is you want to return).}

\item{width_param}{A parameter to control the width of the parabola. Smaller
numbers make wider parabolas.}
}
\value{
A productivity parameter given the location on a thermal tolerance
  curve.
}
\description{
Creates a quadratic thermal tolerance curve of the form: width_param * (temp
- optim_temp)^2 + max_a Negative values are *not* returned as 0 for speed of
computation. You should check for this after.
}
\examples{
x <- seq(5, 30, length.out = 200)
plot(x, thermal_curve_a(x), ylab = "a", xlab = "Temperature", type
= "l")
}
