#' Stamp inverse of a polygon of n sides
#'
#' This function adds a text annotation layer.
#' Contribute or help document https://github.com/EvaMaeRey/ggstamp/blob/master/R/stamp_polygon.R
#'
#'
#' @inheritParams stamp_polygon
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
#'  stamp_polygon_inverse(x0 = 20, y0 =50, color = "darkred",
#'  size = .5,
#'  radius = 10)
#'
#' # on a canvas
#'  ggcanvas() +
#'   stamp_polygon_inverse(n = 3, x0 = c(0,2.5),
#'   fill = "magenta", color = "purple") +
#'   stamp_label(x = pos_polygon_x(x0 = 0, n = 3),
#'               y = pos_polygon_y(y0 = 0, n = 3),
#'               label = c("hi", "hello", "bye")) +
#'   stamp_point(color = "turquoise")
#'
#' # lots of polygons
#'  ggcanvas() +
#'  stamp_polygon_inverse(radius = 3, n_vertices = 5,
#'                        fill = "turquoise") +
#'  stamp_polygon_inverse(fill = "slateblue2",
#'                        radius = 1.5, n_vertices = 7) +
#'  stamp_polygon_inverse(linetype = "dashed",
#'                        alpha = .5, fill = "plum2") +
#'  stamp_polygon_inverse(x0 = 1, y0 = 1.5, n_vertices = 3,
#'                        rotation = .25, size = 0,
#'                        fill = "goldenrod2") +
#'  stamp_polygon_inverse(n_vertices = 50, radius = .2,
#'                        size = 0) +
#'  stamp_spoke(angle = pi * 1:7/15, radius = 2)
#'
#' # some more
#'  ggcanvas() +
#'   stamp_png() +
#'   stamp_polygon_inverse(radius = .45,
#'                         radius_outer = Inf) +
#'   stamp_polygon(alpha = .2, radius = .45,
#'                 color = "grey30")
stamp_polygon_inverse <- function(x0 = 0,
                          y0 = 0,
                          n_vertices = 6,
                          radius = 1,
                          radius_outer = radius*2^.5,
                          size = 0,
                          alpha = 1,
                          rotation = -.5,
                          linetype = "solid",
                          fill = "white",
                          color = "black",
                          x0y0 = NULL){

  if(!is.null(x0y0)){
    x0 = x0y0[,1]
    y0 = x0y0[,2]
  }

  groups <- max(c(length(x0), length(y0)))

  tibble::tibble(x0, y0, group = 1:groups) %>%
    tidyr::crossing(the_n = 0:(n_vertices)) %>%
  dplyr::mutate(
    x = c(x0 + radius * cos(-2*pi*0:(n_vertices)/n_vertices - rotation * pi)),
    y = c(y0 + radius * sin(-2*pi*0:(n_vertices)/n_vertices - rotation * pi))
  ) ->
  df_poly

  tibble::tibble(x0, y0, group = 1:groups) %>%
    tidyr::crossing(the_n = 1:5) %>%
  dplyr::mutate(
  x = x0 + c(1, -1, -1, 1, 1)*radius_outer,
  y = y0 + c(1, 1, -1,-1, 1)*radius_outer
  ) ->
  outer

  dplyr::bind_rows(outer, df_poly) ->
    df

  annotate(geom = "polygon",
           x = df$x,
           y = df$y,
           size = size,
           fill = fill,
           alpha = alpha,
           linetype = linetype,
           color = color,
           group = df$group
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


