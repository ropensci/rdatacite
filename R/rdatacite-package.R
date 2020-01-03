#' DataCite R client
#'
#' @section HTTP Requests:
#' All HTTP requests are GET requests, and are sent with the following
#' headers:
#'
#' - `Accept: application/vnd.api+json; version=2`
#' - `User-Agent: r-curl/4.3 crul/0.9.0 rOpenSci(rdatacite/0.5.0)`
#' - `X-USER-AGENT: r-curl/4.3 crul/0.9.0 rOpenSci(rdatacite/0.5.0)`
#'
#' The user-agent strings change as the versions of each package change.
#'
#' @section Methods in the package:
#'
#' - [dc_providers()]
#' - [dc_reports()]
#' - [dc_check()]
#' - [dc_events()]
#' - [dc_dois()]
#' - [dc_clients()]
#' - [dc_client_prefixes()]
#' - [dc_provider_prefixes()]
#' - [dc_status()]
#' - [dc_prefixes()]
#' - [dc_activities()]
#'
#' @section rdatacite defunct functions:
#'
#' - `dc_data_center`
#' - `dc_data_centers`
#' - `dc_facet`
#' - `dc_member`
#' - `dc_members`
#' - `dc_mlt`
#' - `dc_oai_getrecord`
#' - `dc_oai_identify`
#' - `dc_oai_listidentifiers`
#' - `dc_oai_listmetadataformats`
#' - `dc_oai_listrecords`
#' - `dc_oai_listsets`
#' - `dc_search`
#' - `dc_stats`
#' - `dc_work`
#' - `dc_works`
#'
#' @section Content negotation:
#' For content negotation see `rcrossref::cr_cn()`, which can be used for
#' Crossref, DataCite and Medra DOIs
#' 
#' @section GraphGL API:
#' rdatacite does not support the GraphGL API
#' https://support.datacite.org/docs/datacite-graphql-api-guide - we suggest
#' trying the `ghql` package (https://github.com/ropensci/ghql/)
#'
#' @name rdatacite-package
#' @aliases rdatacite
#' @docType package
#' @author Scott Chamberlain \email{myrmecocystus@@gmail.com}
#' @keywords package
NULL
