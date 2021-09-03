#' Return positions for equilateral polygon vertices
#'
#' @param n number of positions
#' @inheritParams stamp_polygon
#'
#' @return
#' @export
#'
#' @examples
#' pos_polygon()
#' pos_polygon(n = 10)
#'
#' # Using w plotspace
#' ggcanvas() +
#' stamp_label(label = c("hi", "bye", "tchao"),
#'             xy = pos_polygon(n = 3,
#'             rotation = -.5,
#'             radius = .5))
pos_polygon <- function(x0 = 0, y0 = 0, n = 5, radius = 1, rotation = -.5){

  data.frame(x0 = pos_polygon_x(x0 = x0, n = n, radius = radius, rotation = rotation),
             y0 = pos_polygon_y(y0 = y0, n = n, radius = radius, rotation = rotation))


}


