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
#' ggcanvas() +
#'  stamp_text_parse()
#'
stamp_text_parse <- function(x = 0,
                       y = 0,
                       label = 'bold(italic(p)*"-value"<"0.01")',

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

                       parse = TRUE,
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






