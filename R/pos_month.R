#' Return positions for equilateral polygon vertices
#'
#' @inheritParams pos_wrap
#'
#' @return
#' @export
#'
#' @examples
#' pos_month()
#' pos_month(month = "1999-02")
#'
#' # Using w plotspace
#' ggcanvas() +
#' stamp_tile(xy = pos_month("2021-10")) +
#' stamp_text(xy = pos_month("2021-10"),
#' label = 1:31) +
#' stamp_point(alpha = .2,
#' xy = pos_month()[3:12,],
#' color = "blue", size = 11) +
#' stamp_tile(xy =
#' pos_month("2000-02",
#' x0 = 0, y0 = -5),
#' fill = "linen")
pos_month <- function(month = "2021-10",
                      x0 = 0, y0 = 0,
                      week_start_day = "Sunday",
                      width = 1,
                      height = width){

  start_date <- lubridate::as_date(paste0(month, "-01"))

  day <- lubridate::wday(start_date)

  num_days <- lubridate::days_in_month(start_date)

  x <- (day + 1:num_days) %% 7 + x0
  y <- -((day + 1:num_days) %/% 7) + 1 + y0

  data.frame(x, y)

}


# pos_months <- function(
#                  months = 1:12,
#                  ncol = 3){
#
#   months <- paste(year, "-", 1:12)
#
#   dplyr::bind_rows(
#   pos_month(months[1]),
#   pos_month(months[1]),
#   pos_month("2021-01")
#
#   )
#
#
#
#
# }

