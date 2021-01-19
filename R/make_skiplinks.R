

#' Transfrom an HTML element to a Skip Link
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

make_skiplinks <- function(element,
                         skip_to,
                         bg_color = "#212121",
                         col = "#F2F2F2") {




  htmltools::tagList(

    htmltools::tagAppendAttributes(
      element,
      href = skip_to
    ),

    htmltools::tags$head(htmltools::tags$style(glue::glue(

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
      font-weight: bold;
      }}

      #{htmltools::tagGetAttribute(element, attr = 'id')}:focus {{

      transform: translateY(0%)

      }}

      "


    )))



  )


}
