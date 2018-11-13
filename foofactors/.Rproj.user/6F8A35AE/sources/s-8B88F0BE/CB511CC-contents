#' @title Reorder a factor in descending order
#'
#' @description a version of reorder() that uses desc() a la (d)plyr
#'
#' @usage
#' freorder(x)
#'
#' @param x
#' a factor. If x is not a factor, an error is raised.
#'
#' @return
#' This function returns a factor in descending order.
#'
#' @examples
#' freorder(factor(c(3, 2, 4))) # Returns: Levels: 4 3 2
#'
#' @export

freorder <- function(x) {
  # check if the input is a factor or not
  fcheck(x)
  # return a factor in descending order
  return(reorder(x, dplyr::desc(x)))
}
