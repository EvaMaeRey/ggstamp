#' Stamp a grid for decoupling annotation from plotting
#'
#' @param color grid color, defaults to 'turquoise4'
#' @param fill overlay color, defaults to 'linen'
#' @param alpha numeric between 0 and 1, level of transparency for grid layer
#'
#' @return
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(cars) +
#'   aes(x = speed) +
#'   aes(y = dist) +
#'   geom_point() +
#'   facet_wrap(~speed > 15) ->
#'  p
#'
#' cowplot::ggdraw(p) +
#'   stamp_grid() + # you can comment this guide out later
#'   stamp_text_ljust(label = "Over on this side we look at the slow cars." %>%
#'   stringr::str_wrap(15), x = .15, y = .8, size = 5) +
#'   stamp_segment(x = .35, xend = .35, y = .2, yend = .7,
#'                 size = .5, linetype = "dashed") +
#'   stamp_text_ljust(label = "Over here, fast cars!" %>%
#'   stringr::str_wrap(15), x = .6, y = .2, size = 5) +
#'   stamp_curve(x = .65, y = .27, xend = .79, yend = .5, curvature = -.2)
#'
stamp_grid <- function(color = "turquoise4", fill = "linen", alpha = .5){

  list(
  stamp_rect(xmin = 0, ymin = 0, xmax = 1, ymax = 1, alpha = alpha, fill = fill),
  ggplot2::geom_vline(xintercept = 1:9/10, color = color, alpha = .7, linetype = "dotted"),
  ggplot2::geom_hline(yintercept = 1:9/10, color = color, alpha = .7, linetype = "dotted"),
  stamp_text(label = 1:9/10, x = .05, y = 1:9/10 + .01, size = 3.5,
              color = color, alpha = .8, vjust = 0),
  stamp_text_ljust(label = 1:9/10, y = .95, x = 1:9/10 + .01, size = 3.5,
             color = color, alpha = .8, hjust = 0)
  )

}

