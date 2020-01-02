#' DataCite REST API: activities
#'
#' @export
#' @inheritParams dc_dois
#' @param ids (character) one or more activity IDs
#' @param query (character) Query string
#' @details for more info on the `/activities` route see
#' https://support.datacite.org/docs/tracking-provenance
#' @examples \dontrun{
#' if (dc_check()) {
#' x <- dc_activities()
#' x
#' # dc_activities(x$data$id[1]) # FIXME: doesn't work, returns no data
#' # dc_activities(query = "ecology") # FIXME: this thlimit a 500 error
#' }}
dc_activities <- function(ids = NULL, query = NULL, limit = 25, page = 1,
  cursor = NULL, ...) {

  assert(ids, "character")
  assert(query, "character")
  assert(limit, c("numeric", "integer"))
  assert(page, c("numeric", "integer"))
  assert(cursor, "character")
  if (!is.null(ids)) ids <- paste0(ids, collapse = ",")
  args <- cpct(list(ids = ids, query = query, `page[size]` = limit,
    `page[number]` = page, `page[cursor]` = cursor))
  as_dc(dc_GET("activities", args, ...), "activities")
}
