#' Title
#'
#' @param n
#' @param radius
#' @param rotation
#' @param y0
#'
#' @return
#' @export
#'
#' @examples
#' spoke_y(n = 6)
#' ggcanvas() +
#' stamp_label(label = "hello",
#'            x = spoke_x(n = 5),
#'            y = spoke_y(n = 5)) +
#' stamp_point(x = spoke_x(n = 5, rot = 0),
#'             y = spoke_y(n = 5, rot = 0))
spoke_y <- function(y0 = 0,
                    n = 5,
                    radius = 1,
                    rotation = -.5){

  radius * sin(-2*pi*0:(n-1)/n - rotation * pi) + y0

}


