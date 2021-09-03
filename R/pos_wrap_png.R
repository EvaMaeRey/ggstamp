

#' Title
#'
#' @inheritParams pos_wrap
#' @inheritParams stamp_png
#'
#' @return
#' @export
#'
#' @examples
#' ggcanvas() +
#'     stamp_png(x0y0 = pos_wrap_png(n = 7)) +
#'     stamp_png(x0y0 = pos_wrap_png(n = 5,
#'               y0 = -2.5), width = .85)
pos_wrap_png <- function(x0 = 0,
                     y0 = 0,
                     n = 5,
                     ncol = 3,
                     png = system.file("img", "Rlogo.png", package = "png"),
                     image = png::readPNG(png),
                     width = 1,
                     height = width*dim(image)[1]/dim(image)[2]){

  data.frame(x0 = pos_wrap_x_png(x0 = x0, n = n, ncol = ncol, png = png, image = image, width = width),
             y0 = pos_wrap_y_png(y0 = y0, n = n, ncol = ncol, png = png, image = image, height = height))

}
