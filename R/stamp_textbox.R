#' Stamp a textbox
#'
#' This function adds a text annotation layer
#'
#'
#'
#'
#' @param orientation defaults to upright
#' @param width numeric for width of box in native plot coordinates, defaults to ?
#'
#' @inheritParams stamp_label
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
#'  stamp_textbox(x = 20, y = 40) +
#'  stamp_textbox(x = 20, y = 20, label = "*hello*") +
#'  stamp_textbox(label = "**world**", hjust = 0,
#'  y = 10, x = 5, fill = "cadetblue2", label.size = 0) +
#'  stamp_point()
#'
#' # label on a canvas
#' library(ggtext)
#' ggdraft() +
#'    stamp_textbox(40, 30, width = unit(0.3, "npc")) +
#'    stamp_point(x = 1:3*10, y = 1)
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
                       width = ggplot2::unit(0.8, "npc"),

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






