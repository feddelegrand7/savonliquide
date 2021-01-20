

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
#' ui <- fluidPage(
#'   # use Tab and Shift + Tab to navigate between the buttons
#'   # and see the difference
#'
#'   actionButton(
#'     inputId = "inp1",
#'     label = "button"
#'   ),
#'   actionButton(
#'     inputId = "inp2",
#'     label = "button"
#'   ),
#'   actionButton(
#'     inputId = "inp3",
#'     label = "button"
#'   ),
#'   actionButton(
#'     inputId = "inp4",
#'     label = "button"
#'   ),
#'   actionButton(
#'     inputId = "inp5",
#'     label = "button"
#'   ) %>%
#'     add_description(
#'       description = "hello this is a button
#'                    when you click it you'll have a
#'                    thing, when you don't click it you'll
#'                    have another thing",
#'       descID = "chkoup"
#'     )
#' )
#'
#' server <- function(input, output, session) {}
#'
#' shinyApp(ui, server)
add_description <- function(element,
                            descID,
                            description,
                            visible = FALSE) {
  if (!visible) {
    tagList(
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
    tagList(
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
