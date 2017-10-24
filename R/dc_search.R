#' Use the DataCite RESTful API for search, facet, stats, and mlt queries.
#'
#' @export
#' @template search
#'
#' @examples \dontrun{
#' # Search
#' ## various searches
#' ### containing laser
#' dc_search(params = list(q = "laser", fl=c('doi','publicationYear'), rows=5))
#'
#' ### containing laser and safety
#' dc_search(params = list(q = "laser safety", fl=c('doi','publicationYear'),
#' rows=5))
#'
#' ### containing laser and not medicine
#' dc_search(params = list(q = "laser -medicine", fl=c('doi',
#'   'publicationYear'), rows=5))
#'
#' ### containing laser and red or green
#' dc_search(params = list(q = "laser AND (red OR green)", fl=c('doi',
#'   'publicationYear'), rows=5))
#'
#' ### containing wind turbine as a phrase in the title
#' dc_search(params = list(q = 'title:"wind turbine"', fl=c('doi','title'),
#'   rows=5))
#'
#' ### containing geology in metadata field subject
#' dc_search(params = list(q = "subject:geology", fl=c('doi','subject'),
#'   rows=5))
#'
#' ### belonging to DataCite members BL or TIB
#' dc_search(params = list(q = "allocator:(BL OR TIB)",
#'   fl=c('doi','allocator'), rows=5))
#'
#' ### published between 2000 and 2005
#' dc_search(params = list(q = "publicationYear:[2000 TO 2005]",
#'   fl=c('doi','publicationYear'), rows=5))
#'
#' ### uploaded to DataCite in the last 5 days
#' dc_search(params = list(q = "uploaded:[NOW-5DAYS TO NOW]",
#'   fl=c('doi','uploaded'), rows=5))
#'
#' ## search with csv output
#' ### If you want to use wt=csv, install development version of
#' ### solr package, see Details
#' dc_search(params = list(q = 'wind', fl=c('doi','title'), wt='csv'))
#'
#' # Faceting
#' dc_facet(params = list(q = "wind", facet.field='publisher_facet'))
#'
#' # Stats
#' dc_stats(params = list(q = "ecology", stats.field='date'))
#'
#' # More like this (aka mlt)
#' dc_mlt(params = list(q = "ecology", mlt.fl='title', mlt.count=5,
#'   fl=c('doi','title')))
#' }
dc_search <- function(params = list(q = '*:*'), body = NULL, proxy = NULL,
	callopts=list(), ...) {

  if (!is.null(proxy)) conn_dc <- make_dc_conn(proxy)
	if (!is.null(params$fl)) params$fl <- paste(params$fl, collapse = ",")
  conn_dc$search(params = params, body = body, minOptimizedRows = FALSE,
  	callopts = callopts, ...)
}

#' @export
#' @rdname dc_search
dc_facet <- function(params = list(q = '*:*'), body = NULL, proxy = NULL,
	callopts=list(), ...) {

  if (!is.null(proxy)) conn_dc <- make_dc_conn(proxy)
  conn_dc$facet(params = params, body = body, callopts = callopts, ...)
}

#' @export
#' @rdname dc_search
dc_stats <- function(params = list(q = '*:*'), body = NULL, proxy = NULL,
	callopts=list(), ...) {

  if (!is.null(proxy)) conn_dc <- make_dc_conn(proxy)
  conn_dc$stats(params = params, body = body, callopts = callopts, ...)
}

#' @export
#' @rdname dc_search
dc_mlt <- function(params = list(q = '*:*'), body = NULL, proxy = NULL,
	callopts=list(), ...) {

  if (!is.null(proxy)) conn_dc <- make_dc_conn(proxy)
  conn_dc$mlt(params = params, body = body, callopts = callopts, ...)
}
