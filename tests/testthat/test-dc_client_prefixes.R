context("dc_client_prefixes")

test_that("dc_client_prefixes works", {
  vcr::use_cassette("dc_client_prefixes", {
    aa <- dc_client_prefixes(limit = 5)
  }, preserve_exact_body_bytes = TRUE)
  expect_is(aa, "dc")
  expect_equal(sort(names(aa)), c("data", "included", "links", "meta"))
  expect_is(aa$data, 'data.frame')
  expect_is(aa$included, 'data.frame')
  expect_is(aa$meta, 'list')
  expect_type(aa$meta$total, 'integer')
  expect_is(aa$links, 'list')
})

test_that("dc_client_prefixes fails well", {
  expect_error(dc_client_prefixes(limit = "foo"), 'must be of class')
  expect_error(dc_client_prefixes(page = "bar"), 'must be of class')
  expect_error(dc_client_prefixes(cursor = 5), 'must be of class')
  expect_error(dc_client_prefixes(year = FALSE), 'must be of class')
  expect_error(dc_client_prefixes(query = 5), 'must be of class')
})
