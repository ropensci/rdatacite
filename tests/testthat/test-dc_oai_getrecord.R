context("dc_oai_getrecord")

test_that("dc_oai_getrecord - basic functionality works", {
  skip_on_cran()
  skip_on_travis()

  aa <- dc_oai_getrecord("oai:oai.datacite.org:32255")

  expect_is(aa, "list")
  expect_is(aa[[1]], "list")
  expect_is(aa[[1]]$header, "tbl_df")
  expect_is(aa[[1]]$metadata, "tbl_df")
  expect_is(aa[[1]]$header$identifier, "character")
  expect_is(aa[[1]]$metadata$title, "character")
})

test_that("dc_oai_getrecord - many record Ids input works", {
  skip_on_cran()
  skip_on_travis()

  recs <- c("oai:oai.datacite.org:32255", "oai:oai.datacite.org:32325")
  aa <- dc_oai_getrecord(recs)

  expect_is(aa, "list")
  expect_is(aa[[1]], "list")
  expect_is(aa[[2]], "list")

  expect_is(aa[[1]], "list")
  expect_is(aa[[1]]$header, "tbl_df")
  expect_is(aa[[1]]$metadata, "tbl_df")
  expect_is(aa[[1]]$header$identifier, "character")
  expect_is(aa[[1]]$metadata$title, "character")

  expect_equal(NROW(aa[[2]]$header), 1)
  expect_equal(unname(vapply(aa, "[[", "", c('header', 'identifier'))), recs)
})

test_that("dc_oai_getrecord fails well", {
  skip_on_cran()

  expect_error(dc_oai_getrecord(),
               "argument \"id\" is missing, with no default", class = "error")
  expect_error(dc_oai_getrecord('5000000000000asfaffs'),
               "is unknown or illegal in this repository", class = "error")
})
