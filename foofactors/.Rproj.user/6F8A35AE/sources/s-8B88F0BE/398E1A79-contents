library(testthat)

context("Check if a factor is character")

test_that("Factor's unique vaues == length", {
  f <- factor(c("a", "b", "c"))
  expect_true(fdetect(f))
})

test_that("Factor's unique vaues != length", {
  f <- factor(c("a", "b", "a"))
  expect_false(fdetect(f))
})

test_that("Test with non-factor input", {
  f<- gapminder::gapminder
  expect_error(fdetect(f))
})
