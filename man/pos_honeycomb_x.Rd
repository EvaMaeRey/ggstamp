% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pos_honeycomb_x.R
\name{pos_honeycomb_x}
\alias{pos_honeycomb_x}
\title{Create vector for x that, with y will, form a wrapping honeycomb pattern}
\usage{
pos_honeycomb_x(x0 = 0, n = 5, ncol = 3, width = 2 * sqrt(0.75))
}
\arguments{
\item{x0}{numeric x start position}

\item{n}{number of positions}

\item{ncol}{number of columns before wrap, default is 3}

\item{width}{numeric, width between positions}
}
\value{

}
\description{
Create vector for x that, with y will, form a wrapping honeycomb pattern
}
\examples{
pos_honeycomb_x()

pos_honeycomb_x(n = 10, x0 = 5, ncol = 2)
}
