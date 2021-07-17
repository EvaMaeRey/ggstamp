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


flipbook_setup <- "
---

`r chunk_reveal('funct', title = 'funct')`

```{r funct, include = F}
code
```

"


  fs::dir_ls("R/", pattern = "\\.R") %>%
    tibble::tibble(file = .) %>%
    dplyr::mutate(file = as.character(file)) %>%
    dplyr::mutate(funct = stringr::str_remove_all(file, "R/|\\.R")) %>%
    dplyr::mutate(text = purrr::map(file, readLines)) %>%
    tidyr::unnest() %>%
    dplyr::filter(text %>% stringr::str_detect("^\\#\\' ")) %>%
    dplyr::group_by(file, funct) %>%
    dplyr::mutate(start_example = text %>% stringr::str_detect("^\\#\\' @examples")) %>%
    dplyr::mutate(example = ifelse(start_example, T, NA)) %>%
    tidyr::fill(example) %>%
    dplyr::filter(example, !start_example) %>%
    dplyr::mutate(text = text %>% stringr::str_remove("^\\#\\' ")) %>%
    dplyr::summarise(text = paste(text, collapse = "\n")) %>%
    dplyr::mutate(breaks = flipbook_setup) %>%
    dplyr::mutate(breaks = stringr::str_replace_all(breaks, "funct", funct)) %>%
    dplyr::mutate(breaks = stringr::str_replace(breaks, "code", text)) %>%
    dplyr::pull(breaks) %>%
    cat()


  fs::dir_ls("R/", pattern = "\\.Rd")[1] %>%
    readLines()

rd_file_read <- function(file_list){

  tibble(files = f)

  readLines()



}
