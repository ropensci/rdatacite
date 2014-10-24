#' List available metadata formats that the DataCite repository can disseminate
#'
#' @export
#' @import OAIHarvester XML
#'
#' @param id DataCite identifier, e.g., "56225"
#' @param transform transform metadata to list (TRUE/FALSE)
#' @examples \dontrun{
#' dc_oai_listmetadataformats()
#' dc_oai_listmetadataformats("56225")
#' }
dc_oai_listmetadataformats <- function(id = NULL, transform = TRUE)
{
  if(is(id, "NULL")) {
  	 oaiid <- paste("oai:oai.datacite.org:", id, sep="")
  	 } else {
  	 	oaiid <- NULL
  	 }
	oaih_list_metadata_formats("http://oai.datacite.org/oai", oaiid, transform = transform)
}
