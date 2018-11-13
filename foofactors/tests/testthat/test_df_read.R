library(testthat)

context("Read data frame")

test_that("Input file is not a valid .txt", {
  file.create("test.csv")
  expect_error(df_read("test.csv"))
  file.remove("test.csv")
})

test_that("Input file not found", {
  expect_error(df_read("dummy.txt"))
})

test_that("test with gapminder", {
  df_write(gapminder::gapminder, "gapminder_test.txt")
  read_df <- df_read("gapminder_test.txt")
  expect_true(is.data.frame(read_df))
  file.remove("gapminder_test.txt")
})
