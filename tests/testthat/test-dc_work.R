context("dc_work")

test_that("dc_work basic functionality works", {
  vcr::use_cassette("dc_work", {
    aa <- dc_work(doi = "10.5438/0012")
    expect_is(aa, "list")
    expect_named(aa, "data")
    expect_named(aa$data, c('id', 'type', 'attributes', 'relationships'))
    expect_equal(aa$data$type, 'works')
    expect_match(aa$data$id, '10.5438/0012')
  })
})

test_that("dc_work fails nicely", {
  skip_on_cran()
  expect_error(dc_work(), "argument \"doi\" is missing")
})
