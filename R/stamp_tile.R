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
#'  stamp_tile(color = "red", x = 10, y = 100)
#'
#'  ggcanvas() +
#'  stamp_tile(color = "green") +
#'  stamp_tile(x = 1:5, y = 2, size = 3, alpha = .5) +
#'  coord_equal()
stamp_tile <- function(x = 0,
                       y = 0,
                       size = 2,
                       alpha = 1,
                       color = "black"){

annotate(geom = "tile",
         x = x,
         y = y,
         size = size,
         alpha = alpha,
         color = color)

}






