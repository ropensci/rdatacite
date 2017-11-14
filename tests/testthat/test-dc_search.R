context("dc_search")


test_that("dc_search basic functionality works", {
  skip_on_cran()

  # default uses q=*:*
  aa <- dc_search(q = "*:*")
  # basic search
  #bb <- dc_search(q = "laser", rows = 2, verbose = FALSE)
  # specify fields to get back
  bb <- dc_search(q = "data", fl=c('doi','updated'),
    rows=2)
  # search a specific field
  cc <- dc_search(q = "datacentre:global", fl=c('doi','state'),
    rows=2)

  expect_is(aa, "tbl_df")
  expect_is(aa$minted, "character")
  expect_lt(20, NCOL(aa))

  expect_is(bb, "tbl_df")
  expect_named(bb, c('updated', 'doi'))
  expect_equal(NROW(bb), 2)

  expect_is(cc, "tbl_df")
  expect_named(cc, c('state', 'doi'))
  expect_equal(NROW(cc), 2)
})

test_that("dc_search works w/ csv output", {
  skip_on_cran()

  aa <- dc_search(q = '*:*', fl=c('doi','title'), wt='csv')
  bb <- dc_search(q = '*:*', fl=c('doi','title'))

  expect_is(aa, "tbl_df")

  # csv and json output differ, some encoding problem likely
  expect_false(identical(aa, bb))
})

test_that("dc_search fails nicely", {
  skip_on_cran()
  expect_error(dc_search(callopts = list(timeout_ms = 1)),
    "Timeout was reached")
})
