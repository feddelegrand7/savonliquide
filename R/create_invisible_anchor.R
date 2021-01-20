

#' Create an HTML invisible anchor
#'
#' @param id id of the anchor
#' @param text text of the anchor
#' @param href of the anchor. Defaults to NULL.
#' @description Make an element invisible so that it can only be read
#' by screen readers
#' @return an invisible HTML anchor element
#' @export
#'
#' @examples

create_invisible_anchor <- function(id, text, href = NULL) {

  href <- if(is.null(href)) {
    NULL
  } else {
    href
  }

  htmltools::tagList(
    make_tabable(htmltools::tags$a(text, id = id, href = href)),

    htmltools::tags$head(htmltools::tags$style(glue::glue(
    "
    #{id} {{
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
