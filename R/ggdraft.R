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
#' stamp_curve(curvature = .13,
#'             size = .09,
#'             yend = 20:60,
#'             xend = 100) +
#' stamp_polygon(x0 = 20, y0 = 40,
#'               radius = 20, alpha = .4) +
#' stamp_text(x = 20, y = 40, label = "{ggstamp}",
#'            size = 6, color = "grey97")
#'
#' # remove drafting lines
#' (ggdraft() +
#' stamp_polygon(x0 = 20, y0 = 40,
#'               radius = 20, alpha = .4) +
#' stamp_polygon(x0 = 85, y0 = 23,
#'               radius = 22,
#'               n = 5, fill = "seagreen2")
#'    ) +
#' theme_void()
ggdraft <- function(x = 0, y = 0,
                    width = 100,
                    height = width/1.618){

  ggplot2::ggplot(data = data.frame(x = c(x, x + width),
                                    y = c(y, y + height)),
                                    mapping = aes(x = x, y = y)) +
    ggplot2::coord_equal(expand = FALSE, clip = "on", xlim = c(x, x + width), ylim = c(y, y + height)) +
    ggplot2::theme(panel.grid = element_line(color = "grey35"),
      panel.background = ggplot2::element_rect(fill = NA),
      panel.ontop = TRUE,
    ) +
    theme(
      panel.background = element_rect(fill = "transparent"), # bg of the panel
      plot.background = element_rect(fill = "transparent", color = NA), # bg of the plot
      legend.background = element_rect(fill = "transparent"), # get rid of legend bg
      legend.box.background = element_rect(fill = "transparent"), # get rid of legend panel bg
      axis.title = element_blank()
    ) ->
  g


  if(width == 100){

    g +
      scale_x_continuous(breaks = 0:5*20) +
      scale_y_continuous(breaks = 0:5*20) ->
      g

  }

  g

}
