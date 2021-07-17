#' Stamp a spoke (segment defined by angle and length)
#'
#' @param angle direction of spoke in degrees
#' @param radius length of spoke
#' @inheritParams stamp_curve
#'
#' @return
#' @export
#'
#' @examples
#' # on plot
#' library(ggplot2)
#' ggplot(cars) +
#'  aes(speed, dist) +
#'  geom_point() +
#'  stamp_spoke(color = "darkred", radius = 25)
#'
#' # on canvas
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

                        alpha = 1,
                        color = "black",
                        linetype = "solid",
                        size = 1.5
                        ){

  annotate(geom = "spoke",
           x = x,
           y = y,
           radius = radius,
           angle = angle,

           alpha = alpha,
           color = color,
           linetype = linetype,
           size = size
           )

}



