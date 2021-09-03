#' Stamp an ellipse
#'
#' This function adds a text annotation layer
#'
#' @param a width defining ellipse
#' @param b height defining ellipse
#' @param rotation how much the shape should be rotated, defaults to -.5
#'
#' @inheritParams stamp_circle
#'
#' @return
#' @export
#'
#' @examples
#' # an ellipse
#' library(ggplot2)
#' ggplot(cars) +
#'  aes(speed, dist) +
#'  stamp_ellipse() +
#'  stamp_ellipse(color = "plum4", x0 = 2, y0 = 3, rotation = pi/6)
#'
#' # several
#' ggcanvas() +
#'  stamp_ellipse(color = "green") +
#'  stamp_ellipse(x0 = 1:5, y0 = 2, size = 2)
stamp_ellipse <- function(x0 = 0,
                       y0 = 0,
                       a = 1,
                       b = .5,
                       rotation = 0,
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
         a = a, b = b, angle = rotation
         ),
         aes(x = NULL, y = NULL, x0 = x0, y0 = y0,
             a = a, b= b, angle = rotation),
         fill = fill, size = size,
         alpha = alpha,
         color = color)

}






