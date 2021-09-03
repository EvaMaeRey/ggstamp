#' Stamp a label, text with a background
#'
#' This function adds a text annotation layer
#'
#' @param label defaults with a message about use
#'
#' @param xy a data frame where the first two columns contain x and y positional values
#'
#' @param lineheight spacing between lines if text is wrapped
#' @param family font family
#' @param fontface
#' @param hjust horizontal justification, between 0 and 1, defaults to .5
#' @param size size of text
#' @param vjust vertical justification, between 0 and 1, defaults to .5
#'
#' @param label.padding Amount of padding around label. Defaults to 0.5 lines.
#' @param label.r Radius of rounded corners. Defaults to 0.15 lines.
#' @param label.size Size of label border, in mm.
#' @param parse If TRUE, the labels will be parsed into expressions and displayed as described in ?plotmath.
#' @param nudge_x Horizontal adjustment to nudge labels by. Useful for offsetting text from points, particularly on discrete scales.
#' @param nudge_y Vertical adjustment to nudge labels by. Useful for offsetting text from points, particularly on discrete scales.
#'
#' @inheritParams stamp_circle
#'
#'
#' @return
#' @export
#'
#' @examples
#' # labels on a plot
#' library(ggplot2)
#' ggplot(cars) +
#'  aes(speed, dist) +
#'  geom_point() +
#'  stamp_label(x = 20, y = 10) +
#'  stamp_label(label = "hi",
#'  y = c(100, 75, 50), x = 5, fill = "cadetblue2", label.size = 0)
#'
#' # label on a canvas
#' ggcanvas() +
#'    stamp_label()
stamp_label <- function(x = 0,
                       y = 0,
                       label = "a nice label",

                       alpha = 1,
                       color = "black",
                       fill = "white",
                       family = "Times",
                       fontface = "bold",
                       hjust = .5,
                       lineheight = .85,
                       size = 5,
                       vjust = .5,

                       nudge_x = 0,
                       nudge_y = 0,
                       label.padding = ggplot2::unit(0.5, units = "lines"),
                       label.r = ggplot2::unit(0.15, units = "lines"),
                       label.size = .3,
                       parse = FALSE,
                       xy = NULL){

  if(!is.null(xy)){
    x = xy[,1]
    y = xy[,2]
  }

annotate(geom = "label",
         x = x + nudge_x,
         y = y + nudge_y,
         label = label,

         alpha = alpha,
         color = color,
         fill = fill,
         family = family,
         fontface = fontface,
         hjust = hjust,
         lineheight = lineheight,
         size = size,
         vjust = vjust,

         label.padding = label.padding,
         label.r = label.r,
         label.size = label.size,
         parse = parse)

}






