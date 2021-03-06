% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/density.R
\name{density}
\alias{density}
\title{Distribution Density Plot.}
\usage{
density(
  data,
  x,
  col.var = NULL,
  title = NULL,
  subtitle = NULL,
  xtitle = NULL,
  ytitle = NULL,
  caption = NULL
)
}
\arguments{
\item{data}{input data.frame}

\item{x}{x variable}

\item{col.var}{color variable}

\item{title}{input data.frame}

\item{subtitle}{date variable}

\item{xtitle}{value variable}

\item{ytitle}{input data.frame}

\item{caption}{date variable}
}
\value{
An object of class \code{ggplot}
}
\description{
density function will draw Density Plot for Distribution analysis.
}
\examples{
plot<- density(data=mpg,x="cty",col.var="cyl")
plot

}
