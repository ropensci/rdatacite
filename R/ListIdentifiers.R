# ListIdentifiers.R

ListIdentifiers <- function(
    url = 'http://oai.datacite.org/oai',
    ..., 
    curl = getCurlHandle() ) {
# Function ListIdentifiers to get all oais
# Args: 
#   tor: return list of identifiers to R ("r"), or to your directory at "~/." ("dir") (character)
# Examples: 
#   ListIdentifiers()
#   ListIdentifiers('r')
  list_ <- list() # make list to put OIA identifiers into 
  args <- list(verb = 'ListIdentifiers', 
              metadataPrefix = 'oai_dc',
              resumptionToken = '1317864929378')
  out <- getForm(url, 
        .params = args, 
        ..., 
        curl = curl) 
  out_ <- xmlTreeParse(out) # tree parse
	out__ <- xmlToList(out_)[[3]] # parsed xml to list   
  out__
}