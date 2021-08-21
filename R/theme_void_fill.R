#' Title
#'
#' @param fill
#' @param color
#'
#' @return
#' @export
#'
#' @examples
#' ggcanvas() +
#'   stamp_png() +
#'   theme_void_fill()
theme_void_fill <- function(fill = "linen", color = fill){

  ggplot2::theme_void() +
    ggplot2::theme(plot.background = ggplot2::element_rect(fill = fill, color = color)) +
    ggplot2::theme(panel.background = ggplot2::element_rect(fill = fill, color = color))

}
