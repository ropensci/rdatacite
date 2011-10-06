# Identify.R

Identify <- function() {
# Function Identify used to learn about the Dryad OAI-PMH service
# Examples: 
#   Identify()
  url <- "http://oai.datacite.org/oai?verb=Identify"
  return(xmlToList(url))
}