

#' Title
#'
#' @description help with documentation
#'
#' @inheritParams stamp_polygon
#'
#' @return
#' @export
#'
#' @examples
#' pos_polygon_x()
#' pos_polygon_x(n = 10)
pos_polygon_x <- function(x0 = 0,
                          n = 5,
            radius = 1,
            rotation = -.5){

  radius * cos(-2*pi*0:(n-1)/n - rotation * pi) + x0

}

