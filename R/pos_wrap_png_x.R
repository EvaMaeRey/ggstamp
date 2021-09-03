#' Title
#'
#' @inheritParams pos_wrap_png
#'
#' @return
#' @export
#'
#' @examples
pos_wrap_x_png <- function(x0 = 0,
                       n = 5,
                       ncol = 3,
                       png = system.file("img", "Rlogo.png", package = "png"),
                       image = png::readPNG(png),
                       width = 1){

  (0:(n-1) %% ncol)*width + x0

}

