


#' Make HTML elements tabable
#'
#' @param elements the HTML elements to be tabable (if not by default)
#' @param tab_index
#' takes either 0, a negative or a positive value according to the required state of the element.
#' 0 will make the element tabable with its relative order defined by the platform convention.
#' a negative value will make the element untabable.
#' a positive value will make the element tabable and its relative order defined by the provided value.
#' @return a tabable HTML element
#' @export
#'
#' @examples


make_tabable <- function(elements, tab_index = 0) {

  tab_index <- as.character(tab_index)

  htmltools::tagAppendAttributes(elements, `tabindex` = tab_index)


}
