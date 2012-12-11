#' List the sets in the DataCite metadata repository.
#'
#' Retrieve the set structure of DataCite, useful for selective harvesting
#' @import OAIHarvester XML
#' @inheritParams dc_listmetadataformats
#' @examples \dontrun{
#' datacite_sets <- dc_listsets()
#' head(datacite_sets)
#' }
#' @export
dc_listsets <- function(url = "http://oai.datacite.org/oai") 
{ 
	out <- oaih_list_sets(url, transform = FALSE)
	data.frame(
		setSpec = sapply(xpathApply(out, "//setSpec"), xmlValue),
		setName = sapply(xpathApply(out, "//setName"), xmlValue)
		)
}