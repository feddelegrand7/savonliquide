

#' Transform an HTML element to a Skip Link
#'
#' @param element the element to use as a Skip Link
#' @param skip_to the HTML element to skip to
#' @param bg_color the background color of the element to use as a Skip Link
#' @param col the color of the element to use as a Skip Link
#'
#'
#' @return a Skip Link HTML element
#' @export
#'
#' @examples
#'
#' if (interactive()) {
#'   ui <- fluidPage(
#'     tags$a("do you want to be redirected to google.com ?",
#'       id = "skip-link"
#'     ) %>%
#'       make_skiplinks(
#'         skip_to = "https://google.com",
#'         bg_color = "red",
#'         col = "white"
#'       ),
#'
#'     h1("accessibility is not a detail")
#'   )
#'
#'   server <- function(input, output, session) {}
#'
#'   shinyApp(ui, server)
#' }
make_skiplinks <- function(element,
                           skip_to,
                           bg_color = "#002240",
                           col = "#FFFFFF") {
  if (any(missing(element), missing(skip_to))) {
    stop("'element' and 'skip_to' are mondatory parameters")
  }

  if (!all(
    is.character(skip_to),
    is.character(bg_color),
    is.character(col)
  )) {
    stop("'skip_to', 'bg_color', 'col' must be provided as character strings")
  }

  id <- htmltools::tagGetAttribute(element, attr = "id")

  if (is.null(id)) {
    stop("the element must have an ID attribute")
  }


  htmltools::tagList(
    htmltools::tagAppendAttributes(
      element,
      href = skip_to
    ),

    htmltools::tags$head(htmltools::tags$style(glue::glue(
      "
      #{id} {{
      position: absolute;
      top: -40px;
      left: 0;
      background: {bg_color};
      color: {col};
      padding: 8px;
      z-index: 9999;
      }}

      #{id}:focus {{
      top: 0;
      }}
      "
    )))
  )
}
