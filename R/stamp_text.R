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
#'  stamp_text() +
#'  stamp_text(label = "hi", x = 15:18, y = 75)
stamp_text <- function(x = 0,
                       y = 0,
                       label = "use label\nargument to change\nthis text",
                       size = 8,
                       alpha = 1,
                       angle = 0,
                       color = "black",
                       family = "",
                       vjust = .5, ...){

annotate(geom = "text",
         x = x,
         y = y,
         label = label,
         size = size)

}






