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
#' # stamp in plotspace
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
#'   stamp_png()
#'
#' # tiling pngs needs work
#' ggcanvas() +
#'   stamp_png(x0y0 = pos_wrap_png(),
#'   alpha = .75)
stamp_png <- function(x0 = 0,
                        y0 = 0,
                        png = system.file("img", "Rlogo.png", package = "png"),
                        image = png::readPNG(png),
                        width = 1,
                        height = width*dim(image)[1]/dim(image)[2],
                        show.legend = F,
                        alpha = 1,
                        x0y0 = NULL,
                      reduce = NULL){

  # png = "docs/my_bird.png"

  if(!is.null(reduce)){
  png %>%
  magick::image_read() %>%
  magick::image_scale(geometry = 400) %>%
  magick::image_write(path = "temp.png")

  png = "temp.png"
  }

  if(!is.null(x0y0)){
    x0 = x0y0[,1]
    y0 = x0y0[,2]
  }

  if (dim(image)[3] >= 3){
    data.frame(
      pixel_x = sort(rep(1:dim(image)[2], dim(image)[1])/dim(image)[2]),
      pixel_y = -rep(1:dim(image)[1], dim(image)[2])/dim(image)[1],
      pixel_red   = as.vector(image[ , , 1]),
      pixel_blue  = as.vector(image[ , , 2]),
      pixel_green = as.vector(image[ , , 3])) ->
    image_info
  }

  if (dim(image)[3] == 2){

    data.frame(
      pixel_x = sort(rep(1:dim(image)[2], dim(image)[1])/dim(image)[2]),
      pixel_y = -rep(1:dim(image)[1], dim(image)[2])/dim(image)[1],
      pixel_black  = as.vector(image[ , , 1]),
      pixel_alpha  = as.vector(image[ , , 2])) %>%
      mutate(pixel_red = pixel_black,
             pixel_blue = pixel_black,
             pixel_green = pixel_black) ->
      image_info

  }

    if (dim(image)[3] == 4){

      image_info$pixel_alpha = as.vector(image[ , , 4]) * alpha

    } else if (dim(image)[3] == 3) {

      image_info$pixel_alpha = 1
    }



    image_info %>%
      dplyr::mutate(
      pixel_fill = grDevices::rgb(.data$pixel_red,
                       .data$pixel_blue,
                       .data$pixel_green,
                       .data$pixel_alpha)
               ) ->
    image_df

  xy_df <- data.frame(x0, y0)

  image_df %>%
    tidyr::crossing(xy_df) %>%
    dplyr::mutate(pixel_y = (.data$pixel_y + .5) * height + y0) %>%
    dplyr::mutate(pixel_x = (.data$pixel_x - .5) * width + x0) ->
  image_df




  list(
  ggplot2::geom_raster(data = image_df,
              aes(x = .data$pixel_x, y = .data$pixel_y,
                  # alpha = pixel_alpha,
                  # interpolate = TRUE,
                  fill = .data$pixel_fill)),
  ggplot2::scale_fill_identity()
  )

}

