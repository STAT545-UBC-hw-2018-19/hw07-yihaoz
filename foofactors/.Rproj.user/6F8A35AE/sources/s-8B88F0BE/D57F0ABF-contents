#' @title
#' Write data frame to plain text delimited files
#'
#' @description
#' Write data frames to plain text delimited files while retaining factor levels
#'
#' @usage
#' df_write(df, df_name, file_path = "plain.txt")
#'
#' @param df
#' a data frame to be stored.
#'
#' @param df_file_name
#' txt file name to store the file of the data frame.
#'
#' @export

df_write <- function(df, df_file_name) {
  # check if the input is a data frame or not
  if (!is.data.frame(df)) {
    stop("This is not a data frame")
  }

  # Check if name is valid .txt
  pattern <- ".*(.txt)$"
  if (!grepl(pattern, df_file_name)) {
    stop("Input file is not in valid txt format")
  }

  # write data frame
  dput(df, df_file_name)
}
