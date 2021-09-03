#' Stamp a horizontal line, a wrapper for geom_hline
#'
#' @param yintercept numeric indicating yintercept, default to 0
#'
#' @inheritParams stamp_segment
#'
#' @return
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(cars) +
#' aes(speed, dist) +
#' stamp_hline()
#'
#' # on a canvas
#' ggcanvas() +
#' stamp_hline() +
#' stamp_hline(1:6,
#'            linetype = rep(c("dotted", "dashed"), 3))
stamp_hline <- function(yintercept = 0,
                        alpha = 1,
                        color = "black",
                        linetype = "solid",
                        size = 1.5){

  ggplot2::geom_hline(yintercept = yintercept,
                      alpha = alpha,
                      color = color,
                      linetype = linetype,
                      size = size)
}


