library(testthat)

context("Sets levels to the order in which they appear in the data")

test_that("Factor with numerics", {
  f1 <- factor(c(2,3,1))

  expect_equal(
    levels(fset(f1)),
    c("2", "3", "1")
  )
})

test_that("Factor with duplicated elements", {
  f <- factor(c("c", "b", "a", "c"))

  expect_equal(
    levels(fset(f)),
    c("c", "b", "a")
  )
})

test_that("Not a data frame", {
  df <- gapminder::gapminder
  expect_error(fset(df))
})
