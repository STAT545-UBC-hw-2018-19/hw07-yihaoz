library(testthat)

context("Check if an input is a factor")

# test case to check if we manually create a factor
test_that("Gapminder is not a factor", {
  expect_error(fcheck(gapinder::gapminder))
})

test_that("Test with a manually created factor", {
  f <- factor(c("a", "b", "c"))

  expect_silent(fcheck(gapminder::gapminder$country))
})

test_that("Test with gapminder$country which is a factor", {
  expect_silent(fcheck(gapminder::gapminder$country))
})
