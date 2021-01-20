
test_that("expect error when tabindex gt 32767", {

  expect_error(make_tabable(div("hello world"),
                                      tab_index = 32768))

})


test_that("expect savonliquide way equal to htmltools way", {


  element <- htmltools::div("tabable stuff going on  here")

  htmltools0 <- htmltools::tagAppendAttributes(element, `tabindex` = "0")

  savon_liquid0 <- htmltools::div("tabable stuff going on  here") %>%
    make_tabable(0)

  expect_equal(htmltools0, savon_liquid0)


  htmltools1 <- htmltools::tagAppendAttributes(element, `tabindex` = "1")

  savon_liquid1 <- htmltools::div("tabable stuff going on  here") %>%
    make_tabable(1)

  expect_equal(htmltools1, savon_liquid1)

  htmltools_20 <- htmltools::tagAppendAttributes(element, `tabindex` = "-20")

  savon_liquid_20 <- htmltools::div("tabable stuff going on  here") %>%
    make_tabable(-20)

  expect_equal(htmltools_20, savon_liquid_20)



})

test_that("expecting the output of class shiny.tag", {


  savon_liquid <- htmltools::div("tabable stuff going on  here") %>%
    make_tabable(0)

  expect_s3_class(savon_liquid, "shiny.tag")

})


test_that("expecting the output to be of type list", {


  savon_liquid <- htmltools::div("tabable stuff going on  here") %>%
    make_tabable(0)

  expect_type(savon_liquid, "list")

})
