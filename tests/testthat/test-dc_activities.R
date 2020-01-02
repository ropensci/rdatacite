context("dc_activities")

test_that("dc_activities works", {
  vcr::use_cassette("dc_activities", {
    aa <- dc_activities(limit = 10)
  }, preserve_exact_body_bytes = TRUE)
  expect_is(aa, "dc")
  expect_equal(sort(names(aa)), c("data", "included", "links", "meta"))
  expect_is(aa$data, 'data.frame')
  expect_is(aa$included, 'data.frame')
  expect_is(aa$meta, 'list')
  expect_type(aa$meta$total, 'integer')
  expect_is(aa$links, 'list')
})

test_that("dc_activities fails well", {
  expect_error(dc_activities(limit = "foo"), 'must be of class')
  expect_error(dc_activities(page = "bar"), 'must be of class')
  expect_error(dc_activities(cursor = 5), 'must be of class')
  expect_error(dc_activities(ids = TRUE), 'must be of class')
  expect_error(dc_activities(query = 5), 'must be of class')
})
