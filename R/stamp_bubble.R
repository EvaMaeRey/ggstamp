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
#'  stamp_bubble() +
#'  stamp_bubble(color = "red", x = 10, y = 100)
#'
#' ggcanvas() +
#'  stamp_bubble(color = "green") +
#'  stamp_bubble(x = 1:5, y = 2, size = 8)
stamp_bubble <- function(x = 0,
                       y = 0,
                       size = 8,
                       stroke = 2,
                       shape = 21,
                       alpha = 1,
                       fill = "grey85",
                       color = "black"){

annotate(geom = "point",
         x = x,
         y = y,
         fill = fill,
         shape = shape,
         size = size,
         stroke = stroke,
         alpha = alpha,
         color = color)

}






