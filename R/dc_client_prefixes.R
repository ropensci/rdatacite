#' DataCite REST API: client prefixes
#'
#' @export
#' @inheritParams dc_dois
#' @param query (character) Query string
#' @param year (integer/numeric/character) a year
#' @param client_id a client ID
#' @param prefix_id a prefix ID
#' @param sort (character) variable to sort by
#' @examples \dontrun{
#' if (dc_check()) {
#' x <- dc_client_prefixes()
#' x
#' }}
dc_client_prefixes <- function(query = NULL, year = NULL,
  client_id = NULL, prefix_id = NULL, sort = NULL, include = NULL,
  limit = 25, page = 1, cursor = NULL, ...) {

  assert(query, "character")
  assert(year, c("numeric", "integer", "character"))
  assert(sort, "character")
  assert(include, "character")
  assert(limit, c("numeric", "integer"))
  assert(page, c("numeric", "integer"))
  assert(cursor, "character")
  args <- cpct(list(query = query, year = year,
    `client-id` = client_id, `prefix-id` = prefix_id, sort = sort,
    include = include, `page[size]` = limit, `page[number]` = page,
    `page[cursor]` = cursor))
  as_dc(dc_GET("client-prefixes", args, ...), "client-prefixes")
}
