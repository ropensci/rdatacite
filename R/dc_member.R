#' DataCite REST API: member
#'
#' @export
#' @param member_id (character) Member that the data center is associated with
#' @param ... curl options passed on to [crul::HttpClient]
#' @seealso [dc_members()]
#' @family rest api methods
#' @examples \dontrun{
#' dc_member("cern")
#' }
dc_member <- function(member_id, ...) {
  dc_rest_GET("members", member_id, ...)
}
