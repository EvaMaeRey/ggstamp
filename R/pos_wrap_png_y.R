
#' Title
#'
#' @param x0
#' @param n
#'
#' @return
#' @export
#'
#' @examples
pos_wrap_y_png <- function(y0 = 0,
                       n = 5,
                       ncol = 3,
                       png = system.file("img", "Rlogo.png", package = "png"),
                       image = png::readPNG(png),
                       width = 1,
                       height = width*dim(image)[2]/dim(image)[1]
){

  -(0:(n-1) %/% ncol) * height + y0

}
