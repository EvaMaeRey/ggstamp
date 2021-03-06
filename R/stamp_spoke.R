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
#'  stamp_circle(x0 = 2, y0 = 2, radius = 1) +
#'  stamp_spoke(x0 = 1.5, y0 = 0,
#'             angle = pi * 1:50/50,
#'             alpha = 1:50/50) +
#'  stamp_text(x = 2, y = 2, label = "Hi!") +
#'  coord_equal() +
#'  theme_void()
stamp_spoke <- function(x0 = 0,
                        y0 = 0,
                        angle = pi/4,
                        radius = 1,

                        alpha = 1,
                        color = "black",
                        linetype = "solid",
                        size = 1.5
                        ){

  annotate(geom = "spoke",
           x = x0,
           y = y0,
           radius = radius,
           angle = angle,

           alpha = alpha,
           color = color,
           linetype = linetype,
           size = size
           )

}



