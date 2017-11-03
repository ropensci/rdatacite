#' DataCite REST API: person
#'
#' @export
#' @param person_id (character) Person identifier
#' @param ... curl options passed on to [crul::HttpClient]
#' @seealso [dc_people()]
#' @examples \dontrun{
#' dc_person("peope", verbose = TRUE)
#' }
dc_person <- function(person_id, ...) {
  dc_rest_GET("people", person_id, ...)
}

dc_people <- function(person_id, ...) {
  dc_rest_GET("contributors", ...)
}
