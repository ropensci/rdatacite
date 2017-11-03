#' DataCite REST API: single works
#'
#' @export
#' @param doi (character) a DOI
#' @param ... curl options passed on to [crul::HttpClient]
#' @seealso [dc_works()]
#' @family rest api methods
#' @examples \dontrun{
#' dc_work(doi = "10.5438/0012")
#' }
dc_work <- function(doi, ...) {
  dc_rest_GET("works", doi, ...)
}
