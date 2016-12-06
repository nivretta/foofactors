#' A version of factor() that sets levels to the order in which they appear in the data,
#' i.e. set the levels “as is”
#'
#' @param m factor
#' @return factor
#' @export

givenorder <- function(m) {
  factor(m, levels = unique(m))
}
