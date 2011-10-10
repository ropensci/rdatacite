# ListSets.R

ListSets <- function(transform = TRUE,
  baseurl = "http://oai.datacite.org/oai") 
{
# Retrieve the set structure of DataCite, useful for selective harvesting
# Args:
#   transform: transform metadata to list (TRUE/FALSE)
# Examples:
#   ListSets()
	oaih_list_sets(
    baseurl, 
		transform = transform)
}