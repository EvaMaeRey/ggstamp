

#' Create vector for x that, with y will, form a wrapping branching pattern
#'
#' @inheritParams pos_honeycomb
#'
#' @return
#' @export
#'
#' @examples
#' pos_branching_x()
#'
#' pos_branching_x(n = 10, x0 = 5)
pos_branching_x <- function(x0 = 0, n = 6, width = 2*sqrt(.75)){

x_pos <- c()

for (i in 1:n){


x_pos <- c(x_pos,  1:i*width - i*width/2 - .5 * width)

}

x_pos[1:n]

}

