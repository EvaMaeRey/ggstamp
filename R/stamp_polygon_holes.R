#' Stamp inverse of several polygons of n sides
#'
#' This function adds a text annotation layer.
#' Contribute or help document https://github.com/EvaMaeRey/ggstamp/blob/master/R/stamp_polygon.R
#'
#' @inheritParams stamp_polygon
#'
#' @return
#' @export
#'
#' @examples
#' # some more
#'  ggcanvas() +
#'   stamp_png(width = 7, x0 = 2.5, y0 = -2.5) +
#'   stamp_polygon_holes(
#'      x0y0 = pos_honeycomb(n = 400,
#'                           ncol = 20,
#'                           width = .3,
#'                           x0 = .03,
#'                           y0 = -.03),
#'                      fill = "grey35",
#'                      radius = .14) +
#'   stamp_polygon_holes(x0y0 = pos_honeycomb(n = 400,
#'                                            ncol = 20,
#'                                            width = .3),
#'   radius = .14, fill = "goldenrod3", n_vertices = 6,
#'                         radius_outer = Inf)
stamp_polygon_holes <- function(x0 = 0,
                          y0 = 0,
                          n_vertices = 6,
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
    tidyr::crossing(the_n = 0:(n_vertices+1)) %>%
  dplyr::mutate(
    x = c(x0 + radius * cos(-2*pi*0:(n_vertices +1)/(n_vertices) - rotation * pi)),
    y = c(y0 + radius * sin(-2*pi*0:(n_vertices +1)/(n_vertices) - rotation * pi))
  ) %>%
    dplyr::mutate(x = ifelse(the_n == (n_vertices+1), radius_outer, .data$x)) %>%
    dplyr::mutate(y = ifelse(the_n == (n_vertices+1), radius_outer, .data$y)) ->
  df_poly

  # tibble::tibble(x0, y0, group = 1:groups) %>%
  #   tidyr::crossing(the_n = 1:5) %>%
  dplyr::tibble(
  x = c(1, -1, -1, 1, 1) * radius_outer,
  y = c(1, 1, -1,-1, 1) * radius_outer
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
           color = color
           )

}



