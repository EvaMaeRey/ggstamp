#' Stamp a point
#'
#' This function adds a point annotation layer
#'
#' @param size a scalar or vector numeric
#' @param shape a numeric or character string, "circle" is default but also try "star", "bullet", "diamond", "triangle"
#' @param stroke a numeric - size of shape outline
#'
#'
#' @inheritParams stamp_segment
#'
#' @return
#' @export
#'
#' @examples
#' # stamp in plot space
#' library(ggplot2)
#' ggplot(cars) +
#'  aes(speed, dist) +
#'  geom_point() +
#'  stamp_point() +
#'  stamp_point(color = "red", x = 10, y = 100)
#'
#' # more points on canvas
#' ggcanvas() +
#'  stamp_point(color = "darkgreen") +
#'  stamp_point(x = 1:5, y = 2,
#'              size = 8, alpha = .5) +
#'  stamp_point(xy = pos_wrap(y0 = -2,
#'              n = 13, ncol = 4),
#'              color = "plum") +
#'  stamp_point(xy = pos_wrap(x0 = 1,
#'              n = 7, ncol = 4, width = .5))
stamp_point <- function(x = 0,
                        y = 0,
                       size = 8,
                       alpha = 1,
                       shape = "circle",
                       color = "black",
                       stroke = 1,
                       fill = "grey35",
                       xy = NULL){

  if(!is.null(xy)){
    x = xy[,1]
    y = xy[,2]
  }

annotate(geom = "point",
         x = x,
         y = y,
         size = size,
         alpha = alpha,
         shape = shape,
         color = color,
         stroke = stroke,
         fill = fill
         )

}






