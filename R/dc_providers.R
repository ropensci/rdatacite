#' DataCite REST API: providers
#'
#' @export
#' @param ids (character) one or more provider IDs
#' @param query (character) query string
#' @param year (character) year
#' @param region (character) region name
#' @param organization_type (character) organization type
#' @param focus_area (character) focus area
#' @param include (character) vector of fields to return
#' @param limit (numeric/integer) results per page
#' @param page (numeric/integer) result page, the record to start at
#' @param cursor (character) page cursor (used instead of `limit` param)
#' @param ... curl options passed on to [crul::HttpClient]
#' @examples \dontrun{
#' if (dc_check()) {
#' x <- dc_providers()
#' x
#' dc_providers(limit = 3)
#' dc_providers(ids = x$data$id[1:5])
#' }}
dc_providers <- function(ids = NULL, query = NULL, year = NULL, region = NULL,
  organization_type = NULL, focus_area = NULL, include = NULL, limit = 25,
  page = 1, cursor = NULL, ...) {

  assert(ids, "character")
  assert(query, "character")
  assert(year, c("numeric", "integer", "character"))
  assert(region, "character")
  assert(organization_type, "character")
  assert(focus_area, "character")
  assert(include, "character")
  assert(limit, c("numeric", "integer"))
  assert(page, c("numeric", "integer"))
  assert(cursor, c("numeric", "integer", "character"))
  if (!is.null(ids)) ids <- paste0(ids, collapse = ",")
  args <- cpct(list(ids = ids, query = query, year = year, region = region,
    `organization-type` = organization_type, `focus-area` = focus_area,
    include = include, `page[size]` = limit,
    `page[number]` = page, `page[cursor]` = cursor))
  as_dc(dc_GET("providers", args, ...), "providers")
}
