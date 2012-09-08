#' getrecord
#'
#' Retrieve an individual record from the DataCite repository
#' @import OAIHarvester
#' @inheritParams dc_listmetadataformats
#' @examples \dontrun{
#' out <- dc_getrecord("56225", T)
#' out$metadata # get $identifier, $datestamp, $setSpec, or $metadata
#' oaih_transform(out$metadata) # transform only metadata to a list
#' 
#' temp <- dc_listidentifiers(from = '2012-07-27') # get some identifiers
#' temp[[1,"identifier"]] # gets the identifier
#' dc_getrecord(temp[[1,"identifier"]]) # get the record
#' }
#' @export
dc_getrecord <- function(id = NULL, transform = TRUE, 
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