write_arg_descr <- function(type = "stamp", # positioner
                            argument = "label"){

  tibble::tribble(
    ~argument, ~descr,
    "label", "blah, blah",
    "x", "x position, defaults to 0",
    "y", "y position, defaults to 0",
    "x0", "x shape center position, defaults to 0",
    "y0", "y shape center position, defaults to 0",
    "xy", "x and y positions defined by the first two columns of a data frame")


}
