
#' Title
#'
#' @inheritParams pos_wrap
#'
#' @return
#' @export
#'
#' @examples
pos_stack_x <- function(x0 = 0,
                   n = 5,
                   ncol = 3,
                   width = 1){

  (0:(n-1) %% ncol)*width + x0

}

