#' Stamp some text
#'
#' This function adds a text annotation layer
#'
#' @inheritParams stamp_label
#'
#' @return
#' @export
#'
#' @examples
#' # stamping text on a plot
#' library(ggplot2)
#' ggplot(cars) +
#'  aes(speed, dist) +
#'  geom_point() +
#'  stamp_text(label = "A 1920s study on speed v. stopping distance ...",
#'             x = 3, y = 110,
#'             size = 5,
#'             text_wrap = TRUE,
#'             hjust = 0) +
#'  stamp_text(label = "The Pearson\ncorrelation\nis about 0.81",
#'            x = 18, y = 15,
#'            size = 5, hjust = 0) +
#'  stamp_text(label = 'bold(italic(p)*"-value"<"0.01")',
#'             parse = TRUE,
#'             size = 5, x = 23, y = 2)
#'  cor.test(cars$speed, cars$dist)
#'
#' # some more
#'  ggcanvas() +
#'   stamp_text() +
#'   stamp_text(label = letters[1:4],
#'   xy = pos_polygon(n = 4)) +
#'   stamp_text(x = 2) +
#'   scale_x_continuous(limits = c(-1,3)) +
#'   stamp_text(y = 1:2, x = 2,
#'              label = "Hello\nthere!") +
#'   theme_void() +
#'   stamp_point(x = 1, y = 1,
#'               alpha = .4) +
#'   theme(plot.background =
#'        element_rect(fill = "seagreen",
#'        size = 0)) +
#'   scale_y_continuous(limits = c(-1,3))
stamp_text <- function(x = 0,
                       y = 0,
                       label = "some\ntext",

                       text_wrap = FALSE,
                       char_width = 40,

                       alpha = 1,
                       angle = 0,
                       color = "black",
                       family = "Times",
                       fontface = "bold",
                       hjust = .5,
                       lineheight = .85,
                       size = 8,
                       vjust = .5,

                       xy = NULL,

                       parse = FALSE,
                       nudge_x = 0,
                       nudge_y = 0){

  if(!is.null(xy)){
    x = xy[,1]
    y = xy[,2]
  }

  if(text_wrap){

label <- stringr::str_wrap(label, width = char_width)

}


annotate(geom = "text",
         x = x + nudge_x,
         y = y + nudge_y,
         label = label,

         alpha = alpha,
         angle = angle,
         lineheight = lineheight,
         size = size,
         color = color,
         family = family,
         fontface = fontface,
         vjust = vjust,
         hjust = hjust,
         parse = parse)

}






