\name{dc_listmetadataformats}
\alias{dc_listmetadataformats}
\title{listmetadataformats}
\usage{
  dc_listmetadataformats(id = NULL, transform = TRUE,
    url = "http://oai.datacite.org/oai")
}
\arguments{
  \item{id}{DataCite identifier, e.g., "56225"}

  \item{transform}{transform metadata to list (TRUE/FALSE)}

  \item{url}{the base url for DataCite (leave to default)}
}
\description{
  List available metadata formats that the DataCite
  repository can disseminate
}
\examples{
\dontrun{
dc_listmetadataformats()
dc_listmetadataformats("56225")
}
}

