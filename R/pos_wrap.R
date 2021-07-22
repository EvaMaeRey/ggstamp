
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
#' pos_wrap()
#' pos_wrap(n = 7, ncol = 2)
pos_wrap <- function(x0 = 0,
                 y0 = 0,
                 n = 5,
                 ncol = 3,
                 width = 1,
                 height = width){

  data.frame(x0 = pos_wrap_x(x0 = x0, n = n, ncol = ncol, width = width),
             y0 = pos_wrap_y(y0 = y0, n = n, ncol = ncol, height = height))

}

