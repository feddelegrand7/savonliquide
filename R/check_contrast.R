
check_contrast <- function(fg_col, bg_col){

tryCatch(

  expr = {

   fg_col <- gsub(pattern = "#", replacement = "", x = fg_col)

   bg_col <- gsub(pattern = "#", replacement = "", x = bg_col)

   # Getting the response from the API. Here I use the glue package so that we
   # can interpolate the arguments (fg_col and bg_col) into the API call.


   response <-  httr::GET(glue::glue("https://webaim.org/resources/contrastchecker/?fcolor={fg_col}&bcolor={bg_col}&api"))


   # Now we need to parse the response
   text <- httr::content(response, as = "parsed", encoding = "UTF-8")


   # Now let's print the results of the contrast checker
   # in the form of a report. I'll use the glue package
   # in conjunction with crayon to print out a nice
   # formatted and colorized text output to the console.

   glue::glue("

* The Contrast Ratio is {crayon::bold(text$ratio)}

* The result for the AA check is : {if(text$AA == 'pass')
{{crayon::green('PASS')}} else {{crayon::red('FAIL')}}}

* The result for the AALarge check is : {if(text$AALarge == 'pass')
{{crayon::green('PASS')}} else {{crayon::red('FAIL')}}}

* The result for the AAA check is : {if(text$AAA == 'pass')
{{crayon::green('PASS')}} else {{crayon::red('FAIL')}}}

* The result for the AAALarge check is : {if(text$AAALarge == 'pass')
{{crayon::green('PASS')}} else {{crayon::red('FAIL')}}}

"

)},


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
