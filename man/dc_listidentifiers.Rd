\name{dc_listidentifiers}
\alias{dc_listidentifiers}
\title{listidentifiers}
\usage{
  dc_listidentifiers(from = NULL, until = NULL, set = NULL,
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
  Retrieve record headers from the DataCite repository
}
\examples{
\dontrun{
temp <- dc_listidentifiers(from = '2010-06-01T')
dc_listidentifiers(from = '2011-06-01T', until = '2011-07-01T')
}
}

