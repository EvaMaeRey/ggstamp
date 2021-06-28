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
#'
#'  ggcanvas() +
#'   stamp_text(label = letters[1:4],
#'   xy = spoke(n = 4))
stamp_text <- function(x = 0,
                       y = 0,
                       label = "some\n text",
                       size = 8,
                       alpha = 1,
                       angle = 0,
                       color = "black",
                       lineheight = .8,
                       family = "",
                       vjust = .5,
                       xy = NULL){

  if(!is.null(xy)){
    x = xy[,1]
    y = xy[,2]
  }


annotate(geom = "text",
         x = x,
         y = y,
         lineheight = lineheight,
         label = label,
         size = size,
         color = color,
         angle = angle,
         alpha = alpha,
         vjust = vjust)

}






