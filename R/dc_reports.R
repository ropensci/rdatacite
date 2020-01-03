#' DataCite REST API: reports
#'
#' @export
#' @param ids (character) one or more report IDs
#' @param platform (character) Name of the Platform the usage is being
#' requested for. This can be omitted if the service provides usage for
#' only one platform.
#' @param report_name (character) The long name of the report
#' @param report_id (character) The report ID or code or shortname. Typically
#' this will be the same code provided in the Report parameter of the request
#' @param release (character) The release or version of the report
#' @param created (character) Time the report was prepared. Format as defined
#' by date-time - RFC3339
#' @param created_by (character) Name of the organization producing the report
#' @param include (character) vector of fields to return
#' @param limit (numeric/integer) results per page
#' @param page (numeric/integer) result page, the record to start at
#' @param ... curl options passed on to [crul::HttpClient]
#' @examples \dontrun{
#' if (dc_check()) {
#' x <- dc_reports()
#' x
#' dc_reports(created = "2019-08-01T07:00:00.000Z")
#' dc_reports(created_by = "urn:node:GOA")
#' dc_reports(limit = 3)
#' # dc_reports(ids = x$reports$id[1:3]) # FIXME: doesn't work
#' }}
dc_reports <- function(ids = NULL, platform = NULL, report_name = NULL,
  report_id = NULL, release = NULL, created = NULL, created_by= NULL,
  include = NULL, limit = 25, page = 1, ...) {

  assert(ids, "character")
  assert(platform, "character")
  assert(report_name, "character")
  assert(report_id, "character")
  assert(release, "character")
  assert(created, "character")
  assert(created_by, "character")
  assert(include, "character")
  assert(limit, c("numeric", "integer"))
  assert(page, c("numeric", "integer"))
  if (!is.null(ids)) ids <- paste0(ids, collapse = ",")
  args <- cpct(list(ids = ids, platform = platform,
    `report-name` = report_name,
    `report-id` = report_id, release = release, created = created,
    `created-by` = created_by, include = include, `page[size]` = limit,
    `page[number]` = page))
  as_dc(dc_GET("reports", args, ...), "reports")
}
