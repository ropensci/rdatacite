context("dc_cn")

test_that("dc_cn works", {
  vcr::use_cassette("dc_cn", {
    aa <- dc_cn(c("10.5281/zenodo.50213", "10.5281/zenodo.57081"), "text")
  }, preserve_exact_body_bytes = TRUE)
  expect_is(aa, "list")
  for (i in aa) expect_is(i, "character")
  for (i in aa) expect_match(i, "Petchey")
})

test_that("dc_cn fails well", {
  expect_error(dc_cn(), 'missing')
  expect_error(dc_cn(4), 'must be of class')
  expect_error(dc_cn("Asdf", format = 5), 'must be of class')
  expect_error(dc_cn("Asdf", style = 5), 'must be of class')
  expect_error(dc_cn("Asdf", locale = 5), 'must be of class')

  skip_on_cran()
  vcr::use_cassette("dc_cn_fail", {
    expect_warning(dc_cn("adsfs"), "exist")
  })
})
