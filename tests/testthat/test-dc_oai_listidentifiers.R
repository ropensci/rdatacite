context("dc_oai_listidentifiers")

test_that("dc_oai_listidentifiers - set", {
  skip_on_cran()
  skip_on_travis()
  
  today <- format(Sys.Date() - 1, "%Y-%m-%d")
  aa <- dc_oai_listidentifiers(from = today, set = "ANDS")

  expect_is(aa, "tbl_df")
  expect_equal(aa$setSpec[1], "ANDS")
})

test_that("dc_oai_listidentifiers - from & until", {
  skip_on_cran()
  skip_on_travis()

  aa <- dc_oai_listidentifiers(from = '2011-06-01T', until = '2011-07-01T')
  expect_is(aa, "tbl_df")
})

test_that("dc_oai_listidentifiers fails well", {
  skip_on_cran()
  skip_on_travis()

  no_msg <- "The combination of the values of the from, until, set, and metadataPrefix arguments results in an empty list"

  expect_error(dc_oai_listidentifiers(from = '2011-06-01T', 
    until = 'adffdsadsf'),
    "The request includes illegal arguments", class = "error"
  )
  expect_error(dc_oai_listidentifiers(from = '2011-06-01T', 
    until = 5), 
    "The request includes illegal arguments", class = "error"
  )
  expect_error(dc_oai_listidentifiers(url = 5), "One or more of your URLs",
    class = "error")
  expect_error(dc_oai_listidentifiers(from = '2011-06-01T', 
    until = '2011-11-01T', set = "STUFF"), no_msg, class = "error")
})
