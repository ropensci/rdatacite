#' listidentifiers
#'
#' Retrieve record headers from the DataCite repository
#' @import OAIHarvester
#' @param from specifies that records returned must have been created/update/deleted 
#'     on or after this date.
#' @param until specifies that records returned must have been created/update/deleted 
#'     on or before this date.
#' @param set specifies the set that returned records must belong to.
#' @param prefix specifies the metadata format that the records will be 
#'     returned in. 
#' @param token a token previously provided by the server to resume a request
#'     where it last left off.
#' @inheritParams listmetadataformats
#' @export
#' @examples \dontrun{
#' temp <- listidentifiers()
#' listidentifiers(from = '2011-06-01T', until = '2011-07-01T')
#' }
listidentifiers <- function(from = NULL, until = NULL, set = NULL, 
  prefix = 'oai_dc', token = NULL, transform = TRUE,
  url = "http://oai.datacite.org/oai")
{
  oaih_list_identifiers(
    url, 
    prefix = prefix,
    from = from,
    until = until,
    set = set,
    transform = transform)
}