#' Create vector for y that, with x will, form a polygon pattern
#'
#' @inheritParams stamp_polygon
#'
#' @return
#' @export
#'
#' @examples
#' pos_polygon_y(n = 6)
#' ggcanvas() +
#' stamp_label(label = "hello",
#'            x = pos_polygon_x(n = 5),
#'            y = pos_polygon_y(n = 5)) +
#' stamp_point(x = pos_polygon_x(n = 5, rot = 0),
#'             y = pos_polygon_y(n = 5, rot = 0))
pos_polygon_y <- function(y0 = 0,
                    n = 5,
                    radius = 1,
                    rotation = -.5){

  radius * sin(-2*pi*0:(n-1)/n - rotation * pi) + y0

}


