#' DataCite REST API: data centers
#'
#' @export
#' @param query (character) Query string, e.g., data center name
#' @param member_id (character) Member that the data center is associated with
#' @param offset (numeric/integer) result offset, the record to start at
#' @param rows (numeric/integer) results per page
#' @inheritParams dc_data_center
#' @seealso [dc_data_center()]
#' @family rest api methods
#' @examples \dontrun{
#' dc_data_centers(member_id = "delft")
#' dc_data_centers(member_id = "delft", include = "member")
#' }
dc_data_centers <- function(query = NULL, member_id = NULL, offset = 0,
	rows = 25, include = NULL, ...) {

  if (!is.null(include)) include <- paste0(include, collapse = ",")
	args <- dc_compact(list(query = query, `member-id` = member_id,
		offset = offset, rows = rows, include = include))
  dc_rest_GET("data-centers", args = args, ...)
}
