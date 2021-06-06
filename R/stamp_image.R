


#' stamp_png
#'
#' @param image
#' @param grob
#' @param xmin
#' @param xmax
#' @param ymin
#' @param ymax
#'
#' @return
#' @export
#'
#' @examples
#' library(ggplot)
#' ggplot(cars, aes(dist, speed)) +
#'   geom_point() +
#'   stamp_png(x0 = 5:11*10, y0 = 10, height = 1, width = 10) +
#'   scale_fill_identity()
#'
#' ggcanvas() +
#'   stamp_png() +
#'   stamp_png(x0 = 2:3, y0 = 6, width = .95) +
#'   scale_fill_identity()
#'
#' ggcanvas() +
#'   stamp_png(x0 = 0:8 %% 5 + 1,
#'         y = -(0:8 %/% 5)/.75 , width = .90) +
#'   coord_equal() +
#'   stamp_png(x = 0:5 %% 5 + 1,
#'       y = -(0:5 %/% 5)/.75  -3, width = .90) +
#'   stamp_png(x = 0:2 %% 5 + 1,
#'      y = -(0:2 %/% 5)/.75  -6, width = .90) +
#'   scale_fill_identity()

stamp_png <- function(x0 = 0,
                        y0 = 0,
                        png = system.file("img", "Rlogo.png", package = "png"),
                        image = png::readPNG(png),
                        width = 1,
                        height = width*dim(image)[2]/dim(image)[1],
                        show.legend = F){

    data.frame(
      pixel_x = sort(rep(1:dim(image)[2], dim(image)[1])/dim(image)[2]),
      pixel_y = -rep(1:dim(image)[1], dim(image)[2])/dim(image)[1],
      pixel_red = as.vector(image[ , , 1]),
      pixel_blue = as.vector(image[ , , 2]),
      pixel_green = as.vector(image[ , , 3]),
      pixel_alpha = as.vector(image[ , , 4])) %>%
    dplyr::mutate(
      pixel_fill = rgb(pixel_red, pixel_blue, pixel_green, pixel_alpha)
               ) ->
    image_df

  xy_df <- data.frame(x0, y0)

  image_df %>%
    tidyr::crossing(xy_df) %>%
    dplyr::mutate(pixel_y = (pixel_y + .5) * height + y0) %>%
    dplyr::mutate(pixel_x = (pixel_x - .5) * width + x0) ->
  image_df

  list(
  geom_raster(data = image_df,
              aes(x = pixel_x, y = pixel_y,
                  # alpha = pixel_alpha,
                  fill = pixel_fill)),
  scale_fill_identity()
  )

}

