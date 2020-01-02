context("dc_dois")

test_that("dc_dois works", {
  vcr::use_cassette("dc_dois", {
    aa <- dc_dois(limit = 5)
  }, preserve_exact_body_bytes = TRUE)
  expect_is(aa, "dc")
  expect_equal(sort(names(aa)), c("data", "included", "links", "meta"))
  expect_is(aa$data, 'data.frame')
  expect_is(aa$included, 'data.frame')
  expect_is(aa$meta, 'list')
  expect_type(aa$meta$total, 'integer')
  expect_is(aa$links, 'list')
})

test_that("dc_dois fails well", {
  expect_error(dc_dois(ids = 3433), 'must be of class')
  expect_error(dc_dois(query = 5), 'must be of class')
  expect_error(dc_dois(limit = "foo"), 'must be of class')
  expect_error(dc_dois(page = "bar"), 'must be of class')
  expect_error(dc_dois(cursor = TRUE), 'must be of class')
})
