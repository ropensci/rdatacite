#' Retrieve an individual record from the DataCite repository
#'
#' @export
#'
#' @inheritParams dc_oai_listmetadataformats
#' @examples \dontrun{
#' dc_oai_getrecord("56225")
#'
#' temp <- dc_oai_listidentifiers(from = '2012-07-27') # get some identifiers
#' temp[[1,"identifier"]] # gets the identifier
#' dc_oai_getrecord(temp[[1,"identifier"]]) # get the record
#' }

dc_oai_getrecord <- function(id = NULL) {
  if (!is.null(id)) {
    oaiid <- paste("oai:oai.datacite.org:", id, sep = "")
  } else {
    oaiid <- NULL
  }

  oai::get_records(ids = oaiid, prefix = "oai_dc", url = dc_oai_base())
}
