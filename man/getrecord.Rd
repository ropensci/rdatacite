\name{getrecord}
\alias{getrecord}
\title{getrecord}
\usage{
  getrecord(id = NULL, transform = TRUE,
    url = "http://oai.datacite.org/oai")
}
\arguments{
  \item{id}{DataCite identifier, e.g., "56225"}

  \item{transform}{transform metadata to list (TRUE/FALSE)}

  \item{url}{the base url for DataCite (leave to default)}
}
\description{
  Retrieve an individual record from the DataCite
  repository
}
\examples{
\dontrun{
out <- getrecord("56225", T)
out$metadata # get $identifier, $datestamp, $setSpec, or $metadata
oaih_transform(out$metadata) # transform only metadata to a list

temp <- listidentifiers(from = '2012-07-27') # get some identifiers
temp[[1,"identifier"]] # gets the identifier
getrecord(temp[[1,"identifier"]]) # get the record
}
}

