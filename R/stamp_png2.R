#' Stamp a png image
#'

#' @param png a string with the path to an image, defaults to R image
#' @param width the width that the image should fill, defaults to 1
#' @param height the height that the image should fill, calculated to match aspect ratio based on width
#' @param show.legend
#' @param image a numeric array with png red green blue alpha information, defaults to png::readPNG(png)
#'
#' @inheritParams stamp_ellipse
#'
#' @return
#' @export
#'
#' @examples
#' # stamp in plot space
#' library(ggplot2)
#' ggplot(cars, aes(dist, speed)) +
#'   geom_point() +
#'   stamp_png(x0 = 5:11*10, y0 = 10,
#'             height = 1, width = 10)
#'
#' # two stamps
#' ggcanvas() +
#'   stamp_png() +
#'   stamp_png(x0 = 2:3, y0 = 6,
#'             width = .95)
#'
#' # png spokes
#' ggcanvas() +
#'   stamp_png2()
#'
#' # tiling pngs needs work
#' ggdraft() +
#'   stamp_png2(alpha = .75, x0 = .5)
stamp_png2 <- function(x0 = 0,
                      y0 = 0,
                      png = system.file("img", "Rlogo.png", package = "png"),
                      color = "black",
                        width = 1,
                        height = width*dim(image)[1]/dim(image)[2],
                        show.legend = F,
                        alpha = 1,
                        x0y0 = NULL
                      ){


  # only first row for now...
  if(!is.null(x0y0)){
    x0 = x0y0[1,1]
    y0 = x0y0[1,2]
  }

  magick_png <- magick::image_read(png)
  my_raster_grob <- grid::rasterGrob(magick::image_colorize(magick_png,
                                                            opacity = alpha * 100,
                                                            color = color),
                                     interpolate = TRUE)

  xmin <- x0 - .5*width
  xmax <- x0 + .5*width

  ymin <- y0 - .5*width
  ymax <- y0 + .5*width

list(
    stamp_point(alpha = 0, size = 0, x = x0, y = y0),
    ggplot2::annotation_custom(my_raster_grob,
                    ymin = ymin,
                    ymax = ymax,
                    xmin = xmin,
                    xmax = xmax)
)


}

