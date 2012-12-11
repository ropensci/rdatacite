#' List the records in the DataCite metadata repository.
#'
#' Harvest full records from the DataCite repository
#' @import OAIHarvester
#' @inheritParams dc_listidentifiers
#' @examples \dontrun{
#' dc_listrecords(from = '2011-06-01T', until = '2011-07-01T')
#' out <- dc_listrecords()
#' }
#' @export
dc_listrecords <- function(from = NULL, until = NULL, set = NULL, prefix = 'oai_dc',
  token = NULL, transform = TRUE,
  url = "http://oai.datacite.org/oai")
{
	oaih_list_records(url, prefix = prefix, from = from, until = until, set = set, transform = transform)
}

# Notes: Not sure about the point behind the examples
