#' @title
#' Detect factors that should be character
#'
#' @description
#' Detect factors that should be character because # unique values = length
#'
#' @usage
#' fdetect(x)
#'
#' @param x
#' a factor
#'
#' @return
#' Returns boolean
#' Returns \code{TRUE} if # unique values = length
#' An error is raised if # unique values != length
#'
#' @examples
#' fdetect(factor(c("a", "b","a"))) # FALSE
#' fdetect(factor(c("a", "b", "c"))) # TRUE
#' @export

fdetect <- function(x) {
  # use internal fcheck() to check if input is a valid factor
  fcheck(x)

  return(length(unique(x)) == length(x))
}
