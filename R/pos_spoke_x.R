

#' Title
#'
#' @description help with documentation
#'
#' @param x0
#' @param n
#' @param radius
#' @param rotation
#'
#' @return
#' @export
#'
#' @examples
#' pos_spoke_x()
#' pos_spoke_x(n = 10)
pos_spoke_x <- function(x0 = 0,
            n = 5,
            radius = 1,
            rotation = -.5){

  radius * cos(-2*pi*0:(n-1)/n - rotation * pi) + x0

}

