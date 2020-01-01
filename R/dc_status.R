#' DataCite REST API: status of the API
#'
#' @export
#' @param ... curl options passed on to [crul::HttpClient]
#' @examples \dontrun{
#' dc_status()
#' }
dc_status <- function(...) {
  res <- crul::HttpClient$new(dc_rest_base())$get("heartbeat", ...)
  res$raise_for_status()
  res$raise_for_ct("text/plain")
  res$parse("UTF-8")
}
