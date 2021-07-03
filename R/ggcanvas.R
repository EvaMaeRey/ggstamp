#' Create a blank canvas
#'
#' Create a blank canvas centered at 0, 0 to use stamps on
#'
#' @param x
#' @param y
#'
#' @return
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggcanvas() +
#' stamp_text() +
#' stamp_text(x = 2) +
#' theme_void() +
#' stamp_point(x = 1, y = 1)
ggcanvas <- function(x = 0, y = 0){

  ggplot2::ggplot(mapping = aes(x = x, y = y)) +
    ggplot2::coord_equal(clip = "off")

}

