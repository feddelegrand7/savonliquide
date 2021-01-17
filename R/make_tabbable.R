


#' Make HTML elements tabable
#'
#' @param element the HTML element to be tabable (if not by default)
#' @param tab_index
#' takes either 0, a negative or a positive value according to the required state of the element.
#' 0 will make the element tabable with its relative order defined by the platform convention.
#' a negative value will make the element untabable.
#' a positive value will make the element tabable and its relative order defined by the provided value.
#' @return a tabable HTML element
#' @export
#'
#' @examples
#'
#' if (interactive()) {
#'
#'
#'ui <- fluidPage(
#'
#'textInput(inputId = "inp1", label = "input"),
#'
#'    div(h1("Not tabable")) %>%
#'        make_tabable(tab_index = -1),
#'    div(h2("Tabable ! with priority")) %>%
#'        make_tabable(tab_index = 1),
#'    div(h2("Simply Tabable")) %>%
#'        make_tabable(tab_index = 0))
#'server <- function(input, output, session) {}
#'
#'shinyApp(ui = ui, server = server)
#'
#' }



make_tabable <- function(element, tab_index = 0) {

  tab_index <- as.character(tab_index)

  htmltools::tagAppendAttributes(elements, `tabindex` = tab_index)


}
