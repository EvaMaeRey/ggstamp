

#' Create vector for x that, with y will, form a wrapping branching pattern
#'
#' @inheritParams pos_honeycomb
#'
#' @return
#' @export
#'
#' @examples
#' pos_branching_y()
#'
#' pos_branching_y(n = 10, y0 = 5)
pos_branching_y <- function(y0 = 0, n = 12, height = 2*sqrt(.75)){

-(rep(1:n, 1:n)[1:n] - 1 ) * height

}

