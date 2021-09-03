
#' Title
#'
#' @inheritParams pos_wrap
#' @param width_multi spacing for groups, defaults to width + spacing
#' @param spacing width between wrapped groups, defaulst to 1
#'
#' @return
#' @export
#'
#' @examples
#' # just printing
#' pos_wrap_multi(n = c(3, 4), ncol = 2)
#' pos_wrap_multi()
#'
#' # in plot
#' ggcanvas() +
#'   stamp_point(xy =
#'       pos_wrap_multi(n = c(5, 10),
#'                      ncol = 4))
pos_wrap_multi <- function(x0 = 0,
                           y0 = 0,
                           n = c(5, 8),
                           ncol = 3,
                           width = 1,
                           spacing = 1,
                           width_multi = ncol*width + spacing,
                           height = width){

  df <- data.frame()

  for(i in 1:length(n)){

    df <-
      dplyr::bind_rows(df,
                pos_wrap(n = n[i],
                         ncol = ncol,
                         x0 = (width_multi)*(i-1) + x0,
                         y0 = y0,
                         width = width,
                         height = height)
      )


  }

  df
}
