#' Stamp some text
#'
#' This function adds a text annotation layer
#'
#' @param x defaults to 0
#' @param y defaults to 0
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
#'  stamp_arrow(color = "darkred",
#'  xend = 15, yend = 75)
#'
#'  ggcanvas() +
#'  stamp_arrow(color = "steelblue") +
#'  stamp_arrow(x = 1:5, y = 2, xend = 2:6,
#'  headlength = .04, type = "closed", color = "darkred") +
#'  stamp_arrow(x = .5, xend = 1.5, ends = "both", angle = 60)
stamp_arrow <- function(x = 0, xend = 1,
                        y = 0, yend = 1,
                        size = 1.5,
                        alpha = 1,
                        color = "black",
                        ends = "last",
                        units = "npc",
                        headlength = .03,
                        angle = 30,
                        type = "open"){

  # ggcanvas() +
  annotate(geom = "segment",
           x = x,
           y = y,
           arrow = arrow(ends = ends, type = type, angle = angle,
                         length = unit(x = headlength, units = "npc")),
           xend = xend,
           yend = yend,
           size = size,
           alpha = alpha,
           color = color)

}



