#' @param ... Solr parameters passed on to the respective \code{solr} package
#' function.
#' @param callopts Further args passed on to \code{\link[httr]{GET}}
#'
#' @details See the \code{solr} package documentation for available parameters. For each
#' \code{dc_*} function see the equivalently named function in \code{solr}:
#'
#' \itemize{
#'  \item dc_search - solr_search
#'  \item dc_facet - solr_facet
#'  \item dc_stats - solr_stats
#'  \item dc_mlt - solr_mlt
#' }
#'
#' Fields you can search on and retrieve back are:
#' \itemize{
#'  \item doi
#'  \item creator
#'  \item publisher
#'  \item publicationYear
#'  \item title
#'  \item alternateIdentifier
#'  \item contributor
#'  \item date
#'  \item description
#'  \item format
#'  \item language
#'  \item relatedIdentifier
#'  \item resourceType
#'  \item resourceTypeGeneral
#'  \item rights
#'  \item size
#'  \item subject
#'  \item version
#'  \item allocator symbol of the DataCite member (e.g. BL = British Library)
#'  \item datacentre symbol of the datacentre, which uploaded the metadata (e.g.
#'  BL.ADS = Archeology Data Service)
#'  \item indexed datestamp of indexing
#'  \item prefix DOI prefix (e.g. 10.5284)
#'  \item refQuality reference quality flag (1 or 0)
#'  \item uploaded datestamp of metadata uploading
#' }
