
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
#' pos_honeycomb_y()
#' ggcanvas() +
#'  stamp_polygon(x0 = pos_honeycomb_x(),
#'                y0 = pos_honeycomb_y())
pos_honeycomb_y <- function(y0 = 0, n = 5, ncol = 3, height = 1.5){

  -(0:(n-1) %/% ncol)*height + y0

}


