% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/divdot.r
\name{divdot}
\alias{divdot}
\title{Deviation Diverging Dot Plot.}
\usage{
divdot(
  data,
  div.var,
  method = "mean",
  title = NULL,
  subtitle = NULL,
  xtitle = NULL,
  ytitle = NULL,
  caption = NULL
)
}
\arguments{
\item{data}{input data.frame}

\item{div.var}{diverging value variable}

\item{method}{"mean" or "median"}

\item{title}{main title}

\item{subtitle}{subtitle}

\item{xtitle}{x axis title}

\item{ytitle}{y axis title}

\item{caption}{caption}
}
\value{
An object of class \code{ggplot}
}
\description{
divdot function will draw Diverging Dot Plot for Deviation analysis.
}
\examples{
plot<- divdot(data=mtcars,div.var="mpg",method="mean")
plot

}
