#' identify
#'
#' Function Identify used to learn about the Dryad OAI-PMH service
#' @import OAIHarvester
#' @param transform transform metadata to list (TRUE/FALSE)
#' @export
#' @examples \dontrun{
#' identify()
#' }
identify <- function(transform = TRUE) 
{  
  url <- "http://oai.datacite.org/oai"
  oaih_identify("http://oai.datacite.org/oai", transform = transform)
}