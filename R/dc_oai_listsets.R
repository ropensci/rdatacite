#' Retrieve the set structure of DataCite, useful for selective harvesting
#'
#' @export
#'
#' @inheritParams dc_oai_listmetadataformats
#' @examples \dontrun{
#' datacite_sets <- dc_oai_listsets()
#' head(datacite_sets)
#' }

dc_oai_listsets <- function()
{
	out <- oaih_list_sets("http://oai.datacite.org/oai", transform = FALSE)
	data.frame(
		setSpec = sapply(xpathApply(out, "//setSpec"), xmlValue),
		setName = sapply(xpathApply(out, "//setName"), xmlValue)
		)
}
