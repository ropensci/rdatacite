#' listsets
#'
#' Retrieve the set structure of DataCite, useful for selective harvesting
#' @import OAIHarvester
#' @inheritParams listmetadataformats
#' @export
#' @examples \dontrun{
#' listsets()
#' }
listsets <- function(transform = TRUE,
  url = "http://oai.datacite.org/oai") 
{ 
	oaih_list_sets(
    url, 
		transform = transform)
}