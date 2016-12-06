context("Frequency of Levels")

test_that("freq_out gives frequency of levels", {
  x <- c('a', 'b', 'c', 'c', 'a')

  z <- frame_data(
    ~x, ~n,
    "a", as.integer(2),
    "b", as.integer(1),
    "c", as.integer(2)
  )

  expect_identical(freq_out(x), z)

})

test_that("freq_out gives integer values for frequency", {
  y <- freq_out(x)

  z <- frame_data(
    ~x, ~n,
    "a", as.integer(2),
    "b", as.integer(1),
    "c", as.integer(2)
  )

  n <- lapply(y$n[1], class)

  w <- lapply(z$n[1], class)

  expect_identical(n, w)

})

test_that("freq_out does accept lists", {
  b <- as.list(x, y, z)

  expect_error(freq_out(b))
})
