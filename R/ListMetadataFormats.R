# ListMetadataFormats.R

ListMetadataFormats <- function(id = NULL, transform = TRUE,
  baseurl = "http://oai.datacite.org/oai") {
# List available metadata formats that the DataCite repository can disseminate
# Args:
#   id: DataCite identifier, e.g., "56225"
#   transform: transform metadata to list (TRUE/FALSE)
# Examples:
#   ListMetadataFormats()
#   ListMetadataFormats("56225")
  if(!is.null(id) == T) {oaiid <- paste("oai:oai.datacite.org:", id, sep="")} else
     {oaiid <- NULL}
	oaih_list_metadata_formats(
    baseurl, 
		oaiid, 
		transform = transform)
}