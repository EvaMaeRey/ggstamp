#' Stamp an arrow/arrows
#'
#' @description This function adds an arrow annotation layer
#' Contribute or help document https://github.com/EvaMaeRey/ggstamp/blob/master/R/stamp_arrow.R

#'
#' @param x numeric x position, defaults to 0
#' @param y numeric y position, defaults to 0
#' @param xend numeric x end position, defaults to 1
#' @param yend numeric y end position, defaults to 1
#' @param size numeric value indicating line width, defaults to 1.5
#' @param alpha numeric between 0 and 1 indicating transparency, defaults to 1 fully opaque, zero is fully transparent
#' @param color a character string indicating color, defaults to "black", for other named colors check out https://evamaerey.github.io/ggplot2_grammar_guide/named_colors
#' @param linetype a string indicating linetype, "solid", "dashed", "dotted", defaults to "solid"
#' @param ends a character string, one of "last", "first", or "both", indicating which ends of the line to draw arrow heads, defaults to last
#' @param headlength A numeric value specifying the length of the arrow head (from tip to base), defaults to .03
#' @param units A character vector specifying the units for head length, default is "npc" for native plot coordinates
#' @param headangle A numeric value, the angle of the arrowhead in degrees (smaller numbers produce narrower, pointier arrows). Essentially describes the width of the arrow head.
#' @param headtype One of "open" or "closed" indicating whether the arrow head should be a closed triangle.
#' @param lineend Line end style (round, butt, square)
#' @param linejoin Line join style (round, mitre, bevel)
#' @param arrow.fill fill colour to use for the arrow head (if closed). NULL means use colour aesthetic.
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
#'  headlength = .04, headtype = "closed",
#'  color = "darkred") +
#'  stamp_arrow(x = .5, xend = 1.5,
#'  ends = "both", headangle = 60)
stamp_arrow <- function(x = 0,
                        y = 0,
                        xend = 1,
                        yend = 1,

                        alpha = 1,
                        color = "black",
                        linetype = "solid",
                        size = 1.5,

                        # define arrow
                        ends = "last",
                        units = "npc",
                        headlength = .03,
                        headangle = 30,
                        headtype = "open",

                        lineend = "butt",
                        linejoin = "round",
                        arrow.fill = T
                        ){

  annotate(geom = "segment",
           x = x,
           y = y,
           arrow = ggplot2::arrow(ends = ends, type = headtype, angle = headangle,
                         length = ggplot2::unit(x = headlength, units = units)),
           xend = xend,
           yend = yend,
           size = size,
           alpha = alpha,
           color = color,
           linetype = linetype)

}



