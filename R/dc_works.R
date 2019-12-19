#' DataCite REST API: works
#'
#' @export
#' @param query (character) Query string, e.g., any part of a work
#' @param order (character) set the sort order to one of "asc" or "desc"
#' @param sort (character) sort results by a certain field, one of
#' "deposited", "published", "updated" or "score"
#' @param offset (numeric/integer) result offset, the record to start at
#' @param rows (numeric/integer) results per page, max value: 1000
#' @param include (character) vector of member fields to return
#' @param discard_xml (logical) discard xml field? the xml field 
#' can be very large and cause problems sometimes. default: `TRUE`
#' @param ... curl options passed on to [crul::HttpClient]
#' @seealso [dc_work()]
#' @family rest api methods
#' @examples \dontrun{
#' dc_works(query = "climate change")
#' }
dc_works <- function(query = NULL, order = NULL, sort = NULL,
  rows = NULL, offset = NULL, include = NULL, discard_xml = TRUE, ...) {

  if (!is.null(include)) include <- paste0(include, collapse = ",")
  args <- dc_compact(list(query = query, order = order, sort = sort,
    `page[size]` = rows, `page[offset]` = offset, include = include))
  dc_rest_GET("works", args = args, discard_xml = discard_xml, ...)
}
