context("dc_data_centers")

test_that("dc_data_centers basic functionality works", {
  vcr::use_cassette("dc_data_centers", {
    aa <- dc_data_centers(member_id = "delft")
    expect_is(aa, "list")
    expect_named(aa, c("data", "meta"))
    expect_is(aa$data, 'data.frame')
    expect_match(aa$data$id, 'delft')
    
    expect_is(aa$meta, 'list')
    expect_named(aa$meta, c('total', 'total-pages', 'page', 'years', 'members'))
    expect_is(aa$meta$years, 'data.frame')
  })
})
