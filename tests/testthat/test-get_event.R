context("test-get_event.R")

test_that("get event option", {
  dat <- get_event()
  expect_equal(length(dat), 10)
})
