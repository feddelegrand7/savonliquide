

#' Title
#'
#' @param text text displayed in the anchor
#' @param skip_to the html element to skip to
#'
#' @return
#' @export
#'
#' @examples

to_skiplinks <- function(element,
                         skip_to,
                         bg_color = "#212121",
                         col = "#F2F2F2") {



  tagList(

    htmltools::tagAppendAttributes(
      element,
      href = skip_to
    ),

    htmltools::tags$head(tags$style(glue::glue(

      "
      #{htmltools::tagGetAttribute(element, attr = 'id')} {{

      position: absolute;
      height: 30px;
      left: 50%;
      transform: translateY(-100%);
      transition: transform 0.3s;
      background: {bg_color};
      color: {col};
      padding: 8px;
      z-index: 9999;
      border-radius: 10px;
      }}

      #{htmltools::tagGetAttribute(element, attr = 'id')}:focus {{

      transform: translateY(0%)

      }}

      "


    )))



  )


}
