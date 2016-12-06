context("Set levels as is")

test_that("levels will be set as is", {
  z <- factor(c("b", "c", "a", "e", "b"))

  x <- levels(givenorder(z))
  b <- c("b","c", "a", "e")

  expect_identical(x, b)

})

test_that("givenorder accepts numerics and also assigns them levels as is ", {
  z <- factor(c(2, "c", 1, "e", "b"))

  x <- levels(givenorder(z))
  b <- c("2","c", "1", "e", "b")

  expect_identical(x, b)

})

test_that("NA handling works", {

  expect_error(givenorder(c(1:5, NA), na.rm = FALSE))

})
