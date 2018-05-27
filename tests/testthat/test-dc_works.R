context("dc_works")

test_that("dc_works basic functionality works", {
  vcr::use_cassette("dc_works", {
    aa <- dc_works(query = "climate change")
    expect_is(aa, "list")
    expect_named(aa, c("data", "meta"))
    expect_is(aa$data, 'data.frame')
    expect_is(aa$meta, 'list')
  })
})

test_that("dc_works fails nicely", {
  skip_on_cran()
  expect_error(dc_works(timeout_ms = 1), "time")
})
