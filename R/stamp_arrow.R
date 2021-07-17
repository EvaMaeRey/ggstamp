#' Stamp an arrow/arrows
#'
#' @description This function adds an arrow annotation layer
#' Contribute or help document https://github.com/EvaMaeRey/ggstamp/blob/master/R/stamp_arrow.R

#'
#' @param x defaults to 0
#' @param y defaults to 0
#' @param xend defaults to 1
#' @param yend defaults to 1
#' @param size numeric indicating line width
#' @param alpha numeric between 0 and 1 indicating transparency
#' @param color
#' @param ends One of "last", "first", or "both", indicating which ends of the line to draw arrow heads.
#' @param headlength A unit specifying the length of the arrow head (from tip to base).
#' @param units A character vector specifying the units for the corresponding numeric values.
#' @param angle The angle of the arrow head in degrees (smaller numbers produce narrower, pointier arrows). Essentially describes the width of the arrow head.
#' @param type One of "open" or "closed" indicating whether the arrow head should be a closed triangle.
#'
#' @return
#' @export
#'
#' @examples
#' # stamp arrow on plot
#' library(ggplot2)
#' ggplot(cars) +
#'   aes(speed, dist) +
#'   geom_point() +
#'   stamp_arrow() +
#'   stamp_arrow(color = "darkred",
#'   xend = 15, yend = 75)
#'
#' # several arrows
#'  ggcanvas() +
#'  stamp_arrow(color = "steelblue") +
#'  stamp_arrow(x = 1:5, y = 2, xend = 2:6,
#'  headlength = .04, type = "closed",
#'  color = "darkred") +
#'  stamp_arrow(x = .5, xend = 1.5,
#'  ends = "both", angle = 60)
stamp_arrow <- function(x = 0,
                        y = 0,
                        xend = 1,
                        yend = 1,

                        alpha = 1,
                        color = "black",
                        size = 1.5,

                        # define arrow
                        ends = "last",
                        units = "npc",
                        headlength = .03,
                        angle = 30,
                        type = "open",

                        lineend = "butt",
                        linejoin = "round",
                        arrow.fill = T
                        ){

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



