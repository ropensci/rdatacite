#' Learn about the Dryad OAI-PMH service
#'
#' @export
#'
#' @inheritParams dc_oai_listmetadataformats
#' @examples
#' library(crul)
#' url <- "https://oai.datacite.org/oai"
#' if (crul::HttpClient$new(url=url)$get()$success()) {
#'   dc_oai_identify()
#' }
dc_oai_identify <- function(...) {
  oai::id(dc_oai_base(), ...)
}
