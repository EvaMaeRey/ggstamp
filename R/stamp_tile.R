#' Stamp some text
#'
#' This function adds a text annotation layer
#'
#' @param size line width default is .5
#' @param alpha 0 to 1 indicating transparency
#' @param color named or hexcolor for outline of tile
#' @param height full height of tile centered at y
#' @param width full width of tile centered at x
#' @param linetype "solid" "dashed" "dotted" linetype border
#' @inheritParams stamp_label
#'
#' @return
#' @export
#'
#' @examples
#' # tile
#' library(ggplot2)
#' ggplot(cars) +
#'  aes(speed, dist) +
#'  geom_point() +
#'  stamp_tile(color = "red", x = 10,
#'             y = 90:100) +
#'  stamp_tile(height = 10,
#'             xy = pos_spoke(x0 = 20, n = 15,
#'             radius = 6))
#'
#' # on a canvas
#' ggcanvas() +
#'  stamp_tile(fill = "green") +
#'  stamp_tile(x = 1:5, y = 2, alpha = .8,
#'             fill = "steelblue",
#'             width = .95,
#'             size = 0) +
#'  coord_equal()
#'
#' # using a positioner
#' ggcanvas() +
#'  stamp_tile(xy = pos_spoke())
stamp_tile <- function(x = 0,
                       y = 0,
                       size = .5,
                       alpha = 1,
                       color = "black",
                       fill = "grey85",
                       height = 1,
                       linetype = "solid",
                       width = 1,
                       xy = NULL
                       ){

if(!is.null(xy)){
  x = xy[,1]
  y = xy[,2]
}

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






