#' Stamp a polygon of 100 sides
#'
#' This function adds a text annotation layer.
#' Contribute or help document https://github.com/EvaMaeRey/ggstamp/blob/master/R/stamp_polygon.R
#'
#' @param x0 defaults to 0
#' @param y0 defaults to 0
#' @param size
#' @param n
#' @param radius
#' @param alpha
#' @param rotation
#' @param linetype
#' @param fill
#' @param color
#'
#' @return
#' @export
#'
#' @examples
#' # on plot space
#' library(ggplot2)
#' ggplot(cars) +
#'  aes(speed, dist) +
#'  geom_point() +
#'  stamp_circle(color = "darkred", radius = 12)
#'
#' # on a canvas
#'  ggcanvas() +
#'   stamp_circle(x0 = c(0, 2.5),
#'   fill = "magenta", color = "purple") +
#'   stamp_label(xy = pos_spoke(x0 = 0, n = 3),
#'               label = c("hi", "hello", "bye")) +
#'   stamp_point(color = "turquoise")
#'
#' # lots of circles
#'  ggcanvas() +
#'  stamp_circle(color = "turquoise4", radius = 3, fill = "turquoise") +
#'  stamp_circle(fill = "slateblue2", radius = 2) +
#'  stamp_circle(linetype = "dashed", alpha = .5, fill = "plum2") +
#'  stamp_circle(x0 = 1, y0 = 1.5, rotation = .25, size = 0,
#'   fill = "goldenrod2") +
#'  stamp_circle(n = 50, radius = .2, size = 0) +
#'  stamp_spoke(angle = pi * 1:7/15, radius = 2)
#'
#' # some more
#'  ggcanvas() +
#'   stamp_circle(x0y0 = pos_wrap(n = 5, ncol = 3, height = 1.5),
#'                radius = .55)
#'
stamp_circle <- function(x0 = 0,
                          y0 = 0,
                          n = 100,
                          radius = 1,
                          size = 1.5,
                          alpha = 1,
                          rotation = -.5,
                          linetype = "solid",
                          fill = "grey35",
                          color = "black",
                          x0y0 = NULL){

  if(!is.null(x0y0)){
    x0 = x0y0[,1]
    y0 = x0y0[,2]
  }

  stamp_polygon(
           x0 = x0,
           y0 = x0,
           n = n,
           radius = radius,
           size = size,
           fill = fill,
           alpha = alpha,
           linetype = linetype,
           color = color
           )

}


# cars %>%
#   mutate(fvar = dist>75) %>%
#   ggplot(aes(speed, dist)) +
#   geom_point() +
#   facet_wrap(facets = vars(fvar)) +
#   annotate("point", x = 1, y= 2, color = "green", size = 8) +
#   my_annotate("point", x = 1, y= 2)
#
#
# my_annotate <- function (geom, x = NULL, y = NULL, xmin = NULL, xmax = NULL,
#           ymin = NULL, ymax = NULL, xend = NULL, yend = NULL, ...,
#           na.rm = FALSE)
# {
#   position <- compact(list(x = x, xmin = xmin, xmax = xmax,
#                            xend = xend, y = y, ymin = ymin,
#                            ymax = ymax, yend = yend, fvar = FALSE
#                            ))
#   aesthetics <- c(position, list(...))
#   lengths <- vapply(aesthetics, length, integer(1))
#   n <- unique(lengths)
#   if (length(n) > 1L) {
#     n <- setdiff(n, 1L)
#   }
#   if (length(n) > 1L) {
#     bad <- lengths != 1L
#     details <- paste(names(aesthetics)[bad], " (", lengths[bad],
#                      ")", sep = "", collapse = ", ")
#     abort(glue("Unequal parameter lengths: {details}"))
#   }
#   data <- new_data_frame(position, n = n)
#   layer(geom = geom, params = list(na.rm = na.rm, ...), stat = StatIdentity,
#         position = PositionIdentity, data = data, mapping = aes_all(names(data)),
#         inherit.aes = FALSE, show.legend = FALSE)
# }
