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
#' library(ggplot2)
#' ggplot(cars) +
#'  aes(speed, dist) +
#'  geom_point() +
#'  stamp_polygon(color = "darkred", radius = 5)
#'
#'  ggcanvas() +
#'   stamp_polygon(n = 3, x0 = c(0, 2.5),
#'   fill = "magenta", color = "purple") +
#'   stamp_label(x = spoke_x(x0 = 0, n = 3),
#'               y = spoke_y(y0 = 0, n = 3),
#'               label = c("hi", "hello", "bye")) +
#'   stamp_point(color = "turquoise")
#'
#'  ggcanvas() +
#'  stamp_polygon(color = "turquoise4", radius = 3, n = 5, fill = "turquoise") +
#'  stamp_polygon(fill = "slateblue2", radius = 2, n = 7) +
#'  stamp_polygon(linetype = "dashed", alpha = .5, fill = "plum2") +
#'  stamp_polygon(x0 = 1, y0 = 1.5, n = 3, rotation = .25, size = 0,
#'   fill = "goldenrod2") +
#'  stamp_polygon(n = 50, radius = .2, size = 0) +
#'  stamp_spoke(angle = pi * 1:7/15, radius = 2)
#'
#'  ggcanvas() +
#'   stamp_polygon(x0y0 = wrap(n = 5, ncol = 3, height = 1.5),
#'                 radius = .55, n = 7) +
#'   stamp_text(xy = wrap(n = 5, ncol = 3,
#'            height = 1.5), label = LETTERS[1:5])
#'
stamp_polygon <- function(x0 = 0,
                          y0 = 0,
                          n = 6,
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
    tidyr::crossing(the_n = 1:n) %>%
  dplyr::mutate(
    x = x0 + radius * cos(-2*pi*0:(n-1)/n - rotation * pi),
    y = y0 + radius * sin(-2*pi*0:(n-1)/n - rotation * pi)
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



