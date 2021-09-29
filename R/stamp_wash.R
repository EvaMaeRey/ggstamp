#' Stamp some text
#'
#' This function adds a text annotation layer
#'
#' @inheritParams stamp_rect
#'
#' @return
#' @export
#'
#' @examples
#' # wash
#' library(ggplot2)
#' ggplot(cars) +
#'  aes(speed, dist) +
#'  geom_point() +
#'  stamp_wash() +
#'  stamp_wash(fill = "red")
#'
#' # over backdrop
#' ggbackdrop() +
#'  stamp_wash(fill = "green",
#'             alpha = .2)
stamp_wash <- function(xmin = -Inf,
                       ymin = -Inf,
                       xmax = Inf,
                       ymax = Inf,

                       x = 0,
                       y = 0,

                       alpha = .5,
                       color = alpha("linen",0),
                       fill = "linen",
                       linetype = "solid",
                       size = .5,

                       xxyy = NULL

                       ){

if(!is.null(xxyy)){
  xmin = xxyy[,1]
  xmax = xxyy[,2]
  ymin = xxyy[,3]
  ymax = xxyy[,4]
}

annotate(geom = "rect",
         xmin = xmin,
         ymin = ymin,
         xmax = xmax,
         ymax = ymax,

         x = x,
         y = y,

         alpha = alpha,
         color = color,
         fill = fill,
         linetype = linetype,
         size = size,

         )

}






