#' Stamp some text
#'
#' This function adds a text annotation layer
#'
#' @param x defaults to 0
#' @param y defaults to 0
#' @param label defaults with a message about used
#' @param size
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
                        size = 1.5,
                        alpha = 1,
                        curvature = .1,
                        color = "black"){

  annotate(geom = "curve",
           x = x,
           y = y,
           xend = xend,
           yend = yend,
           size = size,
           alpha = alpha,
           curvature = curvature,
           color = color)

}



