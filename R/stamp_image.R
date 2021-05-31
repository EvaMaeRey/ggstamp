


#' stamp_image
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
#' ggplot(cars, aes(dist, speed)) +
#'   geom_point() +
#'   stamp_image(width = 10, x = 40, y = 20, height = 1)
#'
#' ggcanvas() +
#'   stamp_image() +
#'   stamp_image(x = 2:3, y = 6, width = .95) +
#'   coord_equal() +
#'   scale_fill_viridis_c()
#'
#' ggcanvas() +
#'   stamp_image(x = 0:8 %% 5 + 1,
#'         y = -(0:8 %/% 5)/.75 , width = .90) +
#'   coord_equal() +
#'   stamp_image(x = 0:5 %% 5 + 1,
#'       y = -(0:5 %/% 5)/.75  -3, width = .90) +
#'   stamp_image(x = 0:2 %% 5 + 1,
#'      y = -(0:2 %/% 5)/.75  -6, width = .90)

stamp_image <- function(image = png::readPNG(system.file("img", "Rlogo.png", package = "png")),
                        grob = grid::rasterGrob(image = image),
                        x = 0,
                        y = 0,
                        width = 1,
                        height = width*dim(image)[2]/dim(image)[1],
                        show.legend = F){

    data.frame(
      pixel_x = sort(rep(1:dim(image)[2], dim(image)[1])/dim(image)[2]),
      pixel_y = -rep(1:dim(image)[1], dim(image)[2])/dim(image)[1],
      pixel_z = as.vector(image[,,4])
               ) ->
    image_df

  xy_df <- data.frame(x = x, y = y)

  image_df %>%
    tidyr::crossing(xy_df) %>%
    dplyr::mutate(pixel_y = (pixel_y + .5) * height + y) %>%
    dplyr::mutate(pixel_x = (pixel_x - .5) * width + x) ->
  image_df

  geom_raster(data = image_df,
              aes(x = pixel_x, y = pixel_y, fill = pixel_z), show.legend = show.legend)

}

