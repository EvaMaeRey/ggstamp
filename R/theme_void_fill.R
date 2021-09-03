#' Title
#'
#' @param fill string indicating background color, defaults to "linen"
#' @param color string indicating seams color, defaults to fill color
#'
#' @importFrom ggplot2 '%+replace%'
#'
#' @return
#' @export
#'
#' @examples
#' ggcanvas() +
#'   stamp_png() +
#'   theme_void_fill()
theme_void_fill <- function(fill = "linen", color = fill, ...){

  ggplot2::theme_void(...) %+replace%
    ggplot2::theme(plot.background = ggplot2::element_rect(fill = fill, color = color)) +
    ggplot2::theme(panel.background = ggplot2::element_rect(fill = fill, color = color)) +
    ggplot2::theme(plot.margin = ggplot2::margin(10,10,10,10))

}
