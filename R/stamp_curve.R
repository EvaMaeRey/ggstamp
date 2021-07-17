#' Stamp a curve
#'
#' This function adds a text annotation layer
#'
#' @param x defaults to 0
#' @param y defaults to 0
#' @param xend numeric defaults to 1
#' @param yend numeric defaults to 1
#'
#' @param alpha a numeric between 0 and 1 for transparency, zero is fully transparent, 1 fully opaque
#' @param color line color
#' @param linetype "solid", "dashed", "dotted"
#' @param size numeric indicating line width, defaults to 1.5
#'
#' @param arrow specification for arrow heads, as created by arrow().
#' @param arrow.fill fill colour to use for the arrow head (if closed). NULL means use colour aesthetic.
#' @param lineend Line end style (round, butt, square).
#' @param linejoin Line join style (round, mitre, bevel).
#'
#' @param curvature A numeric value giving the amount of curvature. Negative values produce left-hand curves, positive values produce right-hand curves, and zero produces a straight line.
#' @param angle A numeric value between 0 and 180, giving an amount to skew the control points of the curve. Values less than 90 skew the curve towards the start point and values greater than 90 skew the curve towards the end point.
#' @param ncp The number of control points used to draw the curve. More control points creates a smoother curve.
#'
#' @return
#' @export
#'
#' @examples
#' # a curve
#' library(ggplot2)
#' ggplot(cars) +
#'  aes(speed, dist) +
#'  geom_point() +
#'  stamp_curve(color = "darkred",
#'  xend = 15, yend = 75)
#'
#' # more curves
#' ggcanvas() +
#'  stamp_curve() +
#'  stamp_curve(color = "green") +
#'  stamp_curve(x = 1:5, yend = 2, xend = 2:6,
#'  size = 8, alpha = .5) +
#'  stamp_point(x = 1:5, y = 0)
stamp_curve <- function(x = 0,
                        y = 0,
                        xend = 1,
                        yend = 1,
                        alpha = 1,
                        color = "black",
                        linetype = "solid",
                        size = 1.5,

                        lineend = "butt",

                        curvature = .1,
                        angle = 90,
                        ncp = 5
                        ){

  annotate(geom = "curve",
           x = x,
           y = y,
           xend = xend,
           yend = yend,
           alpha = alpha,
           color = color,
           linetype = linetype,
           size = size,

           lineend = lineend,

           curvature = curvature,
           angle = angle,
           ncp = ncp
           )

}



