


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
#' library(ggplot2)
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
#'   stamp_png(x0 = 0:5 %% 5 + 1,
#'       y0 = -(0:5 %/% 5)/.75  -3, width = .90) +
#'   stamp_png(x0 = 0:2 %% 5 + 1,
#'      y0 = -(0:2 %/% 5)/.75  -6, width = .90) +
#'   scale_fill_identity()
#'
#' ggcanvas() +
#'   stamp_png(x0 = wrap_x(),
#'             y0 = wrap_y_png(), alpha = .5)

stamp_png <- function(x0 = 0,
                        y0 = 0,
                        png = system.file("img", "Rlogo.png", package = "png"),
                        image = png::readPNG(png),
                        width = 1,
                        height = width*dim(image)[1]/dim(image)[2],
                        show.legend = F,
                      alpha = 1,
                        x0y0 = NULL){

  if(!is.null(x0y0)){
    x0 = x0y0[,1]
    y0 = x0y0[,2]
  }

    data.frame(
      pixel_x = sort(rep(1:dim(image)[2], dim(image)[1])/dim(image)[2]),
      pixel_y = -rep(1:dim(image)[1], dim(image)[2])/dim(image)[1],
      pixel_red   = as.vector(image[ , , 1]),
      pixel_blue  = as.vector(image[ , , 2]),
      pixel_green = as.vector(image[ , , 3])) ->
    image_info

    if (dim(image)[3] == 4){

      image_info$pixel_alpha = as.vector(image[ , , 4]) * alpha

    } else {

      image_info$pixel_alpha = 1
    }

    image_info %>%
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
  ggplot2::geom_raster(data = image_df,
              aes(x = pixel_x, y = pixel_y,
                  # alpha = pixel_alpha,
                  fill = pixel_fill)),
  ggplot2::scale_fill_identity()
  )

}




#' Title
#'
#' @param x0
#' @param n
#'
#' @return
#' @export
#'
#' @examples
wrap_x_png <- function(x0 = 0,
                       n = 5,
                       ncol = 3,
                       png = system.file("img", "Rlogo.png", package = "png"),
                       image = png::readPNG(png),
                       width = 1){

  (0:(n-1) %% ncol)*width + x0

}


#' Title
#'
#' @param x0
#' @param n
#'
#' @return
#' @export
#'
#' @examples
wrap_y_png <- function(y0 = 0,
                       n = 5,
                       ncol = 3,
                       png = system.file("img", "Rlogo.png", package = "png"),
                       image = png::readPNG(png),
                       width = 1,
                       height = width*dim(image)[2]/dim(image)[1]
                       ){

  -(0:(n-1) %/% ncol) * height + y0

}


#' Title
#'
#' @param x0
#' @param y0
#' @param n
#' @param ncol
#' @param png
#' @param image
#' @param width
#' @param height
#'
#' @return
#' @export
#'
#' @examples
#' wrap_png()
#' ggcanvas() +
#' stamp_png(x0y0 = wrap_png(width = 1.2)) +
#' stamp_png(x0y0 = wrap_png(width = 1.2, y0 = -4))
wrap_png <- function(x0 = 0,
                     y0 = 0,
                     n = 5,
                     ncol = 3,
                     png = system.file("img", "Rlogo.png", package = "png"),
                     image = png::readPNG(png),
                     width = 1,
                     height = width*dim(image)[2]/dim(image)[1]){

  data.frame(x0 = wrap_x_png(x0 = x0, n = n, ncol = ncol, png = png, image = image, width = width),
             y0 = wrap_y_png(y0 = y0, n = n, ncol = ncol, png = png, image = image, height = height))

}
