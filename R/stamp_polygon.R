#' Stamp a polygon of n sides
#'
#' This function adds a text annotation layer.
#' Contribute or help document https://github.com/EvaMaeRey/ggstamp/blob/master/R/stamp_polygon.R
#'
#'
#' @param x0 numeric x center of shape, defaults to 0
#' @param y0 numeric y center of shape, defaults to 0
#' @param radius a numeric value, the distance between x0 and y0 and the vertices
#' @param fill a character string indicating fill color, defaults to "grey35", for other named colors check out https://evamaerey.github.io/ggplot2_grammar_guide/named_colors
#' @param x0y0 dataframe indicating center of shapes, where first column is vector for x values and second column is vector for y values, defaults to NULL
#' @param n_vertices numeric number of vertices
#' @param rotation numeric indicating how much polygon should be turned from first vertex along positive horizontal
#'
#' @inheritParams stamp_arrow
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
#'  stamp_polygon(color = "darkred", radius = 5)
#'
#' # on a canvas
#'  ggcanvas() +
#'   stamp_polygon(n_vertices = 3, x0 = c(0, 2.5),
#'   fill = "magenta", color = "purple") +
#'   stamp_label(x = pos_polygon_x(x0 = 0, n = 3),
#'               y = pos_polygon_y(y0 = 0, n = 3),
#'               label = c("hi", "hello", "bye")) +
#'   stamp_point(color = "turquoise")
#'
#' # lots of polygons
#'  ggcanvas() +
#'  stamp_polygon(color = "turquoise4", radius = 3, n_vertices = 5, fill = "turquoise") +
#'  stamp_polygon(fill = "slateblue2", radius = 2, n_vertices = 7) +
#'  stamp_polygon(linetype = "dashed", alpha = .5, fill = "plum2") +
#'  stamp_polygon(x0 = 1, y0 = 1.5, n_vertices = 3, rotation = .25, size = 0,
#'   fill = "goldenrod2") +
#'  stamp_polygon(n_vertices = 50, radius = .2, size = 0) +
#'  stamp_spoke(angle = pi * 1:7/15, radius = 2)
#'
#' # some more
#'  ggcanvas() +
#'   stamp_polygon(x0y0 = pos_wrap(n = 5, ncol = 3, height = 1.5),
#'                 radius = .55, n_vertices = 7) +
#'   stamp_text(xy = pos_wrap(n = 5, ncol = 3,
#'            height = 1.5), label = LETTERS[1:5])
#'
stamp_polygon <- function(x0 = 0,
                          y0 = 0,
                          n_vertices = 6,
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

  groups <- max(c(length(x0), length(y0)))

  tibble::tibble(x0, y0, group = 1:groups) %>%
    tidyr::crossing(the_n = 1:n_vertices) %>%
  dplyr::mutate(
    x = x0 + radius * cos(-2*pi*0:(n_vertices-1)/n_vertices - rotation * pi),
    y = y0 + radius * sin(-2*pi*0:(n_vertices-1)/n_vertices - rotation * pi)
  ) ->
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



