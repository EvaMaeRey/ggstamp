
#' Create dataframe that finds positions for stacking
#'
#'
#'
#' @inheritParams pos_wrap
#'
#' @export
#' @return
#'
#' @examples
#' ggcanvas() +
#'  stamp_point(xy = pos_stack(), color = "blue") +
#'  stamp_text(xy = pos_stack(), label = letters[1:5])
#'
pos_stack <- function(x0 = 0,
                 y0 = 0,
                 n = 5,
                 ncol = 3,
                 width = 1,
                 height = width){

  data.frame(x0 = pos_stack_x(x0 = x0, n = n, ncol = ncol, width = width),
             y0 = pos_stack_y(y0 = y0, n = n, ncol = ncol, height = height))

}

