#' DataCite R client.
#'
#' @section OAI-PMH functions:
#'
#' - [dc_oai_getrecord()] - Get records
#' - [dc_oai_identify()] - identify the OAI-PMH service
#' - [dc_oai_listidentifiers()] - List identifiers
#' - [dc_oai_listmetadataformats()] - List metadata formats
#' - [dc_oai_listrecords()] - List records
#' - [dc_oai_listsets()] - List sets
#'
#' @section Search functions (Solr based):
#'
#' - [dc_search()] - General search, only returns documents
#' - [dc_facet()] - Faceting only (w/o general search)
#' - [dc_mlt()] - More like this (w/o general search)
#' - [dc_stats()] - Stats search (w/o general search)
#'
#' @section REST API functions:
#'
#' - [dc_data_center()] - Get a single data center
#' - [dc_data_centers()] - Search data centers
#' - [dc_member()] - Get single DataCite member
#' - [dc_members()] - Search DataCite members
#' - [dc_work()] - Get single works
#' - [dc_works()] - Search works
#'
#' @section Vignettes:
#'
#' Coming soon...
#'
#' @importFrom solrium SolrClient
#' @importFrom oai get_records id list_metadataformats list_records
#' list_sets
#' @name rdatacite-package
#' @aliases rdatacite
#' @docType package
#' @author Scott Chamberlain \email{myrmecocystus@@gmail.com}
#' @keywords package
NULL
