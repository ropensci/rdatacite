# DataCite code

# require(RCurl)
# require(XML)
# require(OAIHarvester)

datacite <- function(id, transform) {
# Function to download metadata for individual Dryad id's
# Args:
#   id: DataCite id, i.e. "56225"
#   transform: (logical) transform metadata to list, TRUE or FLALSE
# Examples:
#   out <- datacite("56225", T)
#   out$metadata # get $identifier, $datestamp, $setSpec, or $metadata
#   oaih_transform(out$metadata) # transform only metadata to a list

  baseurl <- "http://oai.datacite.org/oai"
  oaiid <- paste("oai:oai.datacite.org:", id, sep="")
	oaih_get_record(baseurl, 
		oaiid, 
		prefix = "oai_dc", 
		transform = transform)
}

