# Identify.R

Identify <- function(transform = TRUE) {
# Function Identify used to learn about the Dryad OAI-PMH service
# Args:
#   transform: transform metadata to list (TRUE/FALSE)
# Examples: 
#   Identify()
  url <- "http://oai.datacite.org/oai"
  oaih_identify("http://oai.datacite.org/oai", transform = transform)
}
