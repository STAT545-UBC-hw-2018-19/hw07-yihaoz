#' @title
#' Read data frame
#'
#' @description
#' Read data frames to plain text delimited files while retaining factor levels
#'
#' @param dfname
#' path for the data frame
#'
#' @usage df_read(dfname, txtfilename = "plain.txt")
#'
#' @export

df_read <- function(filename) {
  # Check if name is valid .txt
  pattern <- ".*(.txt)$"
  if (!grepl(pattern, filename)) {
    stop("Input file is not in valid txt format")
  }

  # Check if file exists
  if (!file.exists(filename)) {
    stop("File not found.")
  }
  return(dget(filename))
}
