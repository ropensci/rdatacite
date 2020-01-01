cpct <- function(l) Filter(Negate(is.null), l)

pluck <- function(x, name, type) {
  if (missing(type)) {
    lapply(x, "[[", name)
  } else {
    vapply(x, "[[", name, FUN.VALUE = type)
  }
}

last <- function(x) x[length(x)][[1]]

strextract <- function(str, pattern) regmatches(str, regexpr(pattern, str))

`%||%` <- function(x, y) if (is.null(x)) y else x

asl <- function(z) {
  if (is.null(z)) return(NULL)
  if (
    is.logical(z) ||
    tolower(z) == "true" ||
    tolower(z) == "false"
  ) {
    if (z) return("true") else return("false")
  } else {
    return(z)
  }
}

assert <- function(x, y) {
  if (!is.null(x)) {
    if (!inherits(x, y)) {
      stop(deparse(substitute(x)), " must be of class ",
        paste0(y, collapse = ", "), call. = FALSE)
    }
  }
}
