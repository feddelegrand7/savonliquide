
test_that("the function returns a shiny.tag.list class", {


  output <- make_skiplinks(
                   htmltools::tags$a(id = "kla", "Do you want to skip the content ?"),
                   skip_to = "#inp7")

  expect_s3_class(output, "shiny.tag.list")


})


test_that("the function returns a list type", {


  output <- make_skiplinks(
                   htmltools::tags$a(id = "kla", "Do you want to skip the content ?"),
                   skip_to = "#inp7")

  testthat::expect_type(output, "list")


})


test_that("the function gives back error when mandatory parameters missing", {


  expect_error(make_skiplinks())

  expect_error(make_skiplinks(element = htmltools::tags$a(id = "kla",
                                                          "Do you want to skip the content ?")))

  expect_error(make_skiplinks(, skip_to = "#inp7"))



})

test_that("expecting error when the id is missing", {


  expect_error(
    htmltools::tags$a("Do you want to skip the content ?") %>%
                 make_skiplinks(skip_to = "#inp7"))


})


test_that("expecting error when the parameters are not character", {


  expect_error(

    htmltools::tags$a(id = "kla", "Do you want to skip the content ?") %>%
      make_skiplinks(skip_to = 123)

  )

  expect_error(

    htmltools::tags$a(id = "kla", "Do you want to skip the content ?") %>%
      make_skiplinks(skip_to = "efef", bg_color = 24234)

  )

  expect_error(

    htmltools::tags$a(id = "kla", "Do you want to skip the content ?") %>%
      make_skiplinks(skip_to = "efef", bg_color = "blue", col = 23342)

  )


})

