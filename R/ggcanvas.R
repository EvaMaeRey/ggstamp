#' Create a blank canvas
#'
#' Create a blank canvas centered at 0, 0 to use stamps on
#'
#' @param x center of canvas for x axis
#' @param y center of canvas for y axis
#'
#' @return
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggcanvas() +
#'   stamp_point(color = "plum4") +
#'   stamp_point(x = 1, y = 1,
#'               color = "lightsteelblue3",
#'               size = 35) +
#'   stamp_arrow(color = "plum4",
#'               headlength = .06,
#'               headtype = "closed") +
#'   stamp_label(1.5, 2.5, label = "      \n\n\n\n\n",
#'               size = 15,
#'               fill = "lemonchiffon", ) +
#'   stamp_circle(2.5, 1.25,
#'                fill = "plum4") +
#'   stamp_point(x = c(2,2:4), y = 1:4,
#'               color = "paleturquoise",
#'               size = 15) +
#'   stamp_arrow(y = 2, yend = 1:4,
#'               xend = c(2,2:4),
#'               color = "cadetblue4") +
#'   stamp_label(1, 3.5, label = "Stamps!",
#'               fill = "paleturquoise3") +
#'   stamp_label(3.2, 1.75, label = "Umm...  \n         ",
#'               size = 18,
#'               fill = "thistle") +
#'   stamp_label(3.2, 1.75, label = "Umm...  \n Stamps!",
#'               size = 18,
#'               fill = "thistle") +
#'   theme_void() +
#'   stamp_curve(x = .25 + log(1:12),
#'               xend = 1.5 + sqrt(1:12),
#'               y = 0 + 1:12/20,
#'               color = "palegreen3",
#'               yend = 1:12/6,
#'               curvature = -.1,
#'               alpha = 12:1/12)
ggcanvas <- function(x = 0, y = 0){

  ggplot2::ggplot(mapping = aes(x = x, y = y)) +
    ggplot2::coord_equal(clip = "off")

}

