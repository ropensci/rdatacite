context("dc_works")

test_that("dc_works basic functionality works", {
  vcr::use_cassette("dc_works", {
    aa <- dc_works(query = "climate change")
    expect_is(aa, "list")
    expect_named(aa, c("data", "meta"))
    expect_is(aa$data, 'data.frame')
    expect_is(aa$meta, 'list')
  }, preserve_exact_body_bytes = TRUE)
})
