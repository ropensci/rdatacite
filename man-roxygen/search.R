#' @param ... Solr parameters passed on to the respective \code{solr} package
#' function.
#' @param callopts Further args passed on to \code{\link[httr]{GET}}
#'
#' @details See the \code{solr} package documentation for available parameters. For each
#' of \code{dc_search}, \code{dc_facet}, \code{dc_stats}, and \code{dc_mlt} see the
#' equivalently named function in \code{solr}:
#'
#' \itemize{
#'  \item \code{dc_search} - \code{\link[solr]{solr_search}}
#'  \item \code{dc_facet} - \code{\link[solr]{solr_facet}}
#'  \item \code{dc_stats} - \code{\link[solr]{solr_stats}}
#'  \item \code{dc_mlt} - \code{\link[solr]{solr_mlt}}
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
#'
#' If you want to use \code{wt='csv'} you'll need \code{solr} package version \code{0.1.8.99} or
#' greater. Installation instructions at \url{https://github.com/ropensci/solr#quick-start}.
