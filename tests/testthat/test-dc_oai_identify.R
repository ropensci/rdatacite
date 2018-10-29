context("dc_oai_identify")

test_that("dc_oai_identify - default uses datacite", {
  skip_on_cran()
  skip_on_travis()

  aa <- dc_oai_identify()

  expect_is(aa, "data.frame")
  expect_match(aa$repositoryName, "DataCite")
  expect_match(aa$baseURL, "oai.datacite.org")
})
