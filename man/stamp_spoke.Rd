% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stamp_spoke.R
\name{stamp_spoke}
\alias{stamp_spoke}
\title{Stamp a spoke (segment defined by angle and length)}
\usage{
stamp_spoke(
  x0 = 0,
  y0 = 0,
  angle = pi/4,
  radius = 1,
  alpha = 1,
  color = "black",
  linetype = "solid",
  size = 1.5
)
}
\arguments{
\item{angle}{direction of spoke in degrees}

\item{radius}{length of spoke}

\item{alpha}{numeric between 0 and 1 indicating transparency, defaults to 1 fully opaque, zero is fully transparent}

\item{color}{a character string indicating color, defaults to "black", for other named colors check out https://evamaerey.github.io/ggplot2_grammar_guide/named_colors}

\item{linetype}{a string indicating linetype, "solid", "dashed", "dotted", defaults to "solid"}

\item{size}{numeric value indicating line width, defaults to 1.5}
}
\value{

}
\description{
Stamp a spoke (segment defined by angle and length)
}
\examples{
# on plot
library(ggplot2)
ggplot(cars) +
 aes(speed, dist) +
 geom_point() +
 stamp_spoke(color = "darkred", radius = 25)

# on canvas
 ggcanvas() +
 stamp_spoke(color = "green") +
 stamp_spoke(x = 2, y = 2, angle = pi * 1:8/4) +
 stamp_circle(x0 = 2, y0 = 2, radius = 1) +
 stamp_spoke(x0 = 1.5, y0 = 0,
            angle = pi * 1:50/50,
            alpha = 1:50/50) +
 stamp_text(x = 2, y = 2, label = "Hi!") +
 coord_equal() +
 theme_void()
}
