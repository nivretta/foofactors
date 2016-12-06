context("factors changed to character")

test_that("character changes factor to character when # unique values = length", {
  x <- character(factor(c("a", "b", "c", "d")))

  z <- as.character(c("a", "b", "c", "d"))

  expect_identical(class(x), class(z))

})

test_that("character does not change factor to character when # unique values =/= length", {
  x <- character(factor(c("a", "b", "c", "d", "a")))

  z <- "NOCHANGE"

  expect_identical(character(x), z)

})

test_that("character does not accept more than 1 arguement", {

  expect_error(character(1,2))

})


