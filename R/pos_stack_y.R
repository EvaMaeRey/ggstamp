
#' Title
#'
#' @inheritParams pos_wrap
#'
#' @return
#' @export
#'
#' @examples
pos_stack_y <- function(y0 = 0,
                   n = 5,
                   ncol = 3,
                   height = 1){

  (0:(n-1) %/% ncol)*height + y0

}


