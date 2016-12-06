context("Binding factors")

test_that("fbind binds factor (or character)", {
  x <- c('a', 'b')
  x_fact <- factor(x)
  y <- c('c', 'd')
  z <- factor(c('a', 'b', 'c', 'd'))

  expect_identical(fbind(x, y), z)
  expect_identical(fbind(x_fact, y), z)
})

test_that("fbind handles NAs", {
  x <- c(1, NA)
  y <- c('a', 'b')

  z <- factor(c(1, NA, 'a', 'b'))

  expect_identical(fbind(x, y), z)
})

test_that("fbind outputs factor", {
  x <- c('a', 'b')
  y <- c('c', 'd')

  z <- (c('a', 'b', 'c', 'd'))

  expect_failure(expect_identical(fbind(x, y), z))
})
