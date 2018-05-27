context("dc_members")

test_that("dc_members basic functionality works", {
  vcr::use_cassette("dc_members", {
    aa <- dc_members(query = "ands")
    expect_is(aa, "list")
    expect_named(aa, c("data", "meta"))
    expect_is(aa$data, 'data.frame')
    expect_is(aa$meta, 'list')
  })
})

