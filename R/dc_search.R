#' Use the DataCite RESTful API for search, facet, stats, and mlt queries.
#'
#' @export
#' @import solr
#'
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
#' @examples \donttest{
#' # Search
#' ## search for wind, retrieve only doi and title, and return (at max.) 5 results
#' dc_search(q = "wind", fl=c('doi','title'), rows=5)
#'
#' ## search with csv output
#' dc_search(q = 'wind', fl=c('doi','title'), wt='csv')
#'
#' # Faceting
#' dc_facet(q = "wind", facet.field='publisher')
#'
#' # Stats
#' dc_stats(q = "ecology", stats.field='date')
#'
#' # More like this (aka mlt)
#' dc_mlt(q = "ecology", mlt.fl='title', mlt.count=5, fl=c('doi','title'))
#' }

dc_search <- function(..., callopts=list()) solr_search(..., base = dc_base(), callopts = callopts)

#' @export
#' @rdname dc_search
dc_facet <- function(..., callopts=list()) solr_facet(..., base = dc_base(), callopts = callopts)

#' @export
#' @rdname dc_search
dc_stats <- function(..., callopts=list()) solr_stats(..., base = dc_base(), callopts = callopts)

#' @export
#' @rdname dc_search
dc_mlt <- function(..., callopts=list()) solr_mlt(..., base = dc_base(), callopts = callopts)
