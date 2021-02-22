

test_that("the function returns a character", {

  testthat::skip_on_cran()

  expect_is(object = check_contrast(fg_col = "#21EA06", bg_col = "#483D3D"),
            class = "character")

})


test_that("check if the function returns the same output when inputing color with and without #", {

  testthat::skip_on_cran()

  expect_equivalent(

    check_contrast(fg_col = "#21EA06", bg_col = "#483D3D"),

    check_contrast(fg_col = "21EA06", bg_col = "483D3D")


  )


})


test_that("check if the function throw an error when inputing wrong colors", {

  expect_error(

    check_contrast(fg_col = "23", bg_col = "#4")

  )

  expect_error(

    check_contrast(fg_col = "", bg_col = "#334")

  )


  expect_error(

    check_contrast(fg_col = "#333", bg_col = "#34")

  )

  expect_error(

    check_contrast(fg_col = "#333", bg_col = "34")

  )




})
