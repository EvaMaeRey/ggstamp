#' Stamp some text
#'
#' This function adds a text annotation layer
#'
#' @param x defaults to 0
#' @param y defaults to 0
#' @param label defaults with a message about use
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
#'  stamp_label() +
#'  stamp_label(label = "hi", y = c(100,75,50), x = 20)
stamp_label <- function(x = 0,
                       y = 0,
                       label = "use label\nargument to change\nthis label",
                       size = 8,
                       alpha = 1,
                       angle = 0,
                       color = "black",
                       fill = "white",
                       lineheight = .8,
                       family = "",
                       vjust = .5,
                       label.padding = ggplot2::unit(0.5, units = "lines"),
                       ...){

annotate(geom = "label",
         x = x,
         y = y,
         fill = fill,
         label = label,
         lineheight = lineheight,
         label.padding = label.padding,
         size = size)

}






