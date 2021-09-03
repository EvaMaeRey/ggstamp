

#' Create vector for x that, with y will, form a wrapping honeycomb pattern
#'
#' @inheritParams pos_honeycomb
#'
#' @return
#' @export
#'
#' @examples
#' pos_honeycomb_x()
#'
#' pos_honeycomb_x(n = 10, x0 = 5, ncol = 2)
pos_honeycomb_x <- function(x0 = 0, n = 5, ncol = 3, width = 2*sqrt(.75)){

  # major horizontal offset
  (0:(n-1) %% ncol)*width +
    # initial starting point
    x0 +
    # minor offset, more if in odd row
    ((0:(n-1) %/% ncol %% 2)*.5*width)

}

