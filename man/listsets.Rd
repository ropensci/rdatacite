\name{listsets}
\alias{listsets}
\title{List the sets in the DataCite metadata repository.}
\usage{
  listsets(url = "http://oai.datacite.org/oai")
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
listsets()
}
}

