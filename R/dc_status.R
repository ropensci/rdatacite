#' DataCite REST API: status of the API
#'
#' @export
#' @param ... curl options passed on to [crul::HttpClient]
#' @examples \dontrun{
#' if (dc_check()) {
#' dc_status()
#' }}
dc_status <- function(...) {
  res <- crul::HttpClient$new(dc_rest_base())$get("heartbeat", ...)
  res$raise_for_status()
  res$raise_for_ct("text/plain")
  res$parse("UTF-8")
}

#' check if the DataCite API is up or not
#' @export
#' @return boolean
#' @keywords internal
dc_check <- function(...) {
  res <- crul::HttpClient$new(dc_rest_base())$get("heartbeat", ...)
  up <- res$status_code == 200L
  if (!up) message("DataCite API is down")
  return(up)
}
