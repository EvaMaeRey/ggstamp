#' Return positions for equilateral polygon vertices
#'
#' @inheritParams pos_wrap
#'
#' @return
#' @export
#'
#' @examples
#' pos_days_in_month()
#' pos_days_in_month(date = "1999-02-05")
#' pos_days_in_month(month = "2012-01",
#'                   days_in_month = 2)
#'
#' # Using w plotspace
#' ggcanvas() +
#' stamp_tile(xy = pos_month(month = "2020-02")) +
#' stamp_label(xy =
#'   pos_days_in_month(month = "2020-02", days_in_month = c(1,2,8)),
#' label = c(1,2,8))
pos_days_in_month <- function(date = c("2020-02-11", "2020-02-15"),
                              month = NULL,
                              days_in_month = NULL,
                              x0 = 0, y0 = 0,
                              week_start_day = "Sunday",
                              width = 1,
                              height = width){

  if(is.null(month)){
    month <- stringr::str_extract(date[1], "\\d{4}-\\d{2}")
  }

  start_date <- lubridate::as_date(paste0(month, "-01"))

  start_day <- lubridate::wday(start_date)

  num_days <- lubridate::days_in_month(start_date)

  x <- (start_day + 1:num_days) %% 7 + x0
  y <- -((start_day + 1:num_days) %/% 7) + 1 + y0
  mday <- 1:num_days
  mdate <- paste0(month, "-",
                  mday %>% stringr::str_pad(width = 2, pad = "0"))

  month_df <- data.frame(x, y, mday, mdate)

  if(is.numeric(days_in_month)){
    month_df[month_df$mday %in% days_in_month, ]
  }else{
    month_df[month_df$mdate %in% date, ]
  }

}




