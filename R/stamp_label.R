#' Stamp some text
#'
#' This function adds a text annotation layer
#'
#' @param x defaults to 0
#' @param y defaults to 0
#' @param label defaults with a message about use
#' @param size
#' @param alpha
#' @param angle
#' @param color
#' @param fill
#' @param lineheight
#' @param family
#' @param vjust
#' @param label.padding Amount of padding around label. Defaults to 0.5 lines.
#' @param label.r Radius of rounded corners. Defaults to 0.15 lines.
#' @param xy
#' @param nudge_x Horizontal adjustment to nudge labels by. Useful for offsetting text from points, particularly on discrete scales.
#' @param nudge_y Vertical adjustment to nudge labels by. Useful for offsetting text from points, particularly on discrete scales.
#'
#' @return
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(cars) +
#'  aes(speed, dist) +
#'  geom_point() +
#'  stamp_label(x = 20, y = 10) +
#'  stamp_label(label = "hi",
#'  y = c(100,75,50), x = 5, fill = "cadetblue2", label.size = 0)
#'
#'  ggcanvas() +
#'   stamp_label()
stamp_label <- function(x = 0,
                       y = 0,
                       label = "a nice label",
                       size = 8,
                       alpha = 1,
                       angle = 0,
                       color = "black",
                       fill = "white",
                       lineheight = .85,
                       family = "",
                       vjust = .5,
                       nudge_x = 0,
                       nudge_y = 0,
                       label.padding = ggplot2::unit(0.5, units = "lines"),
                       label.r = ggplot2::unit(0.15, units = "lines"),
                       label.size = .3,
                       xy = NULL){

  if(!is.null(xy)){
    x = xy[,1]
    y = xy[,2]
  }

annotate(geom = "label",
         x = x,
         y = y,
         fill = fill,
         label = label,
         lineheight = lineheight,
         label.padding = label.padding,
         label.r = label.r,
         label.size = label.size,
         nudge_x = nudge_y,
         nudge_y = nudge_y,
         size = size)

}






