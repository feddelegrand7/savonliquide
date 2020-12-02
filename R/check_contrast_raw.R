
#' Color Contrast Accessibility Report in a Raw Format
#'
#' @description returns a report from the Contrast Checker API about color contrast for accessibility in a list format
#' so that the information provided can be extracted and piped into other functions.
#'
#' @param fg_col the Foreground Color
#' @param bg_col the Background Color
#'
#' @return Color Contrast Report in a raw format
#' @export
#'
#' @examples
#'
#' check_contrast_raw(fg_col = "#21EA06", bg_col = "#483D3D")
#'
#'




check_contrast_raw <- function(fg_col, bg_col){

  # We need to be sure that the user provide valid HEX colors
  # here we focus on the minimum length (nchar) which is
  # 4 if # is included or 3 if # is not included


  if(grepl(pattern = "#", x = fg_col) && nchar(fg_col) < 4){

    stop("invalid color provided in fg_color, please use valid HEX colors")

  }

  if(!grepl(pattern = "#", x = fg_col) && nchar(fg_col) < 3){

    stop("invalid color provided in fg_color, few characters provided")

  }


  # Same stuff (copy and paste) for bg_col


  if(grepl(pattern = "#", x = bg_col) && nchar(bg_col) < 4){

    stop("invalid color provided in bg_col, please use valid HEX colors")

  }

  if(!grepl(pattern = "#", x = bg_col) && nchar(bg_col) < 3){

    stop("invalid color provided in bg_col, few characters provided")

  }


  # The API doesn't take into account the # so let's remove it.

  fg_col <- gsub(pattern = "#", replacement = "", x = fg_col)

  bg_col <- gsub(pattern = "#", replacement = "", x = bg_col)



  tryCatch(

    expr = {


      # Getting the response from the API. Here I use the glue package so that we
      # can interpolate the arguments (fg_col and bg_col) into the API call.


      response <-  httr::GET(glue::glue("https://webaim.org/resources/contrastchecker/?fcolor={fg_col}&bcolor={bg_col}&api"))


      # Now we need to parse the response
      return(httr::content(response, as = "parsed", encoding = "UTF-8"))




      },


error = function(cond){

  # If there is an error, it would be cool to return the API response so that
  # the error can be investigated, right ?

  message(glue::glue("Error: here the API response status: {response$status_code}"))

  # in the case of an error, let's just return an NA so
  # that we don't break stuffs

  return(NA)

}


  )
}

