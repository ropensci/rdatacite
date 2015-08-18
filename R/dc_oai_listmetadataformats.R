#' List available metadata formats that the DataCite repository can disseminate
#'
#' @export
#' @param id DataCite identifier, e.g., "56225"
#' @param ... Curl options passed on to \code{\link[httr]{GET}}
#' @examples \dontrun{
#' dc_oai_listmetadataformats()
#' dc_oai_listmetadataformats("56225")
#' }
dc_oai_listmetadataformats <- function(id = NULL, ...) {
  if (!is.null(id)) {
    oaiid <- paste("oai:oai.datacite.org:", id, sep = "")
  } else {
    oaiid <- NULL
  }
  oai::list_metadataformats(dc_oai_base(), oaiid, ...)
}
