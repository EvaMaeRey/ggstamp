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
#' ggbackdrop() +
#' stamp_curve(curvature = .3, yend = .75) +
#' stamp_polygon(x0 = .2, y0 = .6, radius = .2, alpha = .4) +
#' stamp_text(x = .2, y = .6, label = "{ggstamp}", size = 5, color = "grey97")
#'
#' last_plot() +
#' theme_void()
ggbackdrop <- function(x = 0, y = 0,
                       width = 1,
                       alpha = 1,
                       png = system.file("img", "Rlogo.png", package = "png"),
                       image = png::readPNG(png),
                       height = width*dim(image)[1]/dim(image)[2]){

  ggplot2::ggplot(data = data.frame(x = x, y = y),
                  aes(x = 0, y = 0)) +
    stamp_png(width = width,
              height = height,
              alpha = alpha,
              image = image,
              x0 = x + .5 * width,
              y0 = y + .5 * height
              ) +
    ggplot2::coord_equal(expand = TRUE, clip = "off") +
    ggplot2::theme(panel.grid = element_line(color = "grey35"),
      panel.background = ggplot2::element_rect(fill = NA),
      panel.ontop = TRUE,

    )

}

