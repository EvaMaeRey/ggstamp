
#' Title
#'
#' @param x0
#' @param n
#'
#' @return
#' @export
#'
#' @examples
wrap_x <- function(x0 = 0,
                   n = 5,
                   ncol = 3,
                   width = 1){

  (0:(n-1) %% ncol)*width + x0

}

