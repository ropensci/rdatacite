\name{dc_listsets}
\alias{dc_listsets}
\title{List the sets in the DataCite metadata repository.}
\usage{
  dc_listsets(url = "http://oai.datacite.org/oai")
}
\arguments{
  \item{url}{the base url for DataCite (leave to default)}
}
\description{
  Retrieve the set structure of DataCite, useful for
  selective harvesting
}
\examples{
\dontrun{
dc_listsets()
}
}

