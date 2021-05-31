#' Stamp some text
#'
#' This function adds a text annotation layer
#'
#' @param x defaults to 0
#' @param y defaults to 0
#' @param size line width default is .5
#' @param alpha 0 to 1 indicating transparency
#' @param color named or hexcolor for outline
#' @param fill named or hexcolor
#' @param height full height of tile centered at y
#' @param linetype "solid" "dashed" "dotted"
#' @param width full width of tile centered at x
#'
#' @return
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(cars) +
#'  aes(speed, dist) +
#'  geom_point() +
#'  stamp_tile(color = "red", x = 10, y = 90:100)
#'
#'  ggcanvas() +
#'  stamp_tile(fill = "green") +
#'  stamp_tile(x = 1:5, y = 2, alpha = .8, fill = "steelblue",  width = .95, size = 0) +
#'  coord_equal()
stamp_tile <- function(x = 0,
                       y = 0,
                       size = .5,
                       alpha = 1,
                       color = "black",
                       fill = "grey85",
                       height = 1,
                       linetype = "solid",
                       width = 1
                       ){

annotate(geom = "tile",
         x = x,
         y = y,
         alpha = alpha,
         color = color,
         fill = fill,
         height = height,
         linetype = linetype,
         size = size,
         width = width

         )

}






