## code to prepare `lotr_data` dataset goes here
# Get html
html <- rvest::read_html(
  "https://www.goalcast.com/wise-memorable-lord-rings-quotes/"
)

# Extract relevant elements
lotr_scrape <- html %>%
  rvest::html_elements(".single-main-content span") %>%
  rvest::html_text2() %>%
  stringr::str_remove_all("[“”]") %>%
  stringr::str_replace_all("[\u2018\u2019\u201A\u201B\u2032\u2035]", "'") %>%
  stringr::str_subset("—$|―$", negate = TRUE) %>%
  stringr::str_trim() %>%
  .[-c(9:12, 81)]

# Create tidy data
lotr_data <- tibble::tibble(
  quote = lotr_scrape[c(TRUE,FALSE)],
  character = lotr_scrape[c(FALSE,TRUE)] %>%
    stringr::str_remove("—|―") %>%
    stringr::str_trim()
)

usethis::use_data(lotr_data, overwrite = TRUE)
