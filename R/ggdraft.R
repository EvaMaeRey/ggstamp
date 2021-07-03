#' Create a blank canvas
#'
#' Create a blank canvas centered at 0, 0 to use stamps on
#'
#' @param x
#' @param y
#'
#' @return
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggdraft() +
#' stamp_curve(curvature = .325, yend = .6) +
#' stamp_polygon(x0 = .2, y0 = .4, radius = .2, alpha = .4) +
#' stamp_text(x = .2, y = .4, label = "{ggstamp}", size = 5, color = "grey97")
#'
#' last_plot() +
#' theme_void()
ggdraft <- function(x = 0, y = 0,
                    width = 1,
                    height = 1/1.618){

  ggplot2::ggplot(data = data.frame(x = c(x, x + width),
                                    y = c(y, y + height)),
                                    mapping = aes(x = x, y = y)) +
    ggplot2::coord_equal(expand = TRUE, clip = "off") +
    ggplot2::theme(panel.grid = element_line(color = "grey35"),
      panel.background = ggplot2::element_rect(fill = NA),
      panel.ontop = TRUE,
    ) +
    theme(
      panel.background = element_rect(fill = "transparent"), # bg of the panel
      plot.background = element_rect(fill = "transparent", color = NA), # bg of the plot
      legend.background = element_rect(fill = "transparent"), # get rid of legend bg
      legend.box.background = element_rect(fill = "transparent") # get rid of legend panel bg
    )

}

