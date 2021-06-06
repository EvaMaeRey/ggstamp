

#' Title
#'
#' @description help with documentation
#'
#' @param x0
#' @param n
#' @param radius
#' @param rotation
#'
#' @return
#' @export
#'
#' @examples
spoke_x <- function(x0 = 0,
            n = 5,
            radius = 1,
            rotation = -.5){

  radius * cos(-2*pi*0:(n-1)/n - rotation * pi) + x0

}


#' Title
#'
#' @param n
#' @param radius
#' @param rotation
#' @param y0
#'
#' @return
#' @export
#'
#' @examples
#' spoke_y(n = 6)
#' ggcanvas() +
#' stamp_label(label = "hello",
#'            x = spoke_x(n = 5),
#'            y = spoke_y(n = 5)) +
#' stamp_point(x = spoke_x(n = 5, rot = 0),
#'             y = spoke_y(n = 5, rot = 0)) +
#' stamp_label(label = c("hi", "bye", "chao"),
#'             x = spoke_x(n = 3, rotation = -.5, radius = .5),
#'             y = spoke_y(n = 3, rotation = -.5, radius = .5))
spoke_y <- function(y0 = 0,
                        n = 5,
                        radius = 1,
                        rotation = -.5){

  radius * sin(-2*pi*0:(n-1)/n - rotation * pi) + y0

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
wrap_x <- function(x0 = 0,
                   n = 5,
                   ncol = 3){

0:(n-1) %% ncol + x0

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
wrap_y <- function(y0 = 0,
                   n = 5,
                   ncol = 3){

  -(0:(n-1) %/% ncol) + y0

}
