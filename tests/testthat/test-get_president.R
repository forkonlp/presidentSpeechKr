context("test-get_president.R")

test_that("get president options", {
  dat <- get_president()
  expect_equal(length(dat), 10)
})
