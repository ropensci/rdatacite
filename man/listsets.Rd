\name{listsets}
\alias{listsets}
\title{listsets}
\usage{
  listsets(transform = TRUE,
    url = "http://oai.datacite.org/oai")
}
\arguments{
  \item{transform}{transform metadata to list (TRUE/FALSE)}

  \item{url}{the base url for DataCite (leave to default)}
}
\description{
  Retrieve the set structure of DataCite, useful for
  selective harvesting
}
\examples{
\dontrun{
listsets()
}
}

