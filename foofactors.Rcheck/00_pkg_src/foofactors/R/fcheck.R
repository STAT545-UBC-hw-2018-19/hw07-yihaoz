#' @title
#' Detect factors that should be character or not
#' @description
#'Detect factors that should be character because # unique values = length
#' @usage
#' fcheck(x)
#' @param x
#' a factor.
#' @return
#' An error is raised if x is not a factor

fcheck <- function(x) {
  # check if the input is a factor or not
  if (!is.factor(x)) {
    stop("The input is not a factor!")
  }
}
