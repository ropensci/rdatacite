# GetRecord.R

GetRecord <- function(id = NULL, transform = TRUE,
  baseurl = "http://oai.datacite.org/oai") {
# Function to retrieve an individual record from the DataCite repository
# Args:
#   id: DataCite id, i.e. "56225"
#   transform: transform metadata to list (TRUE/FALSE)
# Examples:
#   out <- GetRecord("56225", T)
#   out$metadata # get $identifier, $datestamp, $setSpec, or $metadata
#   oaih_transform(out$metadata) # transform only metadata to a list

  if(!is.null(id) == T) {oaiid <- paste("oai:oai.datacite.org:", id, sep="")} else
      {oaiid <- NULL}
	oaih_get_record(
    baseurl, 
		oaiid, 
		prefix = "oai_dc", 
		transform = transform)
}