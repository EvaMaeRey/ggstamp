% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pos_wrap.R
\name{pos_wrap}
\alias{pos_wrap}
\title{Data frame of positions for x and y}
\usage{
pos_wrap(x0 = 0, y0 = 0, n = 5, ncol = 3, width = 1, height = width)
}
\arguments{
\item{x0}{numeric for x starting point for positioner}

\item{y0}{numeric for y starting point for positioner}

\item{n}{number of positions}

\item{ncol}{number of columns before wrap}
}
\value{

}
\description{
Data frame of positions for x and y
}
\examples{
pos_wrap()
pos_wrap(n = 7, ncol = 2)
}
