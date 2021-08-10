#' Stamp some text
#'
#' This function adds a text annotation layer
#'
#' @inheritParams stamp_curve
#'
#' @return
#' @export
#'
#' @examples
#' # segments on canvas
#'  ggcanvas() +
#'  stamp_path(color = "green") +
#'  stamp_path(xy = pos_honeycomb(ncol = 1, n = 12),
#'             alpha = .5, lineend = "round")
#'
#'
stamp_path <- function(x = 0:3,
                       y = c(0,1,0,1),

                        alpha = 1,
                        color = "black",
                        linetype = "solid",
                        size = 1.5,

                        lineend = "butt",
                        linejoin = "round",

                        arrow = arrow(length = 0),
                        arrow.fill = NULL,

                       xy = NULL
                        ){

  if (!is.null(xy)){

    x = xy[,1]
    y = xy[,2]

  }

  annotate(geom = "path",
           x = x,
           y = y,

           size = size,
           alpha = alpha,
           color = color,

           lineend = lineend,
           linejoin = linejoin,
           # arrow = arrow,
           # arrow.fill = arrow.fill
           )

}



