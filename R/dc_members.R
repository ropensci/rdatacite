#' DataCite REST API: members
#'
#' @export
#' @param query (character) Query string, e.g., data center name
#' @param member_type (character) member type, one of "allocating"
#' or "non-allocating"
#' @param region (character) Geographic region, one of "amer", "apac",
#' or "emea"
#' @param year (numeric/integer) year member joined DataCite
#' @inheritParams dc_member
#' @seealso [dc_member()]
#' @family rest api methods
#' @examples \dontrun{
#' dc_members(query = "ands")
#' }
dc_members <- function(query = NULL, member_type = NULL, region = NULL,
	year = NULL,  ...) {

	args <- dc_compact(list(query = query, `member-type` = member_type,
		region = region, year = year))
  dc_rest_GET("members", args = args, ...)
}
