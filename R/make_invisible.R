

#' Make an element invisible
#'
#' @param element the element to make invisible
#' @description Make an element invisible so that it can only be read
#' by screen readers
#' @return an invisible HTML element
#' @export
#'
#' @examples

make_invisible <- function(element) {

  if (is.null(htmltools::tagGetAttribute(element, attr = 'id'))) {
    stop("you need to provide an ID attribute to the element")
  }

  tagList(
    element,
    htmltools::tags$head(htmltools::tags$style(glue::glue(
      "
    #{htmltools::tagGetAttribute(element, attr = 'id')} {{

    position: absolute;
    left: -1000px;
    width: 1px;
    height: 1px;
    overflow: hidden;

    }}



    "
    )))

  )











}
