#' listmetadataformats
#'
#' List available metadata formats that the DataCite repository can disseminate
#' @import OAIHarvester
#' @param id DataCite identifier, e.g., "56225"
#' @param transform transform metadata to list (TRUE/FALSE)
#' @param url the base url for DataCite (leave to default)
#' @export
#' @examples \dontrun{
#' dc_listmetadataformats()
#' dc_listmetadataformats("56225")
#' }
dc_listmetadataformats <- function(id = NULL, transform = TRUE,
  url = "http://oai.datacite.org/oai")
{
  if(is(id, "NULL")) {
  	 oaiid <- paste("oai:oai.datacite.org:", id, sep="")
  	 } else {
  	 	oaiid <- NULL
  	 }
	oaih_list_metadata_formats(url, oaiid, transform = transform)
}
