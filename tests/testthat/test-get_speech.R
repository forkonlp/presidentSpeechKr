context("test-get_speech.R")

test_that("get speech text data", {
  dat <- get_speech("http://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1311235")
  expect_equal(dat$date, "1957.07.04")
})
