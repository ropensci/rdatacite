as_dc <- function(x, fun) structure(x, class = "dc", fun = fun)

#' @export
print.dc <- function(x, ...) {
  cat(paste0("datacite: ", attr(x, "fun")), sep = "\n")
  m <- x$meta
  cat(sprintf("found: %s, pages: %s, page: %s",
    m$total, m$totalPages %||% m$`total-pages`, m$page),
    sep = "\n")
  cat(paste0("slots: ", paste0(names(x), collapse=", ")), sep = "\n")
  if (!is.null(x$data)) {
    cat("$data", sep = "\n")
    print(x$data)
    cat("\n")
  }
  if (!is.null(x$data)) {
    cat("$included", sep = "\n")
    print(x$included)
    cat("\n")
  }
  if (!is.null(x$reports)) {
    cat("$reports", sep = "\n")
    print(x$reports)
  }
}
