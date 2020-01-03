#' DataCite REST API: clients
#'
#' @export
#' @inheritParams dc_dois
#' @param ids (character) one or more client IDs
#' @param query (character) Query string
#' @param year (integer/numeric/character) a year
#' @param provider_id a provider ID
#' @param software no idea what should go here, anyone?
#' @examples \dontrun{
#' if (dc_check()) {
#' x <- dc_clients()
#' x
#' dc_clients(x$data$id[1])
#' dc_clients(x$data$id[1:2], verbose = TRUE)
#' }}
dc_clients <- function(ids = NULL, query = NULL, year = NULL,
  provider_id = NULL, software = NULL, include = NULL, limit = 25, page = 1,
  cursor = NULL, ...) {

  assert(ids, "character")
  assert(query, "character")
  assert(year, c("numeric", "integer"))
  assert(include, "character")
  assert(limit, c("numeric", "integer"))
  assert(page, c("numeric", "integer"))
  assert(cursor, "character")
  if (!is.null(ids)) ids <- paste0(ids, collapse = ",")
  args <- cpct(list(ids = ids, query = query, year = year,
    `provider-id` = provider_id, software = software, include = include,
    `page[size]` = limit, `page[number]` = page, `page[cursor]` = cursor))
  as_dc(dc_GET("clients", args, ...), "clients")
}
