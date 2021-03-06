context("chmp_ping")

test_that("chmp_ping with vcr", {
  skip_on_cran()
  skip_on_travis()

  vcr::use_cassette("chmp_ping", {
    aa <- chmp_ping()

    expect_is(aa, "list")
    expect_named(aa, c('health_status'))
    expect_is(aa$health_status, "character")
  })
})

test_that("chmp_ping curl options work", {
  skip_on_cran()

  expect_error(chmp_ping(timeout_ms = 1), "Timeout was reached")
})
