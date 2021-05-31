#' Stamp a spoke (segment defined by angle and length)
#'
#' This function adds a text annotation layer
#'
#' @param x defaults to 0
#' @param y defaults to 0
#' @param size
#' @param angle
#' @param radius
#' @param alpha
#' @param color
#' @param linetype
#'
#' @return
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(cars) +
#'  aes(speed, dist) +
#'  geom_point() +
#'  stamp_spoke(color = "darkred", radius = 25)
#'
#'  ggcanvas() +
#'  stamp_spoke(color = "green") +
#'  stamp_spoke(x = 2, y = 2, angle = pi * 1:8/4) +
#'  stamp_bubble(x = 2, y = 2, size = 15) +
#'  stamp_spoke(x = 1.5, y = 0, angle = pi * 1:50/50, alpha = 1:50/50) +
#'  stamp_text(x = 2, y = 2, label = "Hi!") +
#'  coord_equal() +
#'  theme_void()
stamp_spoke <- function(x = 0,
                        y = 0,
                        angle = pi/4,
                        radius = 1,
                        size = 1.5,
                        alpha = 1,
                        color = "black",
                        linetype = "solid"){

  annotate(geom = "spoke",
           x = x,
           y = y,
           radius = radius,
           angle = angle,
           size = size,
           alpha = alpha,
           color = color,
           linetype = linetype)

}



