#' Horizontal line, wraps geom_vline w defaut at y = 0
#'
#' @param yintercept
#' @param alpha
#' @param color
#' @param linetype
#' @param size
#'
#' @return
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(cars) +
#' aes(speed, dist) +
#' geom_point() +
#' stamp_vline()
#'
#' # on a canvas
#' ggcanvas() +
#' stamp_vline(color = "cadetblue") +
#' stamp_vline(0:5,
#'            linetype = rep(c("dotted", "dashed"), 3))
stamp_vline <- function(xintercept = 0,
                        alpha = 1,
                        color = "black",
                        linetype = "solid",
                        size = 1.5){

  ggplot2::geom_vline(xintercept = xintercept,
                      alpha = alpha,
                      color = color,
                      linetype = linetype,
                      size = size)
}


