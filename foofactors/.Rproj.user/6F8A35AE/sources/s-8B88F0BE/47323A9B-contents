#' @title
#' Sets levels of a factor
#'
#' @description
#' Sets levels to the order in which they appear in the data
#'
#' @usage
#' fset(x)
#'
#' @param x
#' a factor. If x is not a factor, an error is raised.
#'
#' @return
#' This function returns a factor with the level set to the order in which they appear in the data.
#'
#' @examples
#' fset(factor(c("B", "A", "D"))) # Levels: B A D
#'
#' @export

fset <- function(x) {
  fcheck(x)

  return(factor(x, as.character(unique(x))))
}
