my_mean <- function(x) {
  sum(x, na.rm = TRUE) / length(x[!is.na(x)])
}