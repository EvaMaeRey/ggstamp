

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
#' @param y0
#' @param n
#' @param radius
#' @param rotation
#'
#' @return
#' @export
#'
#' @examples
#' spoke()
spoke <- function(x0 = 0, y0 = 0, n = 5, radius = 1, rotation = -.5){

  data.frame(x0 = spoke_x(x0 = x0, n = n, radius = radius, rotation = rotation),
             y0 = spoke_y(y0 = y0, n = n, radius = radius, rotation = rotation))


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
                   ncol = 3,
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
wrap_y <- function(y0 = 0,
                   n = 5,
                   ncol = 3,
                   height = 1){

  -(0:(n-1) %/% ncol)*height + y0

}



#' Title
#'
#' @param x0
#' @param y0
#' @param n
#' @param ncol
#'
#' @return
#' @export
#'
#' @examples
#' wrap()
#' wrap(n = 7, ncol = 2)
wrap <- function(x0 = 0,
                 y0 = 0,
                 n = 5,
                 ncol = 3,
                 width = 1,
                 height = width){

  data.frame(x0 = wrap_x(x0 = x0, n = n, ncol = ncol),
             y0 = wrap_y(y0 = y0, n = n, ncol = ncol, height = height))

}
