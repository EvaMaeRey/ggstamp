% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stamp_polygon_holes.R
\name{stamp_polygon_holes}
\alias{stamp_polygon_holes}
\title{Stamp inverse of several polygons of n sides}
\usage{
stamp_polygon_holes(
  x0 = 0,
  y0 = 0,
  n_vertices = 6,
  radius = 1,
  radius_outer = Inf,
  size = 0,
  alpha = 1,
  rotation = -0.5,
  linetype = "solid",
  fill = "white",
  color = "black",
  x0y0 = NULL
)
}
\arguments{
\item{x0}{numeric x center of shape, defaults to 0}

\item{y0}{numeric y center of shape, defaults to 0}

\item{n_vertices}{numeric number of vertices}

\item{radius}{a numeric value, the distance between x0 and y0 and the vertices}

\item{size}{numeric value indicating line width, defaults to 1.5}

\item{alpha}{numeric between 0 and 1 indicating transparency, defaults to 1 fully opaque, zero is fully transparent}

\item{rotation}{numeric indicating how much polygon should be turned from first vertex along positive horizontal}

\item{linetype}{a string indicating linetype, "solid", "dashed", "dotted", defaults to "solid"}

\item{fill}{a character string indicating fill color, defaults to "grey35", for other named colors check out https://evamaerey.github.io/ggplot2_grammar_guide/named_colors}

\item{color}{a character string indicating color, defaults to "black", for other named colors check out https://evamaerey.github.io/ggplot2_grammar_guide/named_colors}

\item{x0y0}{dataframe indicating center of shapes, where first column is vector for x values and second column is vector for y values, defaults to NULL}
}
\value{

}
\description{
This function adds a text annotation layer.
Contribute or help document https://github.com/EvaMaeRey/ggstamp/blob/master/R/stamp_polygon.R
}
\examples{
# some more
 ggcanvas() +
  stamp_png(width = 7, x0 = 2.5, y0 = -2.5) +
  stamp_polygon_holes(
     x0y0 = pos_honeycomb(n = 400,
                          ncol = 20,
                          width = .3,
                          x0 = .03,
                          y0 = -.03),
                     fill = "grey35",
                     radius = .14) +
  stamp_polygon_holes(x0y0 = pos_honeycomb(n = 400,
                                           ncol = 20,
                                           width = .3),
  radius = .14, fill = "goldenrod3", n_vertices = 6,
                        radius_outer = Inf)
}
