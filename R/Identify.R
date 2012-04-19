#' identify
#'
#' Learn about the Dryad OAI-PMH service
#' @import OAIHarvester
#' @inheritParams listmetadataformats
#' @export
#' @examples \dontrun{
#' identify()
#' }
identify <- function(transform = TRUE, url = "http://oai.datacite.org/oai") 
{ 
  oaih_identify(url, transform = transform)
}