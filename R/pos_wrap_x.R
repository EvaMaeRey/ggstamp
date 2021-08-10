
#' Title
#'
#' @param x0
#' @param n
#'
#' @return
#' @export
#'
#' @examples
#' pos_wrap_x()
#' pos_wrap_x(n = 12)
#' pos_wrap_x(snake = TRUE)
pos_wrap_x <- function(x0 = 0,
                   n = 5,
                   ncol = 3,
                   width = 1,
                   snake = FALSE){


  if(snake == TRUE){

    ifelse(((0:(n-1) %/% ncol) %% 2) == 1,
    ncol*width - (0:(n-1) %% ncol)*width + x0 - 1,
    (0:(n-1) %% ncol)*width + x0
    )

  } else{

    (0:(n-1) %% ncol)*width + x0

  }

}

