#' Stamp some text
#'
#' This function adds a text annotation layer
#'
#' @inheritParams stamp_polygon
#'
#' @return
#' @export
#'
#' @examples
#' # rect
#' library(ggplot2)
#' ggplot(cars) +
#'  aes(speed, dist) +
#'  geom_point() +
#'  stamp_rect(color = "red") +
#'  stamp_rect(
#'             xxyy = data.frame(xmin = 1:4*3, xmax = 2:5*3,
#'             ymin = 1:4*6, ymax = 1:8*6))
#'
#' # on a canvas
#' ggcanvas() +
#'  stamp_rect(fill = "green") +
#'  stamp_rect(alpha = .8,
#'             fill = "steelblue",
#'             size = 0,
#'             xmin = 2, xmax = 3,
#'             ymin = 5, ymax = 8) +
#'  coord_equal()
stamp_rect <- function(xmin = -1,
                       ymin = -1,
                       xmax = 1,
                       ymax = 1,

                       x = 0,
                       y = 0,

                       alpha = 1,
                       color = "black",
                       fill = "grey85",
                       linetype = "solid",
                       size = .5,

                       xxyy = NULL

                       ){

if(!is.null(xxyy)){
  xmin = xxyy[,1]
  xmax = xxyy[,2]
  ymin = xxyy[,3]
  ymax = xxyy[,4]
}

annotate(geom = "rect",
         xmin = xmin,
         ymin = ymin,
         xmax = xmax,
         ymax = ymax,

         x = x,
         y = y,

         alpha = alpha,
         color = color,
         fill = fill,
         linetype = linetype,
         size = size,

         )

}






