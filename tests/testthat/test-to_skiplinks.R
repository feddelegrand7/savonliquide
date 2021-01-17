test_that("the function returns a shiny.tag.list class", {


  output <- htmltools::tags$a(id = "kla", "Do you want to skip the content ?") %>%
    to_skiplinks(skip_to = "#inp7")

  expect_s3_class(output, "shiny.tag.list")


})


test_that("the function returns a list type", {


  output <- htmltools::tags$a(id = "kla", "Do you want to skip the content ?") %>%
    to_skiplinks(skip_to = "#inp7")

  testthat::expect_type(output, "list")


})


test_that("the function gives back error when mandatory parameters missing", {


  expect_error(to_skiplinks())

  expect_error(to_skiplinks(element = htmltools::tags$a(id = "kla", "Do you want to skip the content ?")))

  expect_error(to_skiplinks(, skip_to = "#inp7"))



})

