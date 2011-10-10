# ListRecords.R

ListRecords <- function(from = NULL, until = NULL, set = NULL, 
  prefix = 'oai_dc', token = NULL, transform = TRUE,
  baseurl = "http://oai.datacite.org/oai") 
{
# Function to harvest full records from the DataCite repository
# Args:
#   from: specifies that records returned must have been created/update/deleted 
#     on or after this date.
#   until: specifies that records returned must have been created/update/deleted 
#     on or before this date.
#   set: specifies the set that returned records must belong to.
#   prefix: specifies the metadata format that the records will be 
#     returned in. 
#   token: a token previously provided by the server to resume a request
#     where it last left off.
#   transform: transform metadata to list (TRUE/FALSE)
# Examples:
#   ListRecords(from = '2011-06-01T', until = '2011-07-01T')
	oaih_list_records(
    baseurl, 
    prefix = prefix,
    from = from,
    until = until,
    set = set,
		transform = transform)
}