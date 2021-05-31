#' Stamp a polygon of n sides
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
#'  geom_point() +
#'  stamp_polygon(color = "darkred")
#'
#'  ggcanvas() +
#'  stamp_polygon(color = "turquoise4", radius = 3, n = 5, fill = "turquoise") +
#'  stamp_polygon(fill = "slateblue2", radius = 2, n = 7) +
#'  stamp_polygon(linetype = "dashed", alpha = .5, fill = "plum2") +
#'  stamp_polygon(x0 = 1, y0 = 1.5, n = 3, rotation = .25, size = 0,
#'   fill = "goldenrod2") +
#'  stamp_polygon(n = 50, radius = .2, size = 0) +
#'  stamp_spoke(angle = pi * 1:7/15, radius = 2)
stamp_polygon <- function(x = c(0,1,0,1),
                          y = c(0,0,1,1),
                          x0 = 0,
                          y0 = 0,
                          n = 6,
                          radius = 1,
                          size = 1.5,
                          alpha = 1,
                          rotation = .5,
                          linetype = "solid",
                          fill = "grey35",
                          color = "black"){

  data.frame(
    x = x0 + radius*cos(2*pi * 1:n/n + rotation*pi),
    y = y0 + radius*sin(2*pi * 1:n/n + rotation*pi)
  ) ->
  df

  annotate(geom = "polygon",
           x = df$x,
           y = df$y,
           size = size,
           fill = fill,
           alpha = alpha,
           linetype = linetype,
           color = color)

}



