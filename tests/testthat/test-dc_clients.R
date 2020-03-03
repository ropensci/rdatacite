context("dc_clients")

test_that("dc_clients works", {
  vcr::use_cassette("dc_clients", {
    aa <- dc_clients(limit = 5)
  }, preserve_exact_body_bytes = TRUE)
  expect_is(aa, "dc")
  expect_equal(sort(names(aa)), c("data", "included", "links", "meta"))
  expect_is(aa$data, 'data.frame')
  expect_is(aa$included, 'data.frame')
  expect_is(aa$meta, 'list')
  expect_type(aa$meta$total, 'integer')
  expect_is(aa$links, 'list')
})

test_that("dc_clients fails well", {
  expect_error(dc_clients(limit = "foo"), 'must be of class')
  expect_error(dc_clients(page = "bar"), 'must be of class')
  expect_error(dc_clients(cursor = 5), 'must be of class')
  expect_error(dc_clients(year = "asdfasdf"), 'must be of class')
  expect_error(dc_clients(query = 5), 'must be of class')
})
