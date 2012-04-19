#' getrecord
#'
#' Retrieve an individual record from the DataCite repository
#' @import OAIHarvester
#' @inheritParams listmetadataformats
#' @export
#' @examples \dontrun{
#' out <- getrecord("56225", T)
#' out$metadata # get $identifier, $datestamp, $setSpec, or $metadata
#' oaih_transform(out$metadata) # transform only metadata to a list
#' }
getrecord <- function(id = NULL, transform = TRUE, 
  url = "http://oai.datacite.org/oai") 
{
  if(!is.null(id) == T) {oaiid <- paste("oai:oai.datacite.org:", id, sep="")} else
      {oaiid <- NULL}
	oaih_get_record(
	  url, 
		oaiid, 
		prefix = "oai_dc", 
		transform = transform)
}