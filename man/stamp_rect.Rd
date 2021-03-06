% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stamp_rect.R
\name{stamp_rect}
\alias{stamp_rect}
\title{Stamp some text}
\usage{
stamp_rect(
  xmin = -1,
  ymin = -1,
  xmax = 1,
  ymax = 1,
  x = 0,
  y = 0,
  alpha = 1,
  color = "black",
  fill = "grey85",
  linetype = "solid",
  size = 0.5,
  xxyy = NULL
)
}
\arguments{
\item{alpha}{numeric between 0 and 1 indicating transparency, defaults to 1 fully opaque, zero is fully transparent}

\item{color}{a character string indicating color, defaults to "black", for other named colors check out https://evamaerey.github.io/ggplot2_grammar_guide/named_colors}

\item{fill}{a character string indicating fill color, defaults to "grey35", for other named colors check out https://evamaerey.github.io/ggplot2_grammar_guide/named_colors}

\item{linetype}{a string indicating linetype, "solid", "dashed", "dotted", defaults to "solid"}

\item{size}{numeric value indicating line width, defaults to 1.5}
}
\value{

}
\description{
This function adds a text annotation layer
}
\examples{
# rect
library(ggplot2)
ggplot(cars) +
 aes(speed, dist) +
 geom_point() +
 stamp_rect(color = "red") +
 stamp_rect(
            xxyy = data.frame(xmin = 1:4*3, xmax = 2:5*3,
            ymin = 1:4*6, ymax = 1:8*6))

# on a canvas
ggcanvas() +
 stamp_rect(fill = "green") +
 stamp_rect(alpha = .8,
            fill = "steelblue",
            size = 0,
            xmin = 2, xmax = 3,
            ymin = 5, ymax = 8) +
 coord_equal()
}
