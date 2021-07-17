

#' Title
#'
#' @param x0
#' @param n
#' @param ncol
#' @param width
#'
#' @return
#' @export
#'
#' @examples
#' honeycomb_x()
#'
#' honeycomb_x(n = 10, x0 = 5, ncol = 2)
honeycomb_x <- function(x0 = 0, n = 5, ncol = 3, width = 2*sqrt(.75)){

  # major horizontal offset
  (0:(n-1) %% ncol)*width +
    # initial starting point
    x0 +
    # minor offset, more if in odd row
    ((0:(n-1) %/% ncol %% 2)*.5*width)

}

