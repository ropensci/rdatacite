#' DataCite REST API: data center
#'
#' @export
#' @param data_center_id (character) a data center id
#' @param include (character) vector of member fields to return
#' @param ... curl options passed on to [crul::HttpClient]
#' @seealso [dc_data_centers()]
#' @family rest api methods
#' @examples \dontrun{
#' dc_data_center("cdl.dryad")
#' }
dc_data_center <- function(data_center_id, include = NULL, ...) {
  if (!is.null(include)) include <- paste0(include, collapse = ",")
	args <- dc_compact(list(include = include))
  dc_rest_GET("data-centers", data_center_id, args, ...)
}
