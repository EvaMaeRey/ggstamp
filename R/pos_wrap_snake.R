#' Title
#'
#' @param x0
#' @param y0
#' @param n
#' @param ncol
#'
#' @return
#' @export
#'
#' @examples
#' pos_wrap_snake()
#'
#' ggcanvas() +
#'  stamp_path(xy = pos_wrap_snake(n = 9, ncol = 3)) +
#'  stamp_label(xy = pos_wrap_snake(n = 9, ncol = 3),
#'  label = LETTERS[1:9])
pos_wrap_snake <- function(x0 = 0,
                 y0 = 0,
                 n = 5,
                 ncol = 3,
                 width = 1,
                 height = width){

  data.frame(x0 = pos_wrap_x(x0 = x0, n = n, ncol = ncol, width = width, snake = T),
             y0 = pos_wrap_y(y0 = y0, n = n, ncol = ncol, height = height))

}

