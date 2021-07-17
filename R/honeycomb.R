#' Title
#'
#' @param x0
#' @param y0
#' @param n
#' @param ncol
#' @param width
#' @param height
#'
#' @return
#' @export
#'
#' @examples
#' # first example
#' honeycomb()
#' ggcanvas() +
#'  stamp_point(xy = honeycomb()) +
#'  stamp_polygon(x0y0 = honeycomb(n = 15, ncol = 4),
#'      alpha = .5) +
#'  stamp_label(label = 1:15, xy = honeycomb(n = 15, ncol = 4)) +
#'  stamp_polygon(n = 4,
#'                x0y0 = honeycomb(n = 15, ncol = 4)[15,],
#'                fill = "magenta", alpha = .4, radius = sqrt(.75))
#'
#' # get coords for single position
#' honeycomb(n = 15, ncol = 5)[15,]
#' honeycomb(n = 15, ncol = 5)[1:4,]
#'
#' # a hive
#' ggcanvas() +
#'   stamp_polygon(x0y0 = honeycomb(width = 1.8),
#'                 fill = c("goldenrod3"),
#'                 alpha = .8,
#'                 size = 0)  +
#'   stamp_polygon(x0y0 = honeycomb(width = 1.8, n = 12)[c(6:9, 11),],
#'                 fill = c("goldenrod4"),
#'                 alpha = .8,
#'                 size = 0) +
#'   stamp_polygon(x0y0 = honeycomb(width = 1.8, n = 15)[c(10,12:15),],
#'                 fill = c("goldenrod2"),
#'                 alpha = .8,
#'                 size = 0) +
#'   stamp_png(x0y0 = honeycomb(width = 1.8, n = 15)[c(1,5, 10),])
#'
honeycomb <- function(x0 = 0, y0 = 0, n = 5, ncol = 3, width = 2*sqrt(.75), height = width * .75/sqrt(.75)){

  data.frame(x0 = honeycomb_x(x0 = x0, n = n, ncol = ncol, width = width),
             y0 = honeycomb_y(y0 = y0, n = n, ncol = ncol, height = height))

}


