
#' Title
#'
#' @param y0
#' @param n
#' @param ncol
#' @param height
#'
#' @return
#' @export
#'
#' @examples
#' honeycomb_y()
#' ggcanvas() +
#'  stamp_polygon(x0 = honeycomb_x(),
#'                y0 = honeycomb_y())
honeycomb_y <- function(y0 = 0, n = 5, ncol = 3, height = 1.5){

  -(0:(n-1) %/% ncol)*height + y0

}


