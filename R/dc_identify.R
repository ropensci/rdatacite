#' identify
#'
#' Learn about the Dryad OAI-PMH service
#' @import OAIHarvester
#' @inheritParams dc_listmetadataformats
#' @export
#' @examples \dontrun{
#' dc_identify()
#' }
dc_identify <- function(transform = TRUE, url = "http://oai.datacite.org/oai") 
{ 
  oaih_identify(url, transform = transform)
}