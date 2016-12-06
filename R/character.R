#' Detect factors that should be character because # unique values = length
#'
#' @param n factor
#' @return tbl_df
#' @export

character <- function(n) {
  if (length(unique(n)) == length(n))
    (as.character(n))
  else
    print("NOCHANGE")
}
