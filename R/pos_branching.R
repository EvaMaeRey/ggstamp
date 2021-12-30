#' Title
#'
#' @param x0 numeric x start position
#' @param y0 numeric y start position
#' @param n number of positions
#' @param width numeric, width between positions
#' @param height numeric, height between positions
#'
#' @return
#' @export
#'
#' @examples
#' # first example
#' pos_branching()
#' ggcanvas() +
#'  stamp_point(xy = pos_branching()) +
#'  stamp_polygon(x0y0 = pos_branching(n = 15, ncol = 4),
#'      alpha = .5) +
#'  stamp_label(label = 1:15, xy = pos_branching(n = 15, ncol = 4)) +
#'  stamp_polygon(n = 4,
#'                x0y0 = pos_branching(n = 15, ncol = 4)[15,],
#'                fill = "magenta", alpha = .4, radius = sqrt(.75))
#'
#' # get coords for single position
#' pos_branching(n = 15)[15,]
#' pos_branching(n = 15)[1:4,]
pos_branching <- function(x0 = 0, y0 = 0, n = 5, ncol = 3, width = 2*sqrt(.75),
                      height = width * .75/sqrt(.75)){

  data.frame(x0 = pos_branching_x(x0 = x0, n = n, width = width),
             y0 = pos_branching_y(y0 = y0, n = n, height = height))

}


