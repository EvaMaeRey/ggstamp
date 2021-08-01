#' Stamp a polygon of n sides
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
#' # some more
#'  ggcanvas() +
#'   stamp_png(width = 3) +
#'   stamp_polygon_holes(x0y0 = pos_honeycomb(n = 5),
#'   radius = .95,
#'                         radius_outer = Inf) +
#'   stamp_polygon(alpha = .2, radius = .95,
#'                 color = "grey30")
stamp_polygon_holes <- function(x0 = 0,
                          y0 = 0,
                          n = 6,
                          radius = 1,
                          radius_outer = Inf,
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
    tidyr::crossing(the_n = 0:n) %>%
  dplyr::mutate(
    x = c(x0 + radius * cos(-2*pi*0:(n)/n - rotation * pi)),
    y = c(y0 + radius * sin(-2*pi*0:(n)/n - rotation * pi))
  ) ->
  df_poly

  # tibble::tibble(x0, y0, group = 1:groups) %>%
  #   tidyr::crossing(the_n = 1:5) %>%
  dplyr::tibble(
  x = c(1, -1, -1, 1, 1)*radius_outer,
  y = c(1, 1, -1,-1, 1)*radius_outer
  ) %>%
      dplyr::mutate(group = 0) ->
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
           color = color#,
           #group = df$group
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


