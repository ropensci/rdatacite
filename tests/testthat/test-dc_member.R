context("dc_member")

test_that("dc_member basic functionality works", {
  vcr::use_cassette("dc_member", {
    aa <- dc_member("cern")
    expect_is(aa, "list")
    expect_named(aa, "data")
    expect_named(aa$data, c('id', 'type', 'attributes'))
    expect_equal(aa$data$type, 'members')
    expect_match(aa$data$id, 'cern')
    expect_is(aa$data$attributes, 'list')
    expect_match(tolower(aa$data$attributes$title), 'cern')
  }, preserve_exact_body_bytes = TRUE)
})

test_that("dc_member fails nicely", {
  skip_on_cran()
  expect_error(dc_member(), "argument \"member_id\" is missing")
})
