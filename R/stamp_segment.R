#' Stamp some text
#'
#' This function adds a text annotation layer
#'
#' @inheritParams stamp_curve
#'
#' @return
#' @export
#'
#' @examples
#' # segment on plot space
#' library(ggplot2)
#' ggplot(cars) +
#'  aes(speed, dist) +
#'  geom_point() +
#'  stamp_segment(color = "darkred",
#'  xend = 15, yend = 75)
#'
#' # segments on canvas
#'  ggcanvas() +
#'  stamp_segment(color = "green") +
#'  stamp_segment(x = 1:5, y = 2, xend = 2:6,
#'  size = 8, alpha = .5, lineend = "round")
stamp_segment <- function(x = 0,
                          y = 0,
                          xend = 1,
                          yend = 1,

                        alpha = 1,
                        color = "black",
                        linetype = "solid",
                        size = 1.5,

                        lineend = "butt",
                        linejoin = "round",

                        arrow = arrow(length = 0),
                        arrow.fill = NULL
                        ){

  annotate(geom = "segment",
           x = x,
           y = y,
           xend = xend,
           yend = yend,

           size = size,
           alpha = alpha,
           color = color,
           linetype = linetype,

           lineend = lineend,
           linejoin = linejoin,
           # arrow = arrow,
           # arrow.fill = arrow.fill
           )

}



