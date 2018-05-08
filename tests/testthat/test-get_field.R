context("test-get_field.R")

test_that("get field options", {
  dat <- get_field()
  expect_equal(length(dat), 10)
})
