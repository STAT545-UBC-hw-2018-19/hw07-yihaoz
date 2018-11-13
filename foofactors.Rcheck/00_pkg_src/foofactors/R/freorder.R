#' @title Reorder factor
#'
#' @desciption a version of reorder() that uses desc() a la (d)plyr
#'
#' @param  a factor x
#'
#' @return x in descending order
#'
#' @usage freorder()
#'
#' @export

freorder <- function(x){
  # use internal fcheck() to check if input is a valid factor
  fcheck(x)

  #return in descending order
  return(reorder(x, dplyr::desc(x)))
}
