library(testthat)

context("Reorder a factor in descending order")

test_that("Factor with numerics", {
  f <- factor(c(2,3,1))

  expect_equal(
    levels(freorder(f)),
    c("3","2","1")
  )
})

test_that("Factor with duplicated elements", {
  f <- factor(c("a", "b", "c", "a"))

  expect_equal(
    levels(freorder(f)),
    c("c", "b", "a")
  )
})

test_that("Factor with unique elements", {
  f <- factor(c("a", "b", "c"))

  expect_equal(
    levels(freorder(f)),
    c("c", "b", "a")
  )
})

test_that("Not a data frame", {
  df <- gapminder::gapminder

  expect_error(freorder(df))
})
