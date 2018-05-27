context("dc_data_center")

test_that("dc_data_center basic functionality works", {
  vcr::use_cassette("dc_data_center", {
    aa <- dc_data_center("cdl.dryad")
    expect_is(aa, "list")
    expect_named(aa, "data")
    expect_named(aa$data, c('id', 'type', 'attributes', 'relationships'))
    expect_equal(aa$data$type, 'data-centers')
    expect_match(aa$data$id, 'cdl.dryad')
    expect_is(aa$data$attributes, 'list')
    expect_is(aa$data$relationships, 'list')
    expect_named(aa$data$relationships, 'member')
    expect_equal(aa$data$attributes$title, 'Dryad')
  })
})

test_that("dc_data_center fails nicely", {
  skip_on_cran()
  expect_error(dc_data_center(), "argument \"data_center_id\" is missing")
})
