#' Title
#'
#' @param x0
#' @param y0
#' @param n
#' @param radius
#' @param rotation
#'
#' @return
#' @export
#'
#' @examples
#' pos_spoke()
#' pos_spoke(n = 10)
#'
#' # Using w plotspace
#' ggcanvas() +
#' stamp_label(label = c("hi", "bye", "tchao"),
#'             xy = pos_spoke(n = 3,
#'             rotation = -.5,
#'             radius = .5))
pos_spoke <- function(x0 = 0, y0 = 0, n = 5, radius = 1, rotation = -.5){

  data.frame(x0 = pos_spoke_x(x0 = x0, n = n, radius = radius, rotation = rotation),
             y0 = pos_spoke_y(y0 = y0, n = n, radius = radius, rotation = rotation))


}


