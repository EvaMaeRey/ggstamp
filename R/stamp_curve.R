#' Stamp a curve
#'
#' This function adds a text annotation layer
#'
#'
#' @param arrow specification for arrow heads, as created by arrow().
#'
#' @param curvature A numeric value giving the amount of curvature. Negative values produce left-hand curves, positive values produce right-hand curves, and zero produces a straight line, defaults to .1
#' @param curveangle A numeric value between 0 and 180, giving an amount to skew the control points of the curve. Values less than 90 skew the curve towards the start point and values greater than 90 skew the curve towards the end point.
#' @param ncp The number of control points used to draw the curve. More control points creates a smoother curve, default is 5
#' @inheritParams stamp_arrow
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
                        curveangle = 90,
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
           angle = curveangle,
           ncp = ncp
           )

}



