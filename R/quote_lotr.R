#' Quoting Lord of the Rings
#'
#' @param character Common name for main characters in Lord of the Rings
#'
#' @return character string from Lord of the Rings
#' @export
#'
#' @examples
#' quote_lotr("Gandalf")
quote_lotr <- function(character) {

  # Pull random quote
  lotr_data %>%
    dplyr::filter(character == .env$character) %>%
    dplyr::slice_sample(n = 1) %>%
    dplyr::pull(quote)
}
