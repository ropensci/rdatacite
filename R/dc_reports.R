#' DataCite REST API: reports
#'
#' @export
#' @param ids (character) one or more report IDs
#' @param platform (character) x
#' @param report_name (character) x
#' @param report_id (character) x
#' @param release (character) x
#' @param created (character) x
#' @param created_by (character) x
#' @param include (character) vector of fields to return
#' @param limit (numeric/integer) results per page
#' @param page (numeric/integer) result page, the record to start at
#' @param ... curl options passed on to [crul::HttpClient]
#' @examples \dontrun{
#' x <- dc_reports()
#' x
#' dc_reports(limit = 3)
#' # dc_reports(ids = x$reports$id[1:3]) # FIXME: doesn't work
#' }
dc_reports <- function(ids = NULL, platform = NULL, report_name = NULL,
  report_id = NULL, release = NULL, created = NULL, created_by= NULL,
  include = NULL, limit = 25, page = 1, ...) {

  if (!is.null(ids)) ids <- paste0(ids, collapse = ",")
  args <- cpct(list(ids = ids, platform = platform,
    `report-name` = report_name,
    `report-id` = report_id, release = release, created = created,
    `created-by` = created_by, include = include, `page[size]` = limit,
    `page[number]` = page))
  as_dc(dc_GET("reports", args, ...), "reports")
}
