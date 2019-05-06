context("dc_search")

test_that("dc_search basic functionality works", {
  vcr::use_cassette("dc_search", {
    # default uses q=*:*
    aa <- dc_search(q = "*:*")
    # basic search
    # specify fields to get back
    bb <- dc_search(q = "data", fl=c('doi','updated'),
      rows=2)
    # search a specific field
    cc <- dc_search(q = "datacentre:global", fl=c('doi','has_media'),
      rows=2)
  }, preserve_exact_body_bytes = TRUE)

  expect_is(aa, "tbl_df")
  expect_is(aa$minted, "character")
  expect_lt(20, NCOL(aa))

  expect_is(bb, "tbl_df")
  expect_named(bb, c('updated', 'doi'))
  expect_equal(NROW(bb), 2)

  expect_is(cc, "tbl_df")
  expect_named(cc, c('has_media', 'doi'))
  expect_equal(NROW(cc), 2)
})

test_that("dc_search works w/ csv output", {
  vcr::use_cassette("dc_search_csv", {
    aa <- dc_search(q = '*:*', fl=c('doi','title'), wt='csv')
    bb <- dc_search(q = '*:*', fl=c('doi','title'))
  }, preserve_exact_body_bytes = TRUE)
  
  expect_is(aa, "tbl_df")

  # csv and json output differ, some encoding problem likely
  expect_false(identical(aa, bb))
})
