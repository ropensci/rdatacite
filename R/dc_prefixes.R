#' DataCite REST API: prefixes
#'
#' @export
#' @param include (character) vector of fields to return
#' @param limit (numeric/integer) results per page
#' @param page (numeric/integer) result page, the record to start at
#' @param cursor (character) page cursor (used instead of `limit` param)
#' @param ... curl options passed on to [crul::HttpClient]
#' @examples \dontrun{
#' if (dc_check()) {
#' x <- dc_prefixes()
#' x
#' dc_prefixes(limit = 3)
#' }}
dc_prefixes <- function(include = NULL, limit = 25, page = 1,
  cursor = NULL, ...) {

  assert(include, "character")
  assert(limit, c("numeric", "integer"))
  assert(page, c("numeric", "integer"))
  assert(cursor, c("numeric", "integer", "character"))
  args <- cpct(list(include = include, `page[size]` = limit,
    `page[number]` = page, `page[cursor]` = cursor))
  as_dc(dc_GET("prefixes", args, ...), "prefixes")
}
