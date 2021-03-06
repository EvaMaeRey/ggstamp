#' Create a canvas with a backdrop
#'
#' Create a blank canvas centered at 0, 0 to use stamps on
#'
#' @param x
#' @param y
#' @param width
#' @param alpha
#' @param png
#' @param image
#' @param height
#'
#' @return
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggbackdrop() +
#' stamp_curve(curvature = .3, yend = 75, xend = 100) +
#' stamp_polygon(x0 = 20, y0 = 60, radius = 20, alpha = .4) +
#' stamp_text(x = 20, y = 60, label = "{ggstamp}",
#'            size = 5, color = "grey97")
#'
#' # voiding grid
#' last_plot() +
#'    theme_void()
ggbackdrop <- function(x = 0, y = 0,
                       width = 100,
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
    ggplot2::coord_equal(expand = FALSE, clip = "off") +
    ggplot2::theme(panel.grid = ggplot2::element_line(color = alpha("grey35", 1)),
                   axis.text.x.top = ggplot2::element_text(),
                   axis.text.y.right = ggplot2::element_text(),
      panel.background = ggplot2::element_rect(fill = NA),
      panel.ontop = TRUE) ->
g

if(width == 100){

  g +
  ggplot2::scale_x_continuous(breaks = 0:5*20)+
  ggplot2::scale_y_continuous(breaks = 0:5*20) ->
g

}

  g

}

