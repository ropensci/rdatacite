context("dc_events")

test_that("dc_events works", {
  vcr::use_cassette("dc_events", {
    aa <- dc_events(limit = 5)
  }, preserve_exact_body_bytes = TRUE)
  expect_is(aa, "dc")
  expect_equal(sort(names(aa)), c("data", "links", "meta"))
  expect_is(aa$data, 'data.frame')
  expect_null(aa$included)
  expect_is(aa$meta, 'list')
  expect_type(aa$meta$total, 'integer')
  expect_type(aa$meta$totalPages, 'integer')
  expect_is(aa$links, 'list')
})

test_that("dc_events fails well", {
  expect_error(dc_events(ids = 3433), 'must be of class')
  expect_error(dc_events(query = 5), 'must be of class')
  expect_error(dc_events(limit = "foo"), 'must be of class')
  expect_error(dc_events(page = "bar"), 'must be of class')
  expect_error(dc_events(cursor = TRUE), 'must be of class')
})
