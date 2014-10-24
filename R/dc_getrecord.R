#' Retrieve an individual record from the DataCite repository
#'
#' @export
#'
#' @inheritParams dc_oai_listmetadataformats
#' @examples \dontrun{
#' out <- dc_oai_getrecord("56225", T)
#' out$metadata # get $identifier, $datestamp, $setSpec, or $metadata
#' oaih_transform(out$metadata) # transform only metadata to a list
#'
#' temp <- dc_listidentifiers(from = '2012-07-27') # get some identifiers
#' temp[[1,"identifier"]] # gets the identifier
#' dc_oai_getrecord(temp[[1,"identifier"]]) # get the record
#' }

dc_oai_getrecord <- function(id = NULL, transform = TRUE)
{
  if(!is.null(id) == T) {oaiid <- paste("oai:oai.datacite.org:", id, sep="")} else
      {oaiid <- NULL}
	oaih_get_record(
	  "http://oai.datacite.org/oai",
		oaiid,
		prefix = "oai_dc",
		transform = transform)
}
