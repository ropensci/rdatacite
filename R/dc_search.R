#' DataCite Solr web service for search, facet, stats,
#' and mlt queries
#'
#' @export
#' @template search
#'
#' @examples
#' library(crul)
#' url <- "https://search.datacite.org/api"
#' if (crul::HttpClient$new(url=url)$get()$success()) {
#'
#' # Search
#' ## various searches
#' ### containing laser
#' dc_search(q = "laser", fl=c('doi','publicationYear'), rows=5)
#'
#' ### containing laser and safety
#' dc_search(q = "laser safety", fl=c('doi','publicationYear'),
#'   rows=5)
#'
#' ### containing laser and not medicine
#' dc_search(q = "laser -medicine", fl=c('doi',
#'   'publicationYear'), rows=5)
#'
#' }
#'
#' \dontrun{
#' ### containing laser and red or green
#' dc_search(q = "laser AND (red OR green)", fl=c('doi',
#'   'publicationYear'), rows=5)
#'
#' ### containing wind turbine as a phrase in the title
#' dc_search(q = 'title:"wind turbine"', fl=c('doi','title'),
#'   rows=5)
#'
#' ### containing geology in metadata field subject
#' dc_search(q = "subject:geology", fl=c('doi','subject'),
#'   rows=5)
#'
#' ### belonging to DataCite members BL or TIB
#' dc_search(q = "allocator:(BL OR TIB)", fl=c('doi','allocator'),
#'   rows=5)
#'
#' ### published between 2000 and 2005
#' dc_search(q = "publicationYear:[2000 TO 2005]",
#'   fl=c('doi','publicationYear'), rows=5)
#'
#' ### uploaded to DataCite in the last 5 days
#' dc_search(q = "uploaded:[NOW-5DAYS TO NOW]",
#'   fl=c('doi','uploaded'), rows=5)
#'
#' ## search with csv output
#' ### If you want to use wt=csv, install development version of
#' ### solr package, see Details
#' dc_search(q = 'wind', fl=c('doi','title'), wt='csv')
#'
#' # Faceting
#' dc_facet(q = "wind", facet.field='publisher_facet')
#'
#' # Stats
#' dc_stats(q = "ecology", stats.field='date')
#'
#' # More like this (aka mlt)
#' dc_mlt(q = "ecology", mlt.fl='title', mlt.count=5,
#'   fl=c('doi','title'))
#'
#' }
dc_search <- function(..., proxy = NULL, callopts=list()) {

  if (!is.null(proxy)) conn_dc <- make_dc_conn(proxy)
  args <- list(...)
  if (!is.null(args$fl)) args$fl <- paste(args$fl, collapse = ",")
  conn_dc$search(params = args, minOptimizedRows = FALSE,
    callopts = callopts)
}

#' @export
#' @rdname dc_search
dc_facet <- function(..., proxy = NULL, callopts=list()) {
  if (!is.null(proxy)) conn_dc <- make_dc_conn(proxy)
  args <- list(...)
  if (!is.null(args$fl)) args$fl <- paste(args$fl, collapse = ",")
  conn_dc$facet(params = args, callopts = callopts)
}

#' @export
#' @rdname dc_search
dc_stats <- function(..., proxy = NULL, callopts=list()) {
  if (!is.null(proxy)) conn_dc <- make_dc_conn(proxy)
  args <- list(...)
  if (!is.null(args$fl)) args$fl <- paste(args$fl, collapse = ",")
  conn_dc$stats(params = args, callopts = callopts)
}

#' @export
#' @rdname dc_search
dc_mlt <- function(..., proxy = NULL, callopts=list()) {
  if (!is.null(proxy)) conn_dc <- make_dc_conn(proxy)
  args <- list(...)
  if (!is.null(args$fl)) args$fl <- paste(args$fl, collapse = ",")
  conn_dc$mlt(params = args, callopts = callopts)
}
