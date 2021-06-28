#' Stamp some text
#'
#' This function adds a text annotation layer
#'
#' @param x0 defaults to 0
#' @param y0 defaults to 0
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
#'  stamp_ellipse() +
#'  stamp_ellipse(color = "plum4", x0 = 2, y0 = 3, angle = pi/6)
#'
#' ggcanvas() +
#'  stamp_ellipse(color = "green") +
#'  stamp_ellipse(x0 = 1:5, y0 = 2, size = 2)
stamp_ellipse <- function(x0 = 0,
                       y0 = 0,
                       a = 1,
                       b = .5,
                       angle = 0,
                       size = 1.5,
                       alpha = 1,
                       linetype = "solid",
                       fill = "grey85",
                       color = "black",
                       x0y0 = NULL){

  if(!is.null(x0y0)){
    x0 = x0y0[,1]
    y0 = x0y0[,2]
  }

  ggforce::geom_ellipse(data = data.frame(
         x0 = x0,
         y0 = y0,
         a = a, b = b, angle = angle
         ),
         aes(x = NULL, y = NULL, x0 = x0, y0 = y0,
             a = a, b= b, angle = angle),
         fill = fill, size = size,
         alpha = alpha,
         color = color)

}






