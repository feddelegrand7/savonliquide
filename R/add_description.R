#' Add a description to an HTML element
#'
#' @param element an HTML element to describe
#' @param descID the ID of the div that will describe the HTML element
#' @param description the description of the HTML element
#' @param visible should the description be visible ? Defaults to FALSE
#'
#' @return an HTML element with a description attached to it
#' @export
#'
#' @examples
#'
#' if (interactive()) {
#'   ui <- fluidPage(
#'     h2("Using a screen reader
#'         hit <Tab> or <Shift + Tab> to
#'         navigate between the buttons
#'         and stop at button 5 to see the difference"),
#'
#'     actionButton(
#'       inputId = "inp1",
#'       label = "button 1"
#'     ),
#'     actionButton(
#'       inputId = "inp2",
#'       label = "button 2"
#'     ),
#'     actionButton(
#'       inputId = "inp3",
#'       label = "button 3"
#'     ),
#'     actionButton(
#'       inputId = "inp4",
#'       label = "button 4"
#'     ),
#'     actionButton(
#'       inputId = "inp5",
#'       label = "button 5"
#'     ) %>%
#'       add_description(
#'         description = "hello this is a button
#'                    when you click it you'll have a
#'                    thing, when you don't click it you'll
#'                    have another thing",
#'         descID = "chkoup"
#'       )
#'   )
#'
#'   server <- function(input, output, session) {}
#'
#'   shinyApp(ui, server)
#' }
add_description <- function(element,
                            descID,
                            description,
                            visible = FALSE) {
  if (!visible) {
    htmltools::tagList(
      htmltools::tagAppendAttributes(
        element,
        "aria-describedby" = descID
      ),

      htmltools::tags$div(
        id = descID,
        description
      ),

      htmltools::tags$head(htmltools::tags$style(glue::glue(
        "
    #{descID} {{
      position: absolute;
      left: -1000px;
      width: 1px;
      height: 1px;
      overflow: hidden;
    }}
    "
      )))
    )
  } else {
    htmltools::tagList(
      htmltools::tagAppendAttributes(
        element,
        "aria-describedby" = descID
      ),

      htmltools::tags$div(
        id = descID,
        description
      )
    )
  }
}

#' Describe an HTML element by another one
#'
#' @param element the HTML element to describe
#' @param descID one or a vector of many HTML elements' <IDs>
#' that will be used to describe the 'element' parameter
#'
#' @return an HTML element described by another HTML element
#' @export
#'
#' @examples
#' if (interactive()) {
#'   ui <- fluidPage(
#'     h2("Using a screen reader
#'         hit Tab and Shift + Tab to
#'         navigate between the buttons
#'         and stop at button 2 to see the difference"),
#'
#'     div(
#'       id = "paragraph",
#'       p("The following paragraph tag will be used as a descriptor")
#'     ),
#'
#'     actionButton(
#'       inputId = "inp1",
#'       label = "button 1"
#'     ),
#'     actionButton(
#'       inputId = "inp2",
#'       label = "button 2"
#'     ) %>%
#'       describe_using(
#'         descID = "paragraph"
#'       )
#'   )
#'
#'   server <- function(input, output, session) {}
#'
#'   shinyApp(ui, server)
#' }
describe_using <- function(element,
                           descID) {

  # vectors in R are atomic so if the first element is
  # a character the other elements must follow
  # so let's just assert for the first element

  firstElement <- descID[1]

  if (!is.character(firstElement)) {
    stop("'descID' parameter must be provided as a character string")
  }

  combine_ids <- function(..., sep = " ") {
    paste(..., collapse = sep)
  }

  htmltools::tagAppendAttributes(
    element,
    "aria-describedby" = combine_ids(descID)
  )
}