#' Stamp some text
#'
#' This function adds a text annotation layer
#'
#' @inheritParams stamp_label
#' @Params angle angle of text
#'
#' @return
#' @export
#'
#' @examples
#' # cool text
#' library(ggplot2)
#' ggplot(cars) +
#'  aes(speed, dist) +
#'  geom_point() +
#'  stamp_text(label = stringr::str_wrap("a speed v. stopping distance, 1920s study tells us ...", 30),
#'             x = 12, y = 110,
#'             size = 5)
#'
#' # some more
#'  ggcanvas() +
#'   stamp_text() +
#'   stamp_text(label = letters[1:4],
#'   xy = pos_spoke(n = 4)) +
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
                       label = "some\n text",
                       alpha = 1,
                       angle = 0,
                       color = "black",
                       family = "times",
                       fontface = "sarif",
                       hjust = 0,
                       lineheight = .8,
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


annotate(geom = "text",
         x = x,
         y = y,
         lineheight = lineheight,
         label = label,
         size = size,
         color = color,
         angle = angle,
         alpha = alpha,
         vjust = vjust,
         parse = parse,
         nudge_x = nudge_x,
         nudge_y = nudge_y)

}






