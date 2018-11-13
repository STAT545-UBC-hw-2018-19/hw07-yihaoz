library(testthat)

context("Write data frame")

df <- gapminder::gapminder

test_that("Input file is not a data fame", {
  expect_error(df_write(df$continent, "test.txt"))
}

)
test_that("Output file is not a valid .txt", {
  expect_error(df_write(df, "test.csv"))
})

test_that("test with gapminder", {
  expect_silent(df_write(df, "gapminder_test.txt"))
})
