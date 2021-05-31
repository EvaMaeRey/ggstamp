#' Stamp some text
#'
#' This function adds a text annotation layer
#'
#' @param x defaults to 0
#' @param y defaults to 0
#' @param size numeric indicating line width, defaults to 1.5
#' @param xend numeric defaults to 1
#' @param yend numeric defaults to 1
#' @param alpha a numeric between 0 and 1 for transparency
#' @param curvature a scalar between -1 and 1, 0 is straight, positive is counter clockwise?
#' @param color
#' @param linetype "solid", "dashed", "dotted"
#'
#' @return
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(cars) +
#'  aes(speed, dist) +
#'  geom_point() +
#'  stamp_curve(color = "darkred",
#'  xend = 15, yend = 75)
#'
#'  ggcanvas() +
#'  stamp_curve(color = "green") +
#'  stamp_curve(x = 1:5, yend = 2, xend = 2:6,
#'  size = 8, alpha = .5) +
#'  stamp_point(x = 1:5, y = 0)
stamp_curve <- function(x = 0, xend = 1,
                        y = 0, yend = 1,
                        alpha = 1,
                        color = "black",
                        linetype = "solid",
                        size = 1.5,
                        curvature = .1
                        ){

  annotate(geom = "curve",
           x = x,
           y = y,
           xend = xend,
           yend = yend,
           linetype = linetype,
           size = size,
           alpha = alpha,
           curvature = curvature,
           color = color)

}



