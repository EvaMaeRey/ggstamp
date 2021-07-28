#' Stamp some text
#'
#' This function adds a text annotation layer
#'
#' @param x defaults to 0
#' @param y defaults to 0
#' @param label defaults with a message about use
#'
#' @param xy a data frame where the first two columns contain x and y positional values
#'
#' @param alpha transparency of label
#' @param color color of text, consider named colors https://evamaerey.github.io/ggplot2_grammar_guide/named_colors
#' @param fill background color of label, consider named colors https://evamaerey.github.io/ggplot2_grammar_guide/named_colors
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
#'  stamp_textbox(x = 20, y = 10) +
#'  stamp_textbox(x = 20, y = 40, label = "*hello*") +
#'  stamp_textbox(label = "**world**", hjust = 0,
#'  y = 77, x = 5, fill = "cadetblue2", label.size = 0)
#'
#' # label on a canvas
#' library(ggtext)
#' ggcanvas() +
#'    stamp_textbox()
#'
stamp_textbox <- function(x = 0,
                       y = 0,
                       label = "a *very* nice **label**",

                       alpha = 1,
                       color = "black",
                       fill = "white",
                       family = "Times",
                       hjust = .5,
                       lineheight = .9,
                       size = 8,
                       vjust = .5,
                       orientation = "upright",
                       width = unit(0.8, "npc"),

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

  ggtext::geom_textbox(data = data.frame(x = 0),
         x = x,
         y = y,
         label = label,

         alpha = alpha,
         color = color,
         fill = fill,
         family = family,
         hjust = hjust,
         lineheight = lineheight,
         size = size,
         vjust = vjust,
         orientation = orientation,
         width = width,

         label.padding = label.padding,
         label.r = label.r,
         label.size = label.size,
         nudge_x = nudge_x,
         nudge_y = nudge_y,
         parse = parse)

}






