
#' Title
#'
#' @param x0
#' @param n
#'
#' @return
#' @export
#'
#' @examples
pos_wrap_y <- function(y0 = 0,
                   n = 5,
                   ncol = 3,
                   height = 1){

  -(0:(n-1) %/% ncol)*height + y0

}


