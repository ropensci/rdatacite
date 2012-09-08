\name{dc_listrecords}
\alias{dc_listrecords}
\title{List the records in the DataCite metadata repository.}
\usage{
  dc_listrecords(from = NULL, until = NULL, set = NULL,
    prefix = "oai_dc", token = NULL, transform = TRUE,
    url = "http://oai.datacite.org/oai")
}
\arguments{
  \item{from}{specifies that records returned must have
  been created/update/deleted on or after this date.}

  \item{until}{specifies that records returned must have
  been created/update/deleted on or before this date.}

  \item{set}{specifies the set that returned records must
  belong to.}

  \item{prefix}{specifies the metadata format that the
  records will be returned in.}

  \item{token}{a token previously provided by the server to
  resume a request where it last left off.}

  \item{transform}{transform metadata to list (TRUE/FALSE)}

  \item{url}{the base url for DataCite (leave to default)}
}
\description{
  Harvest full records from the DataCite repository
}
\examples{
\dontrun{
dc_listrecords(from = '2011-06-01T', until = '2011-07-01T')
out <- dc_listrecords()
}
}

