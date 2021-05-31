#' Stamp a point/points
#'
#' This function adds a point annotation layer
#'
#' @param x a scalar or vector numeric
#' @param y a scalar or vector numeric
#' @param size a scalar or vector numeric
#' @param alpha a numeric between 0 and 1 for transparency
#' @param shape a numeric or character string, "circle" is default but also try "star", "bullet", "diamond", "triangle"
#' @param color a color as a character string or hex, named colors: https://evamaerey.github.io/ggplot2_grammar_guide/named_colors
#' @param stroke a numeric - size of shape outline
#' @param fill a fill color as a character string or hex, named colors: https://evamaerey.github.io/ggplot2_grammar_guide/named_colors
#'
#' @return
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(cars) +
#'  aes(speed, dist) +
#'  geom_point() +
#'  stamp_point() +
#'  stamp_point(color = "red", x = 10, y = 100)
#'
#' ggcanvas() +
#'  stamp_point(color = "green") +
#'  stamp_point(x = 1:5, y = 2, size = 8, alpha = .5)
stamp_point <- function(x = 0,
                        y = 0,
                       size = 8,
                       alpha = 1,
                       shape = "circle",
                       color = "black",
                       stroke = 1,
                       fill = "grey35"){

annotate(geom = "point",
         x = x,
         y = y,
         size = size,
         alpha = alpha,
         shape = shape,
         color = color,
         stroke = stroke,
         fill = fill
         )

}






