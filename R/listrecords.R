#' listrecords
#'
#' Harvest full records from the DataCite repository
#' @import OAIHarvester
#' @inheritParams listidentifiers
#' @export
#' @examples \dontrun{
#' listrecords(from = '2011-06-01T', until = '2011-07-01T')
#' }
listrecords <- function(from = NULL, until = NULL, set = NULL, prefix = 'oai_dc', 
  token = NULL, transform = TRUE,
  url = "http://oai.datacite.org/oai") 
{
	oaih_list_records(
    url, 
    prefix = prefix,
    from = from,
    until = until,
    set = set,
		transform = transform)
}