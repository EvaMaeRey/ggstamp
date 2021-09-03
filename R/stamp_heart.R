#' Stamp a heart of n sides
#'
#' This function adds a text annotation layer.
#' Contribute or help document https://github.com/EvaMaeRey/ggstamp/blob/master/R/stamp_polygon.R
#'
#' @inheritParams stamp_ellipse
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
#'  stamp_heart(color = "darkred",
#'              fill = "pink")
#'
#'  ggcanvas() +
#'   stamp_heart()
#'
#' # on a canvas
#'  ggcanvas() +
#'   stamp_heart(n = 18, x0 = c(0, 2.5),
#'   fill = "magenta", color = "purple") +
#'   stamp_label(x = pos_polygon_x(x0 = 0, n = 3),
#'               y = pos_polygon_y(y0 = 0, n = 3),
#'               label = c("hi", "hello", "bye")) +
#'   stamp_point(color = "turquoise")
#'
#' # lots of polygons
#'  ggcanvas() +
#'  stamp_heart(color = "turquoise4", radius = 3, fill = "turquoise") +
#'  stamp_heart(fill = "slateblue2") +
#'  stamp_heart(linetype = "dashed", alpha = .5, fill = "plum2") +
#'  stamp_heart(x0 = 1, y0 = 1.5, n = 3, rotation = .25, size = 0,
#'   fill = "goldenrod2") +
#'  stamp_heart(n = 50, radius = .2, size = 0) +
#'  stamp_spoke(angle = pi * 1:7/15, radius = 2)
#'
#' # some more
#'  ggcanvas() +
#'   stamp_heart(x0y0 = pos_wrap(n = 5, ncol = 3, height = 1.5),
#'                 radius = .5) +
#'   stamp_text(xy = pos_wrap(n = 5, ncol = 3,
#'            height = 1.5), label = LETTERS[1:5])
#'
stamp_heart <- function(x0 = 0,
                          y0 = 0,
                          n_vertices = 200,
                          radius = 1,
                          size = 1.5,
                          alpha = 1,
                          rotation = 0,
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
    tidyr::crossing(the_n = 2*pi*(1:n_vertices)/n_vertices) %>%
  dplyr::mutate(
    y = y0 + radius * (
      .95 * cos(.data$the_n)
      - .35 * cos(2 * .data$the_n)
      - .25 * cos(3 * .data$the_n)
      - .05 * cos(4 * .data$the_n)
      ) - rotation * pi,
    x = x0 + radius * (sin(.data$the_n)^3) - rotation * pi) ->
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
